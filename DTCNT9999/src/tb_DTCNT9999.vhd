library ieee;
use ieee.std_logic_1164.all;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_DCNT9999 is
--end entity;
--end tb_DCNT9999;
--end entity tb_DCNT9999;
end;

architecture art of tb_DCNT9999 is
    
    --定义常量
    constant clk_period: time := 20 ns;

    --元件说明
    component DTCNT9999 
        port(
            clk1:in std_logic;
            clk2:in std_logic;
            clr:in std_logic;
            com:out std_logic_vector(7 downto 0);
            ena:in std_logic;
            seg:out std_logic_vector(7 downto 0)
        );
    end component;

    -- component DTCNT9999 
    --     port(
    --         CLK1:in std_logic;
    --         CLK2:in std_logic;
    --         CLR:in std_logic;
    --         COM:out std_logic_vector(7 downto 0);
    --         ENA:in std_logic;
    --         SEG:out std_logic_vector(7 downto 0)
    --     );
    -- end component;    

    --定义信号
    signal clk1 :std_logic:='0';
    signal clk2 :std_logic:='0';
    signal clr :std_logic:='1';
    signal com :std_logic_vector(7 downto 0);
    signal ena :std_logic := '1';
    signal seg :std_logic_vector(7 downto 0);

    --功能描述
    begin
    --元件例化
    -- u1:DTCNT9999 port map(CLK1=clk1,CLK2=clk2,CLR=clr,COM=com,ENA=ena,SEG=seg);
    -- u1:DTCNT9999 port map(clk1,clr,ena,clk2,com,seg);
    u1:DTCNT9999 port map(clk1,clk2,clr,com,ena,seg);

    --进程
    clk1_gen:process
        begin
            wait for clk_period*2;
            clk1<='1';
            wait for clk_period*2;
            clk1<='0';
        end process;

    clk2_gen:process
        begin
            wait for clk_period;
            clk2<='1';
            wait for clk_period;
            clk2<='0';
        end process;   
    
    clr_gen:process
        begin
            clr<='1';
            wait for clk_period*10;
            clr<='0';
            wait;
        end process;

--end architecture;
--end art;
--end architecture art;
end;



