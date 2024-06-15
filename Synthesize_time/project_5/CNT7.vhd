library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity CNT7 is
  port(ld:in std_logic;--Set signal (active low)
       clk:in std_logic;--Clock pulse (rising edge triggered))
       data:in std_logic_vector(2 downto 0);
       key6:in std_logic;
       num:buffer std_logic_vector(2 downto 0));
end entity CNT7;
architecture art of CNT7 is
  begin
  process(clk,ld) is
  begin
    if(ld='0') then
      num<=data;
--The counting stops if the set signal is active
    elsif((clk'event and clk='1')and key6='0') then
      if(num="111") then
        num<="000";
      else
        num<=num+1;
      end if;
    end if;
  end process;
end architecture; 



