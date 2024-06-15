library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
library lpm;
use lpm.lpm_components.all;

--test---->(129-128)*(130-128)*4/1*1/2=4

entity yougong is 
  port(clk8k:in std_logic;
       din1:in std_logic_vector(7 downto 0);
       din2:in std_logic_vector(7 downto 0);
       dout:out std_logic_vector(33 downto 0));
end yougong;

architecture art of yougong is

--component
  component qiuhe_gong is 
  port(clk8k:in std_logic;
       --din1,din2:in integer range 0 to 255;
       din1,din2:in std_logic_vector(7 downto 0);
       --dout:out integer range 0 to 520200000);
       dout:out std_logic_vector(28 downto 0));
  end component qiuhe_gong;

--signal
signal s_dout29:std_logic_vector(28 downto 0);
signal s_quotient_8000_17_29:std_logic_vector(28 downto 0);
signal s_remain_8000_13:std_logic_vector(12 downto 0);
signal s_result_100000_34:std_logic_vector(33 downto 0);
signal s_quotient_65536_18_34:std_logic_vector(33 downto 0);
signal s_remain_65536_17:std_logic_vector(16 downto 0);


  begin 

  u0:qiuhe_gong port map(clk8k,din1,din2,s_dout29);

  chufa256 : LPM_DIVIDE
  generic map (
    lpm_drepresentation => "UNSIGNED",
    lpm_hint => "LPM_REMAINDERPOSITIVE=TRUE",
    lpm_nrepresentation => "UNSIGNED",
    lpm_type => "LPM_DIVIDE",
    lpm_widthd => 13,
    lpm_widthn => 29
  )
  port map (
    denom => "0000100000000",--256
    numer => s_dout29,
    quotient => s_quotient_8000_17_29,
    remain => s_remain_8000_13
  );
  --multiply by 100000
  chengfa10000 : lpm_mult
  generic map (
    lpm_hint => "MAXIMIZE_SPEED=5",
    lpm_representation => "UNSIGNED",
    lpm_type => "LPM_MULT",
    lpm_widtha => 17,
    lpm_widthb => 17,
    lpm_widthp => 34
  )
  port map (
    dataa => s_quotient_8000_17_29(16 downto 0),
    --datab => "11000011010100000",--100000
	 datab => "00000000001100100",--100
    result => s_result_100000_34
  );

  chufa65536 : LPM_DIVIDE
  generic map (
    lpm_drepresentation => "UNSIGNED",
    lpm_hint => "LPM_REMAINDERPOSITIVE=TRUE",
    lpm_nrepresentation => "UNSIGNED",
    lpm_type => "LPM_DIVIDE",
    lpm_widthd => 17,
    lpm_widthn => 34
  )
  port map (
    denom => "10000000000000000",--65536
    numer => s_result_100000_34,
    quotient => s_quotient_65536_18_34,
    remain => s_remain_65536_17
  );
  dout<=s_quotient_65536_18_34;

end architecture;