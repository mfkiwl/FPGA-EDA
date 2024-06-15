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
       shizai:in std_logic_vector(17 downto 0);--17
       yougong:in std_logic_vector(17 downto 0);--17
       gonglvyinsu:out std_logic_vector(17 downto 0));
end gonglvyinsu;
architecture art of gonglvyinsu is
  signal s_result_100_25:std_logic_vector(24 downto 0);
  signal s_remain18:std_logic_vector(17 downto 0);
  signal s_gonglvyinsu25:std_logic_vector(24 downto 0);
  begin 
    --multiply by 100
    chengfa100 : lpm_mult
    generic map (
      lpm_hint => "MAXIMIZE_SPEED=5",
      lpm_representation => "UNSIGNED",
      lpm_type => "LPM_MULT",
      lpm_widtha => 18,
      lpm_widthb => 7,
      lpm_widthp => 25
    )
    port map (
      dataa => yougong,
      datab => "1100100",--100
      result => s_result_100_25
    );

  xiangchu : LPM_DIVIDE
  generic map (
    lpm_drepresentation => "UNSIGNED",
    lpm_hint => "LPM_REMAINDERPOSITIVE=TRUE",
    lpm_nrepresentation => "UNSIGNED",
    lpm_type => "LPM_DIVIDE",
    lpm_widthd => 18,
    lpm_widthn => 25
  )
  port map (
    denom => shizai,
    numer => s_result_100_25,
    quotient => s_gonglvyinsu25,
    remain => s_remain18
  );
  process(clk)
  begin
  if clk'event and clk='1' then 
  gonglvyinsu<=s_gonglvyinsu25(17 downto 0);
  end if;
  end process;
end art;