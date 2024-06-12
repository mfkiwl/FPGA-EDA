library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity DTTIMES_tb is
end;

architecture bench of DTTIMES_tb is
  -- Clock period
  constant clk_period : time := 20 ns;
  -- Generics
  constant CNT_MAX : integer := 6;

    component DTTIMES
    generic (
        CNT_MAX : integer
    );
    port (
        clk1 : in std_logic;
        clk2 : in std_logic;
        clr : in std_logic ;
        ena : in std_logic ;
        com : out std_logic_vector(7 downto 0);
        seg : out std_logic_vector(7 downto 0)
    );
    end component;

  -- Ports
  signal clk1 : std_logic:='0';
  signal clk2 : std_logic:='0';
  signal clr : std_logic :='1';
  signal ena : std_logic :='1';
  signal com : std_logic_vector(7 downto 0);
  signal seg : std_logic_vector(7 downto 0);

begin

    DTTIMS_inst : DTTIMES
    generic map (
        CNT_MAX => CNT_MAX
    )
    port map (
        clk1 => clk1,
        clk2 => clk2,
        clr => clr,
        ena => ena,
        com => com,
        seg => seg
    );

    clk1 <= not clk1 after clk_period*6;
    clk2 <= not clk2 after clk_period;

    process
    begin
        clr<='1';
        wait for clk_period*10;
        clr<='0';
        wait;
    end process;

    -- clr<='1';
    -- wait for clk_period*10;
    -- clr<='0';
    -- wait;
     
end;