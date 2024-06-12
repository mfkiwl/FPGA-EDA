library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity clk_div_and_data_reg is
    generic(
        CNT_MAX:integer:=5
    );
    port(
        clk_in:in std_logic;
        data_in:in std_logic_vector(31 downto 0);
        data_out:out std_logic_vector(31 downto 0);     
        clr:out std_logic   
    );
end;

architecture art of clk_div_and_data_reg is 
    --signal
    signal cnt_temp:integer range 0 to integer'high;

    --method 1
    constant clr_num:integer:=2;

    --method 2  
    signal clk_1s:std_logic;
    signal flag_reg_clr:std_logic:='0';

   
    begin

        --method 1
        process(clk_in)
        begin
            if(clk_in'event and clk_in='1') then
                if(cnt_temp=(CNT_MAX-1+clr_num)) then
                    cnt_temp<= 0;
                else
                    cnt_temp<=cnt_temp+1;
                end if;
            end if;
        end process;   
        
        process (clk_in)
        begin
            if(clk_in'event and clk_in='1') then
                if(cnt_temp>=(CNT_MAX-1)) and (cnt_temp<=(CNT_MAX-1+clr_num-1)) then
                    clr<='1';
                else
                    clr<='0';
                end if;
            end if;            
        end process;

        process (clk_in)
        begin
            if(clk_in'event and clk_in='1') then
                if(cnt_temp=(CNT_MAX-1)) then
                    data_out<=data_in;
                else
                    data_out<=data_out;
                end if;
            end if;            
        end process;     
        

        -- --method 2

        -- --通过计数器产生1s周期的触发信号clk_1s
        -- process(clk_in)
        -- begin
        --     if(clk_in'event and clk_in='1') then
        --         -- if(cnt_temp=(CNT_MAX-1)) then
        --         if(cnt_temp=(CNT_MAX)) then
        --             cnt_temp<= 0;
        --             clk_1s<='1';
        --         else
        --             cnt_temp<=cnt_temp+1;
        --             clk_1s<='0';
        --         end if;
        --     end if;
        -- end process;   
        
        -- --clk_1s上升沿时，翻转标志位
        -- process (clk_1s)
        -- begin
        --     if(clk_1s'event and clk_1s='1') then
        --         flag_reg_clr<= not flag_reg_clr;
        --     end if;            
        -- end process;

        -- --clk_1s上升沿时，表示1s计数完毕
        -- --flag=0表示处于计数状态
        -- process (clk_1s)
        -- begin
        --     if(clk_1s'event and clk_1s='1') then
        --         if(flag_reg_clr='0') then
        --             data_out<=data_in;
        --         end if;
        --     end if;            
        -- end process;        

        -- --flag=0表示计数值一直清零
        -- process (clk_in)
        -- begin
        --     if(rising_edge(clk_in)) then
        --         if(flag_reg_clr='1') then
        --             clr<='1';--清零信号高电平有效
        --         else 
        --             clr<='0';
        --         end if;
        --     end if;            
        -- end process;         


end architecture;


