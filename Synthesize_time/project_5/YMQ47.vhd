library ieee;
use ieee.std_logic_1164.all;
entity YMQ47 is
  port(bcd4:in std_logic_vector(3 downto 0);
       selout8:out std_logic_vector(7 downto 0));
end entity;
architecture art of YMQ47 is
  begin
  process(bcd4) is
    begin
    case bcd4 is
      when "0000" => selout8<="00111111";--3fh
      when "0001" => selout8<="00000110";--06h
      when "0010" => selout8<="01011011";--5bh
      when "0011" => selout8<="01001111";--4fh
      when "0100" => selout8<="01100110";--66h
      when "0101" => selout8<="01101101";--6dh
      when "0110" => selout8<="01111101";--7dh
      when "0111" => selout8<="00000111";--07h
      when "1000" => selout8<="01111111";--7fh
      when "1001" => selout8<="01101111";--6fh
      when others => selout8<="00000000";--00h
    end case;
  end process;
end architecture;
      