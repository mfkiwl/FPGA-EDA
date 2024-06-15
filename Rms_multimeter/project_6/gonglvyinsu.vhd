library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 
use ieee.std_logic_unsigned.all;
library lpm;
use lpm.lpm_components.all;
--test--->2/4--->2*100=200-->200/4=50
entity gonglvyinsu is 
  port(clk:in std_logic;
  --The apparent power only needs to calculate the multiplication result in 1 second
  --it can be 8k
       shizai:in std_logic_vector(29 downto 0);--17
       yougong:in std_logic_vector(33 downto 0);--17
       gonglvyinsu:out std_logic_vector(17 downto 0));
end gonglvyinsu;
architecture art of gonglvyinsu is
  signal s_result_100_35:std_logic_vector(34 downto 0);
  signal s_remain30:std_logic_vector(29 downto 0);
  signal s_gonglvyinsu35:std_logic_vector(34 downto 0);
  signal s_int_yougong:integer range 0 to 2147483647;
  signal s_yougong:integer range 0 to 2147483647;
  begin 
    -- --multiply by 100
    -- chengfa1000 : lpm_mult
    -- generic map (
    --   lpm_hint => "MAXIMIZE_SPEED=5",
    --   lpm_representation => "UNSIGNED",
    --   lpm_type => "LPM_MULT",
    --   lpm_widtha => 34,
    --   lpm_widthb => 12,
    --   lpm_widthp => 35
    -- )
    -- port map (
    --   dataa => yougong,
    --   --datab => "1100100",--100
    --   --datab => "001111101000",--1000
    --   datab => "000000000010",--2
    --   result => s_result_100_35
    -- );
    --I don't know why this multiplier is not working
    
    s_int_yougong<=conv_integer(yougong);
    s_yougong<=s_int_yougong*1000;
  s_result_100_35<=std_logic_vector(to_unsigned(s_yougong,35));
  xiangchu : LPM_DIVIDE
  generic map (
    lpm_drepresentation => "UNSIGNED",
    lpm_hint => "LPM_REMAINDERPOSITIVE=TRUE",
    lpm_nrepresentation => "UNSIGNED",
    lpm_type => "LPM_DIVIDE",
    lpm_widthd => 30,
    lpm_widthn => 35
  )
  port map (
    denom => shizai,
    numer => s_result_100_35,
    quotient => s_gonglvyinsu35,
    remain => s_remain30
  );
  process(clk)
  begin
  if clk'event and clk='1' then 
  gonglvyinsu<=s_gonglvyinsu35(17 downto 0);
  end if;
  end process;
end art;