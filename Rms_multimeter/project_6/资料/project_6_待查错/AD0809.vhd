library ieee;
use ieee.std_logic_1164.all;
entity AD0809 is
  port(clk,eoc:in std_logic;
       din:in std_logic_vector(7 downto 0);
       start,oe,ale:out std_logic;
       rom_data_clk:out std_logic;  
       dout:out std_logic_vector(7 downto 0));
end entity AD0809;
architecture  art of AD0809 is
  signal s_rom_data_clk:std_logic:='1';
  begin
    process(clk)
    variable x,y:std_logic:='1';
    variable state:integer range 0 to 2:=0;
    begin 
      if clk'event and clk='1' then 
        if x='0' then --Initial Configuration
          case state is --Requires 3 clocks.
            when 0 => ale<='1';--Address latch signal, input, active high
                      state:=1;
            when 1 => start<='1';--A/D conversion start signal
                      state:=2;
            when 2 => ale<='0';--Close address latch signal
                      start<='0';--Close the start-up end of AD conversion
                      state:=0;
                      x:='1';--Starting AD conversion processing
          end case;
        else 
          if eoc='0' then --AD conversion not completed
            y:='1';
          end if;--It takes about 4 CLK clocks.
          if y='1' then  -- eoc='0'
            if eoc='1' then --eoc='1',Rising edge
              case state is --Requires 3 clocks.
                when 0 =>oe<='1';--Data output enable signal
                         state:=1;
                         s_rom_data_clk<=not s_rom_data_clk;
                when 1 =>dout<=din;--Output AD conversion data
                         state:=2;
                when 2 =>oe<='0';--Output AD conversion data
                        x:='0';--Return to initial settings
                        y:='0';
              end case;
              rom_data_clk<=s_rom_data_clk;
            end if;
          end if;
        end if;
      end if;--Each sampling process takes about 10 CLK cycles in total.
      --8000 times require 10*8k=80k
    end process;
end art;
      