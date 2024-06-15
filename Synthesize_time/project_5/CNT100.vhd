library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity CNT100 is
  port(ld:in std_logic;--Set signal (active low)
       clk:in std_logic;--Clock pulse (rising edge triggered))
       data:in std_logic_vector(6 downto 0);
       num:buffer std_logic_vector(6 downto 0);
       key6:in std_logic;
       co : out std_logic);--carry signal
end entity CNT100;
architecture art of CNT100 is
  begin
  process(clk,ld) is
  begin
    if(ld='0') then
      num<=data;
    elsif((clk'event and clk='1')and key6='0') then
      if(num="1100100") then
        num<="0000000";co<='1';
      else
        num<=num+'1';co<='0';
      end if;
    end if;
  end process;
end architecture; 



