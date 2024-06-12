library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity CNT6 is
    generic(
        CNT_MAX:integer:=6
    );
    port(
        clk:in std_logic;
        clr:in std_logic;
        ena:in std_logic;
        cq:out std_logic_vector(3 downto 0);
        co:out std_logic
    );
end;

architecture art of CNT6 is
    signal cnt_temp:integer range 0 to 10;
    begin
        process(clk)
        begin
            if(clr='1') then
                cnt_temp<=0;
            elsif(ena='1') then
                if(clk'event and clk='1') then
                    if(cnt_temp=CNT_MAX-1) then
                        cnt_temp<=0;
                    else 
                        cnt_temp<=cnt_temp+1;
                    end if;
                end if;
            end if;
        end process;

        process(clk)
        begin
            if(clk'event and clk='1') then
                if(cnt_temp=CNT_MAX-1) then
                    co<='1';
                else 
                    co<='0';
                end if;
            end if;      
        end process;

        cq<=conv_std_logic_vector(cnt_temp,4);

    end architecture;
