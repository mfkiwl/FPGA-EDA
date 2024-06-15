-- vhdl test bench template for design  :  top
-- 
-- simulation tool : modelsim-altera (vhdl)
-- 

library ieee;                                               
use ieee.std_logic_1164.all;                                

entity top_vhd_tst is
end top_vhd_tst;
architecture top_arch of top_vhd_tst is
-- constants                                                 
-- signals                                                   
signal ale1 : std_logic:='1';
signal ale2 : std_logic:='1';
signal clk24M : std_logic:='1';
signal dout : std_logic_vector(7 downto 0):="00000000";
signal key : std_logic_vector(2 downto 0):="000";
signal oe1 : std_logic:='1';
signal oe2 : std_logic:='1';
--signal s_shizaigonglv : std_logic_vector(17 downto 0):="000000000000000000";
signal sel : std_logic_vector(7 downto 0):="00000000";
signal start1 : std_logic:='1';
signal start2 : std_logic:='1';
constant clk_period:time:=10 ps;
component top
	port (
	ale1 : buffer std_logic;
	ale2 : buffer std_logic;
	clk24M : in std_logic;
	dout : buffer std_logic_vector(7 downto 0);
	key : in std_logic_vector(2 downto 0);
	oe1 : buffer std_logic;
	oe2 : buffer std_logic;
	--s_shizaigonglv : buffer std_logic_vector(17 downto 0);
	sel : buffer std_logic_vector(7 downto 0);
	start1 : buffer std_logic;
	start2 : buffer std_logic
	);
end component;
begin
	i1 : top
	port map (
-- list connections between master ports and signals
	ale1 => ale1,
	ale2 => ale2,
	clk24M => clk24M,
	dout => dout,
	key => key,
	oe1 => oe1,
	oe2 => oe2,
	--s_shizaigonglv => s_shizaigonglv,
	sel => sel,
	start1 => start1,
	start2 => start2
	);
	clk24M <= not clk24M after clk_period/2; 
 ji:process
 begin
	key<="000";
	wait;
	end process;

end top_arch;
