library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity CNT6_tb is
end;

architecture bench of CNT6_tb is
  -- Clock period
  constant clk_period : time := 20 ns;
  -- Generics
  constant CNT_MAX : integer := 6;
  -- Ports
  signal clk : std_logic:='1';
  signal clr : std_logic:='1';
  signal ena : std_logic:='1';
  signal cq : std_logic_vector(3 downto 0);
  signal co : std_logic;
begin

  CNT6_inst : entity work.CNT6
  generic map (
    CNT_MAX => CNT_MAX
  )
  port map (
    clk => clk,
    clr => clr,
    ena => ena,
    cq => cq,
    co => co
  );

    clk <= not clk after clk_period/2;
    process
    begin
        clr<='1';
        wait for clk_period*10;
        clr<='0';
        wait;
    end process;


end;