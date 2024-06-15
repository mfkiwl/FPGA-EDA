library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
entity quzhiliu is
  port(v:in std_logic_vector(7 downto 0);
       dout:out std_logic_vector(7 downto 0));
end quzhiliu;
architecture art of quzhiliu is
  begin 
  process(v)
  begin 
  if(v>"10000000") then 
    dout<=v - "10000000";
  else
    dout<="10000000"-v;
  end if;
  end process;
  end art;
