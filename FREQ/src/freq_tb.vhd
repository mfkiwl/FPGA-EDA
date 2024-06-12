library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity freq_tb is
end;

architecture bench of freq_tb is
  -- Clock period
  constant clk_period : time := 20 ns;
  -- Generics
  constant CNT_MAX : integer := 5;
  -- Ports
  signal clk_in : std_logic:='0';
  signal clk1 : std_logic:='0';
  signal clk2 : std_logic:='0';
  signal ena : std_logic:='1';
  signal com : std_logic_vector(7 downto 0);
  signal seg : std_logic_vector(7 downto 0);
begin

  freq_inst : entity work.freq
  generic map (
    CNT_MAX => CNT_MAX
  )
  port map (
    clk_in => clk_in,
    clk1 => clk1,
    clk2 => clk2,
    ena => ena,
    com => com,
    seg => seg
  );
-- clk <= not clk after clk_period/2;

    clk1 <= not clk1 after clk_period*6*6;
    clk2 <= not clk2 after clk_period*2;  
    clk_in <= not clk_in after clk_period;  

    -- process
    -- begin
    --     clr<='1';
    --     wait for clk_period*10;
    --     clr<='0';
    --     wait;
    -- end process;
    
    
end;
