library ieee;
use ieee.std_logic_1164.all;
entity YMQ38 is
  port(din:in std_logic_vector(2 downto 0);
       dout:out std_logic_vector(7 downto 0));
end entity;
architecture art of YMQ38 is
  begin
  process(din) is
    begin
    case din is
      when "000" => dout<="11111110";
      when "001" => dout<="11111101";
      when "010" => dout<="11111011";
      when "011" => dout<="11110111";
      when "100" => dout<="11101111";
      when "101" => dout<="11011111";
      when "110" => dout<="10111111";
      when "111" => dout<="01111111";
      when others=> dout<="11111111";
    end case;
  end process;
end architecture;
      