library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
entity XSKZQ is
    port(clk_scan:in std_logic;
         --Scanning clock requires a fast speed
         sec,min:in std_logic_vector(5 downto 0);
         hour:in std_logic_vector(4 downto 0);
         day:in std_logic_vector(4 downto 0);
         mon:in std_logic_vector(3 downto 0);
         year:in std_logic_vector(6 downto 0);
         week:in std_logic_vector(2 downto 0);
         selout:out std_logic_vector(3 downto 0);
         hbcd,lbcd:out std_logic_vector(3 downto 0));
end entity XSKZQ;

architecture art of XSKZQ is
    signal temp1,temp2:integer range 0 to 9;
    signal cnt:std_logic_vector(3 downto 0);
    begin
    process(clk_scan) is
    begin
        if clk_scan'event and clk_scan='1' then
            if cnt="1111" then
                cnt<="0000";
            else
                cnt<=cnt + '1';
            end if;
        end if;
    end process;
    selout<=cnt;

    process(cnt) is
      begin
      case cnt is
          when"0000" =>temp1<=conv_integer(sec)-conv_integer(sec)/10*10;
          when"0001" =>temp2<=(conv_integer(sec))/10;
          --sec
          when"0010" =>temp1<=conv_integer(min)-conv_integer(min)/10*10;
          when"0011" =>temp2<=(conv_integer(min))/10;
          --min
          when"0100" =>temp1<=conv_integer(hour)-conv_integer(hour)/10*10;
          when"0101" =>temp2<=conv_integer(hour)/10;
          --hour
          when"0110" =>temp1<=conv_integer(day)-conv_integer(day)/10*10;
          when"0111" =>temp2<=conv_integer(day)/10;
          --day
          when"1000" =>temp1<=conv_integer(mon)-conv_integer(mon)/10*10;
          when"1001" =>temp2<=conv_integer(mon)/10;
          --mon
          when"1010" =>temp1<=conv_integer(year)-conv_integer(year)/10*10;
          when"1011" =>temp2<=conv_integer(year)/10;
          --year
          when"1100" =>temp1<=0;
          when"1101" =>temp2<=2;
          --year
          when"1110" =>temp1<=conv_integer(week)-conv_integer(week)/10*10;
          when"1111" =>temp2<=conv_integer(week)/10;
          --weak
          when others=>temp1<=0;temp2<=0;
      end case;
      
    case temp1 is
        when 0 =>lbcd<="0000";
        when 1 =>lbcd<="0001";
        when 2 =>lbcd<="0010";
        when 3 =>lbcd<="0011";
        when 4 =>lbcd<="0100";
        when 5 =>lbcd<="0101";
        when 6 =>lbcd<="0110";
        when 7 =>lbcd<="0111";
        when 8 =>lbcd<="1000";
        when 9 =>lbcd<="1001";
        when others =>lbcd<="0000";
    end case;

    case temp2 is
        when 0 =>hbcd<="0000";
        when 1 =>hbcd<="0001";
        when 2 =>hbcd<="0010";
        when 3 =>hbcd<="0011";
        when 4 =>hbcd<="0100";
        when 5 =>hbcd<="0101";
        when 6 =>hbcd<="0110";
        when 7 =>hbcd<="0111";
        when 8 =>hbcd<="1000";
        when 9 =>hbcd<="1001";
        when others =>hbcd<="0000";
    end case;

    end process;

end architecture art;
