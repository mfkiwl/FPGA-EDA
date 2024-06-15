library ieee;
use ieee.std_logic_1164.all;
entity DISPLAY is
  port(hbcd:in std_logic_vector(3 downto 0);
       lbcd:in std_logic_vector(3 downto 0);
       selout:in std_logic_vector(3 downto 0);
       key1:in std_logic;
       key2:in std_logic;
       com: out std_logic_vector(7 downto 0);
      --  bcd: buffer std_logic_vector(3 downto 0);
      --  div2clk: buffer std_logic;
       seg: out std_logic_vector(7 downto 0));
end entity;
architecture art of DISPLAY is
  signal bcd: std_logic_vector(3 downto 0);
  signal key:std_logic_Vector(1 downto 0);
  begin 
  key<= key1&key2;
  process(selout) is
  begin
    if(key="00") then
--when key="00",the digtal shows seconds,minutes,and hours on sepatate digit segments
    case selout is
      --sec
      when"0000" => com<="11111110";bcd<=lbcd;
      when"0001" => com<="11111101";bcd<=hbcd;

      --min
      when"0010" => com<="11110111";bcd<=lbcd;
      when"0011" => com<="11101111";bcd<=hbcd;

      --hour
      when"0100" => com<="10111111";bcd<=lbcd;
      when"0101" => com<="01111111";bcd<=hbcd;

      when others=> com<="11111111";bcd<="1111";
      end case;

      elsif(key="01") then
--when key="01",the digtal shows date and month on sepatate digit segments
      case selout is
      --day
      when"0110" => com<="11111110";bcd<=lbcd;
      when"0111" => com<="11111101";bcd<=hbcd;

      --mon
      when"1000" => com<="11110111";bcd<=lbcd;
      when"1001" => com<="11101111";bcd<=hbcd;

      when others=> com<="11111111";bcd<="1111";
      end case;

      elsif(key="10") then
--when key="10",the digtal shows year and week on sepatate digit segments   
      case selout is
      --year
      when"1010" => com<="11111110";bcd<=lbcd;
      when"1011" => com<="11111101";bcd<=hbcd;
      --year
      when"1100" => com<="11111011";bcd<=lbcd;
      when"1101" => com<="11110111";bcd<=hbcd;

      --weak
      when"1110" => com<="10111111";bcd<=lbcd;

      when others=> com<="11111111";bcd<="1111";
      end case;
      end if;

    case bcd is
      when "0000" => seg<="00111111";--3fh
      when "0001" => seg<="00000110";--06h
      when "0010" => seg<="01011011";--5bh
      when "0011" => seg<="01001111";--4fh
      when "0100" => seg<="01100110";--66h
      when "0101" => seg<="01101101";--6dh
      when "0110" => seg<="01111101";--7dh
      when "0111" => seg<="00000111";--07h
      when "1000" => seg<="01111111";--7fh
      when "1001" => seg<="01101111";--6fh
      when others => seg<="00000000";--00h
    end case;
  end process;

end architecture;

