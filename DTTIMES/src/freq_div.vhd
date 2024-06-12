library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity freq_div is
    generic(
        CNT_MAX:integer:=5
    );
    port(
        clk_in:in std_logic;
        clk_out:out std_logic
    );
end;

architecture art of freq_div is 
    --signal
    signal cnt_temp:std_logic_vector(13 downto 0):=b"0000_0000_0000_00";
   
    begin

        process(clk_in)
        begin
            if(clk_in'event and clk_in='1') then
                if(cnt_temp=conv_std_logic_vector(CNT_MAX-1,14)) then
                    cnt_temp<= b"0000_0000_0000_00";
                    -- cnt_temp<= "00000000000000";
                    clk_out<='1';
                else
                    cnt_temp<=cnt_temp+'1';
                    clk_out<='0';
                end if;
            end if;
        end process;        
        
end architecture;


