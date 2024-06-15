library ieee;
use ieee.std_logic_1164.all;
entity TOP is
  port(clk:in std_logic;--clock frequency division
   s_sec_en:buffer std_logic;
   s_min_en:buffer std_logic;
   s_hour_en:buffer std_logic;
   s_day_en:buffer std_logic;
   s_mon_en:buffer std_logic;
   s_year_en:buffer std_logic;
   s_week_en:buffer std_logic;
   s_selout:buffer std_logic_vector(3 downto 0);
   s_newclk:buffer std_logic;
       key1:in std_logic;--key
       key2:in std_logic;
       key3:in std_logic;
       key4:in std_logic;
       key5:in std_logic;
       key6:in std_logic;
       led1:out std_logic;--led
       led2:out std_logic;
       led3:out std_logic;
       led4:out std_logic;
       led5:out std_logic;
       led6:out std_logic;
       led7:out std_logic;
       led8:out std_logic;
       com:out std_logic_vector(7 downto 0);--common select
       seg:out std_logic_vector(7 downto 0);--segment select 
       clr:in std_logic);--Clear signal (active high)
end entity;
architecture art of TOP is

  component CNT7 is
    port(ld:in std_logic;--Set signal (active low)
         clk:in std_logic;--Clock pulse (rising edge triggered))
         data:in std_logic_vector(2 downto 0);
         key6:in std_logic;
         num:buffer std_logic_vector(2 downto 0));
  end component CNT7;

  component CNT12 is
    port(ld:in std_logic;--Set signal (active low)
         clk:in std_logic;--Clock pulse (rising edge triggered))
         data:in std_logic_vector(3 downto 0);
         num:buffer std_logic_vector(3 downto 0);
         key6:in std_logic;
         co:out std_logic);--carry signal
  end component CNT12;

  component CNT24 is
    port(ld:in std_logic;--Set signal (active low)
         clk:in std_logic;--Clock pulse (rising edge triggered))
         data:in std_logic_vector(4 downto 0);
         num:buffer std_logic_vector(4 downto 0);
         key6:in std_logic;
         co:out std_logic);--carry signal
  end component CNT24;

  component CNT30 is 
   port(ld: in std_logic;--Set signal (active low)
	     clk:in std_logic;--Clock pulse (rising edge triggered)
		   datain: in std_logic_vector(4 downto 0);--preset value
		   year :in std_logic_vector(6 downto 0);--current year
		   yue: in std_logic_vector(3 downto 0);--current month
		   num: buffer std_logic_vector( 4 downto 0);--counting result  
		   maxday: out std_logic_vector(4 downto 0);--total number of days in this month
       key6:in std_logic;  
		   co : out std_logic);--carry signal
  end component CNT30;

  component CNT60 is
    port(ld:in std_logic;--Set signal (active low)
        clr:in std_logic;--Clear signal (active high)
        clk:in std_logic;--Clock pulse (rising edge triggered))
        data:in std_logic_vector(5 downto 0);
        num:buffer std_logic_vector(5 downto 0);
        key6:in std_logic;
        co:out std_logic);--carry signal
  end component CNT60;

  component CNT100 is
    port(ld:in std_logic;--Set signal (active low)
         clk:in std_logic;--Clock pulse (rising edge triggered))
         data:in std_logic_vector(6 downto 0);
         num:buffer std_logic_vector(6 downto 0);
         key6:in std_logic;
         co : out std_logic);--carry signal
  end component CNT100;

  component DISPLAY is
    port(hbcd:in std_logic_vector(3 downto 0);
         lbcd:in std_logic_vector(3 downto 0);
         selout:in std_logic_vector(3 downto 0);
         key1: in std_logic;
         key2: in std_logic;
         --Clock display for date, with a period of 1 second
         com: out std_logic_vector(7 downto 0);
        --  bcd: buffer std_logic_vector(3 downto 0);
        --  div2clk: buffer std_logic;
         seg: out std_logic_vector(7 downto 0));
  end component;

  component TZKZQ is
    port(key3: in std_logic;  
	       key4: in std_logic;
         key5: in std_logic;
         key6: in std_logic;
         clk_key:in std_logic;
         max_days:in std_logic_vector(4 downto 0);
         sec_en ,min_en,hour_en,day_en,
         mon_en,year_en,week_en:out std_logic;
         hour_cur:in std_logic_vector(4 downto 0);
         min_cur,sec_cur:in std_logic_vector(5 downto 0);
         year_cur:in std_logic_vector(6 downto 0);
         mon_cur:in std_logic_vector(3 downto 0);
         day_cur:in std_logic_vector(4 downto 0);
         week_cur:in std_logic_vector(2 downto 0);
         sec,min:buffer std_logic_vector(5 downto 0);
         hour:buffer std_logic_vector(4 downto 0);
         day:buffer std_logic_vector(4 downto 0);
         mon:buffer std_logic_vector(3 downto 0);
         year:buffer std_logic_vector(6 downto 0);
         week:buffer std_logic_vector(2 downto 0));
  end component TZKZQ;

  component XSKZQ is
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
  end component XSKZQ;

  component LED_XS is
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
  end component LED_XS;

  component CLKGEN is
    port(clk: in std_logic;
         newclk: out std_logic);
  end component CLKGEN;

  signal s_sec,s_min:std_logic_vector(5 downto 0);
  signal s_hour:std_logic_vector(4 downto 0);
  signal s_day:std_logic_vector(4 downto 0);
  signal s_mon:std_logic_vector(3 downto 0);
  signal s_year:std_logic_vector(6 downto 0);
  signal s_week:std_logic_vector(2 downto 0);

  -- signal s_sec_en:std_logic;
  -- signal s_min_en:std_logic;
  -- signal s_hour_en:std_logic;
  -- signal s_day_en:std_logic;
  -- signal s_mon_en:std_logic;
  -- signal s_year_en:std_logic;
  -- signal s_week_en:std_logic;

  signal s_sec_cur,s_min_cur:std_logic_vector(5 downto 0);
  signal s_hour_cur:std_logic_vector(4 downto 0);
  signal s_day_cur:std_logic_vector(4 downto 0);
  signal s_mon_cur:std_logic_vector(3 downto 0);
  signal s_year_cur:std_logic_vector(6 downto 0);
  signal s_week_cur:std_logic_vector(2 downto 0);

  signal s_sec_co60,s_min_co60,s_co24,s_co30,s_co12,s_co100:std_logic;

  -- signal s_newclk:std_logic;
  signal s_lbcd,s_hbcd:std_logic_vector(3 downto 0);
  -- signal s_selout:std_logic_vector(3 downto 0);
  signal s_maxday:std_logic_vector(4 downto 0);
  
  begin 

  u1:CLKGEN
    port map(clk,s_newclk);
    --clk is used as the clk_scan in XSKZQ
    --newclk is used as clk_key in TZKZQ

  u2:CNT7
    port map(s_week_en,s_co24,s_week,key6,s_week_cur);
    --The first is the signal_week_en from the TZKZQ
    --The Second is the signal_co from the CNT24
    --The Third is the signal_week from the TZKZQ
    --The Fourth is the signal_week_cur sent to the TZKZQ

    
  u3:CNT12
    port map(s_mon_en,s_co30,s_mon,s_mon_cur,key6,s_co12);
    --The first is the signal_mon_en from the TZKZQ
    --The Second is the signal_co from the CNT30
    --The Third is the signal_mon from the TZKZQ
    --The Fourth is the signal_mon_cur sent to the TZKZQ
    --The Five is the signal_mon_clk sent to the CNT100

  u4:CNT24
    port map(s_hour_en,s_min_co60,s_hour,s_hour_cur,key6,s_co24);
    --The first is the signal_hour_en from the TZKZQ
    --The Second is the signal_co from the CNT60
    --The Third is the signal_hour from the TZKZQ
    --The Fourth is the signal_hour_cur sent to the TZKZQ
    --The Five is the signal_day_clk sent to the CNT30

  u5:CNT30
    port map(s_day_en,s_co24,s_day,s_year,s_mon,s_day_cur,s_maxday,key6,s_co30);
    --The first is the signal_day_en from the TZKZQ
    --The Second is the signal_co from the CNT24
    --The Third is the signal_day from the TZKZQ
    --The Fourth is the signal_year from the CNT100
    --The Five is the signal_mon from the CNT30
    --The Six is the signal_day_cur sent to the TZKZQ
    --The Seven is the signal_maxday sent to the TZKZQ
    --The Eight is the signal_co sent to the CNT12

  u6:CNT60
    port map(s_sec_en,clr,s_newclk,s_sec,s_sec_cur,key6,s_sec_co60);
    --The first is the signal_sec_en from the TZKZQ
    --The Second is the signal_newclk from the CLKGEN
    --The Third is the signal_clk from the outside
    --The Fourth is the signal_sec from the TZKZQ
    --The Five is the signal_sec_cur sent to the TZKZQ
    --The Six is the signal_co sent to the CNT60

    u7:CNT60
    port map(s_min_en,clr,s_sec_co60,s_min,s_min_cur,key6,s_min_co60);
    --The first is the signal_min_en from the TZKZQ
    --The Second is the signal_clr from outside
    --The Third is the signal_clk from the CNT60
    --The Fourth is the signal_min from the TZKZQ
    --The Five is the signal_min_cur sent to the TZKZQ
    --The Six is the signal_co sent to the CNT24


  u8:CNT100
    port map(s_year_en,s_co12,s_year,s_year_cur,key6,s_co100);
    --The first is the signal_year_en from the TZKZQ
    --The Second is the signal_clk from the CNT12
    --The Third is the signal_year from the TZKZQ
    --The Fourth is the signal_year_cur sent to TZKZQ

  u9:DISPLAY
    port map(s_hbcd,s_lbcd,s_selout,key1,key2,com,seg);
    --The first is the signal_hbcd from the XSKZQ
    --The Second is the signal_lbcd from the XSKZQ
    --The Third is the signal_selout sen to XSKZQ
    --The Fourth is the signal_clk from outside
    --The Five is the signal_com sent outside
    --The Six is the signal_seg sent outside

  u10:TZKZQ
    port map(key3,key4,key5,key6,s_newclk,s_maxday,s_sec_en,s_min_en,
             s_hour_en,s_day_en,s_mon_en,s_year_en,s_week_en,s_hour_cur,
             s_min_cur,s_sec_cur,s_year_cur,s_mon_cur,s_day_cur,
             s_week_cur,s_sec,s_min,s_hour,s_day,s_mon,s_year,
             s_week);
    --The first is the signal_key1 from the outside
    --The Second is the signal_key2 from the outside
    --The Third is the signal_newclk from the CLKGEN
    --The Fourth is the signal_maxdays from the CNT30
    --The Five is the signal_sec_en from the TZKZQ
    --...
    --The Six is the signal_sec_cur from the CNT60
    --...
    --The Seven is the signal_sec from the TZKZQ
    --...

  u11:XSKZQ
    port map(clk,s_sec_cur,s_min_cur,s_hour_cur,s_day_cur,s_mon_cur,s_year_cur,s_week_cur,
             s_selout,s_hbcd,s_lbcd);
    --The first is the signal_clk from the outside
    --The Second is the signal_sec_cur from the CNT60
    --...
    --The Third is the signal_selout send to DISPLAY
    --The Fourth is the signal_hbcd send to DISPLAY
    --The Five is the signal_lbcd send to TZKZQ
 
  u12:LED_XS
    port map(s_sec_en,s_min_en,s_hour_en,s_day_en,s_mon_en,s_year_en,
             s_week_en,led1,led2,led3,led4,led5,led6,
             led7,led8);
    --The first is the signal_sec_en from the XSKZQ
    --...
    --The Second is the signal_led1 send outside
    --...

end architecture art;