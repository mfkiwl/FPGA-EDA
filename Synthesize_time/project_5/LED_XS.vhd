library ieee;
use ieee.std_logic_1164.all;
entity LED_XS is
  port(sec_en ,min_en,hour_en,day_en,
       mon_en,year_en,week_en:in std_logic;
       led1: out std_logic;
       led2: out std_logic;
       led3: out std_logic;
       led4: out std_logic;
       led5: out std_logic;
       led6: out std_logic;
       led7: out std_logic;
       led8: out std_logic);
end entity led_xs;
architecture art of led_xs is
  begin
  process(sec_en ,min_en,hour_en,day_en,mon_en,year_en,week_en) is
  begin

    if(sec_en='1' and min_en='1' and hour_en='1' and day_en='1'
       and mon_en='1'and year_en='1'and week_en='1')    then 
    led1<='1';led2<='1';led3<='1';led4<='1';
    led5<='1';led6<='1';led7<='1';led1<='1';
    end if;--give an initial state

    if(sec_en = '0') then
      led1<='0';
    else led1<='1';
    end if;

    if(min_en = '0') then
      led2<='0';
    else led2<='1';
    end if;

    if(hour_en = '0') then
      led3<='0';
    else led3<='1';
    end if;

    if(day_en = '0') then
      led4<='0';
    else led4<='1';
    end if;

    if(mon_en = '0') then
      led5<='0';
    else led5<='1';
    end if;

    if(year_en = '0') then
      led6<='0';
    else led6<='1';
    end if;

    if(week_en = '0') then
      led7<='0';
    else led7<='1';
    end if;
      
    led8<='1';

    end process;
end architecture;












