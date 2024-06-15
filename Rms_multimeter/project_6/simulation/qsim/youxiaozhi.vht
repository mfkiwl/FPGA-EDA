-- vhdl test bench template for design  :  youxiaozhi
-- 
-- simulation tool : modelsim-altera (vhdl)
-- 

library ieee;                                               
use ieee.std_logic_1164.all;                                
use std.env.stop;
entity youxiaozhi_vhd_tst is
end youxiaozhi_vhd_tst;
architecture youxiaozhi_arch of youxiaozhi_vhd_tst is
-- constants                                                 
-- signals                                                   
signal clk8k : std_logic:='1';
signal clk648 : std_logic:='1';
signal din : std_logic_vector(7 downto 0);
signal dout : std_logic_vector(13 downto 0);
constant clk_period:time:=10 ps;
-- constant run_period:time:=1000 ps;
component youxiaozhi
	port (
	clk8k : in std_logic;
	clk648 : in std_logic;
	din : in std_logic_vector(7 downto 0);
	dout : buffer std_logic_vector(13 downto 0)
	);
end component;
begin
	i1 : youxiaozhi
	port map (
-- list connections between master ports and signals
	clk8k => clk8k,
	clk648 => clk648,
	din => din,
	dout => dout
	);
	--where should the position of the incentive signal be placed?
	--where should the position of the incentive signal be placed?
	clk8k <= not clk8k after clk_period/2;   
	clk648 <= not clk648 after clk_period/2;   
-- test_clk: process                                       
-- begin
-- 	clk8k<='0';
-- 	clk648<='0';
-- 	wait for clk_period/2;
-- 	clk8k<='1';
-- 	clk648<='0';
-- 	wait for clk_period/2;
-- 	-- if now >run_period then
-- 	-- wait;
-- 	-- end if;

-- end process;

test_data:process
begin
	din<="00000000","01111110" after 20 ps;
	wait;
	-- if now >run_period then
	-- 	wait;
	-- end if;
end process;

-- run:process
-- begin
-- 	if now >run_period then
-- 		stop;
-- 	end if;
-- 	report "Simulation stopped at "& time'image(now);
-- end process;



end youxiaozhi_arch;
