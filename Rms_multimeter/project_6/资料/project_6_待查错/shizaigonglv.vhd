library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
library lpm;
use lpm.lpm_components.all;
use ieee.numeric_std.all;
entity shizaigonglv is
  port(clk:in std_logic;
  --The apparent power only needs to calculate the multiplication result in 1 second
  --it can be 8k
       u_youxiaozhi:in std_logic_vector(13 downto 0);
       i_youxiaozhi:in std_logic_vector(13 downto 0);
       shizaigonglv:out std_logic_vector(17 downto 0));
end shizaigonglv;
architecture art of shizaigonglv is
  signal s_result:std_logic_vector(27 downto 0);
  begin 
  --multiply by 10000
  chengfa10000 : lpm_mult
  generic map (
    lpm_hint => "MAXIMIZE_SPEED=5",
    lpm_representation => "UNSIGNED",
    lpm_type => "LPM_MULT",
    lpm_widtha => 14,
    lpm_widthb => 14,
    lpm_widthp => 28
  )
  port map (
    dataa => u_youxiaozhi,
    datab => i_youxiaozhi,
    result => s_result
  );
  process(clk)
  begin
  if(clk'event and clk='1') then
  shizaigonglv<=s_result(17 downto 0);
  end if;
  end process;
end architecture;


  