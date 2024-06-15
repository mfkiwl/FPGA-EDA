library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
entity xuanze is
  port(k:in std_logic_vector(2 downto 0);
       din0,din1:in std_logic_vector(13 downto 0);--youxiaozhi
       din2:in std_logic_vector(17 downto 0);--yougong
       din3:in std_logic_vector(17 downto 0);--wugong
       din4:in std_logic_vector(17 downto 0);--gonglvyinsu
       dout:out std_logic_vector(15 downto 0);
       dout7:out std_logic_vector(4 downto 0));
end xuanze;
architecture art of xuanze is
  begin
  process(k,din0,din1,din2,din3,din4)
  begin
  case k is 
  when "000" =>dout<="00"&din0;
               dout7<="00000";
  when "001" =>dout<="00"&din1;
               dout7<="00001";
  when "010" =>dout<=din2(15 downto 0);
               dout7<="00010";
  when "011" =>dout<=din3(15 downto 0);
               dout7<="00011";                              
  when "100" =>dout<=din4(15 downto 0);
               dout7<="00100";
  when others=>null;
  end case;
  end process;  
end art;

  