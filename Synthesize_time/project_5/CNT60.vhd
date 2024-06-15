library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity CNT60 is
  port(ld:in std_logic;--Set signal (active low)
       clr:in std_logic;--Clear signal (active high)
       clk:in std_logic;--Clock pulse (rising edge triggered))
       data:in std_logic_vector(5 downto 0);
       num:buffer std_logic_vector(5 downto 0);
       key6:in std_logic;
       co:out std_logic);--carry signal
end entity CNT60;
architecture art of CNT60 is 
  begin
  process(clk,ld,clr) is
  begin
  	if(clr='1') then
		num<="000000";
    elsif(ld='0') then
    num<=data;
    elsif((clk'event and clk='1')and key6='0') then
        if num="111011" then --59
          num<="000000" ; co<='1';
        else 
          num<=num+1;co<='0';
        end if;
    end if;
  end process;     
end architecture;


















