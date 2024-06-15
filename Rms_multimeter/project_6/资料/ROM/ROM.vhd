library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity ROM is
  port(clk:in std_logic;
       din1:out std_logic_vector (7 downto 0);
       din2:out std_logic_vector (7 downto 0));
end ROM;
architecture art of ROM is
--component
component sin is
	port
	(
		address		: in std_logic_vector (7 downto 0);
		clock		: in std_logic  := '1';
		q		: out std_logic_vector (7 downto 0)
	);
end component sin;
component cos is
	port
	(
		address		: in std_logic_vector (7 downto 0);
		clock		: in std_logic  := '1';
		q		: out std_logic_vector (7 downto 0)
	);
end component cos;

signal s_address:std_logic_vector (7 downto 0);

begin
  process(clk)
  begin
  if(clk'event and clk='1') then
    s_address<=s_address+1;
  end if;
  end process;

  u0:sin port map(s_address,clk,din1);
  u1:cos port map(s_address,clk,din2); 
end architecture;

