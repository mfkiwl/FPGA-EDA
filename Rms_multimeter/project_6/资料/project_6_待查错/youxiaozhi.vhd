library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
library lpm;
use lpm.lpm_components.all;

--test---->10000100----->00000100------>4*(4*4)=64------>64/1=64------->squart(64)=8
--8-------->8*1/1=8
--coefficient----->u_fang_qiuhe256----->chufa256----->genhao----->chenfa10000----->chufa256
entity youxiaozhi is 
  port(clk648:in std_logic;
       clk8k:in std_logic;
       din:in std_logic_vector(7 downto 0);
       dout:out std_logic_vector(13 downto 0));
end youxiaozhi;
architecture art of youxiaozhi is

--component
  component genhao is
    port(clk:in std_logic;
        din:in std_logic_vector(16 downto 0);
        dout:out std_logic_vector(7 downto 0));
  end component genhao;

  component quzhiliu is
    port(v:in std_logic_vector(7 downto 0);
         dout:out std_logic_vector(7 downto 0));
  end component quzhiliu;

  component qiuhe is 
  port(clk8k:in std_logic;
       din:in std_logic_vector(7 downto 0);
       dout:out std_logic_vector(28 downto 0));
  end component qiuhe;

--signal
  signal s_dout_q_8: std_logic_vector(7 downto 0);
  signal s_dout_g_8: std_logic_vector(7 downto 0);
  signal s_dout29: std_logic_vector(28 downto 0);
  signal s_quotient_8000_17_29: std_logic_vector(28 downto 0);
  signal s_remain_8000_13: std_logic_vector(12 downto 0);
  signal s_result_10000_22: std_logic_vector(21 downto 0);
  signal s_remain_256_9: std_logic_vector(8 downto 0);
  signal s_quotient_256_14_22: std_logic_vector(21 downto 0);
  
  begin

    --remove the dc component
    u0:quzhiliu port map(din,s_dout_q_8);

    --summation
    --8000 times
    u1:qiuhe port map(clk8k,s_dout_q_8,s_dout29);

    --square root
    u2:genhao port map(clk648,s_quotient_8000_17_29(16 downto 0),s_dout_g_8);

    --divide by 8000

    chufa8000 : LPM_DIVIDE
    generic map (
      lpm_drepresentation => "UNSIGNED",
      lpm_hint => "LPM_REMAINDERPOSITIVE=TRUE",
      lpm_nrepresentation => "UNSIGNED",
      lpm_type => "LPM_DIVIDE",
      lpm_widthd => 13,
      lpm_widthn => 29
    )
    port map (
      --denom => "1111101000000",--8000
      --denom => "0000000000001",--1
      denom => "0000100000000",--256
      numer => s_dout29,
      quotient => s_quotient_8000_17_29,
      remain => s_remain_8000_13
    );

    --multiply by 10000
    chengfa10000 : lpm_mult
    generic map (
      lpm_hint => "MAXIMIZE_SPEED=5",
      lpm_representation => "UNSIGNED",
      lpm_type => "LPM_MULT",
      lpm_widtha => 8,
      lpm_widthb => 14,
      lpm_widthp => 22
    )
    port map (
      dataa => s_dout_g_8,
      datab => "10011100010000",--10000
      --datab => "00000000000001",--1
      result => s_result_10000_22
    );

    --divide by 256
    chufa256 : LPM_DIVIDE
    generic map (
      lpm_drepresentation => "UNSIGNED",
      lpm_hint => "LPM_REMAINDERPOSITIVE=TRUE",
      lpm_nrepresentation => "UNSIGNED",
      lpm_type => "LPM_DIVIDE",
      lpm_widthd => 9,
      lpm_widthn => 22
    )
    port map (
      denom => "100000000",--256
      --denom => "000000001",--1
      numer => s_result_10000_22,
      quotient =>s_quotient_256_14_22 ,
      remain => s_remain_256_9
    );
    
    process(clk8k)
    begin
    if clk8k'event and clk8k='1' then
    dout<=s_quotient_256_14_22(13 downto 0);
    end if ;
    end process;

end architecture art;
   
      