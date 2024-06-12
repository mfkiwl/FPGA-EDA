library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;


ENTITY DISPLAY IS
  PORT(SEL: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
       DATAIN: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
       COM: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
       SEG: OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END ENTITY DISPLAY;
ARCHITECTURE ART OF DISPLAY IS
  SIGNAL DATA:integer range 0 to 10;
  signal data_integer:integer range 0 to integer'high;

  BEGIN

  data_integer <= conv_integer(DATAIN);

  PROCESS(SEL) IS
    BEGIN
    CASE SEL IS
      WHEN "000" => COM<="11111110";
      WHEN "001" => COM<="11111101";
      WHEN "010" => COM<="11111011";
      WHEN "011" => COM<="11110111";
      WHEN "100" => COM<="11101111";
      WHEN "101" => COM<="11011111";
      WHEN "110" => COM<="10111111";
      WHEN "111" => COM<="01111111";
      WHEN OTHERS => COM<="11111111";
    END CASE ;
  END PROCESS;
  PROCESS(SEL) IS
    BEGIN
    CASE SEL IS
      WHEN "000" =>DATA<=((data_integer / 1) mod 10);
      WHEN "001" =>DATA<=((data_integer / 10) mod 10);
      WHEN "010" =>DATA<=((data_integer / 100) mod 10);
      WHEN "011" =>DATA<=((data_integer / 1000) mod 10);
      WHEN "100" =>DATA<=((data_integer / 10000) mod 10);
      WHEN "101" =>DATA<=((data_integer / 100000) mod 10);
      WHEN "110" =>DATA<=((data_integer / 1000000) mod 10);
      WHEN "111" =>DATA<=((data_integer / 10000000) mod 10);
      WHEN OTHERS=>DATA<=0;
    END CASE;
       CASE DATA IS
      WHEN 0 => SEG<="00111111";--3FH
      WHEN 1 => SEG<="00000110";--06H
      WHEN 2 => SEG<="01011011";--5BH
      WHEN 3 => SEG<="01001111";--4FH
      WHEN 4 => SEG<="01100110";--66H
      WHEN 5 => SEG<="01101101";--6DH
      WHEN 6 => SEG<="01111101";--7DH
      WHEN 7 => SEG<="00000111";--07H
      WHEN 8 => SEG<="01111111";--7FH
      WHEN 9 => SEG<="01101111";--6FH
      WHEN OTHERS => SEG<="00000000";--00H
   END CASE ;
 END PROCESS;
END ARCHITECTURE ART;
