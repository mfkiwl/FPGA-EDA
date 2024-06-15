library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity TOP is
  --generic(constant din1:std_logic_vector(7 downto 0):="10000101";--I
          --constant din2:std_logic_vector(7 downto 0):="10000100");--U
  port(clk24M:in std_logic;
       key: in std_logic_vector(2 downto 0);--sw3,4,5
       start1,oe1,ale1:out std_logic;
       start2,oe2,ale2:out std_logic;
       dout: out std_logic_vector(7 downto 0);
       sel: out std_logic_vector(7 downto 0));
end TOP;
architecture art of TOP is
  --component 
  component youxiaozhi is 
  port(clk648:in std_logic;
       clk8k:in std_logic;
       din:in std_logic_vector(7 downto 0);
       dout:out std_logic_vector(13 downto 0));
  end component;

  component yougong is 
  port(clk8k:in std_logic;
       din1:in std_logic_vector(7 downto 0);
       din2:in std_logic_vector(7 downto 0);
       dout:out std_logic_vector(17 downto 0));
  end component;

  component wugong is
    port(clk:in std_logic;
    --Reactive power also needs to be square rooted for the 17 digits within 1 second
    --so it can be 8k here
         yougong:in std_logic_vector(17 downto 0);
         shizai:in std_logic_vector(17 downto 0);
         wugong:out std_logic_vector(17 downto 0));
  end component;

  component gonglvyinsu is 
  port(clk:in std_logic;
  --The apparent power only needs to calculate the multiplication result in 1 second
  --it can be 8k
       shizai:in std_logic_vector(17 downto 0);--17
       yougong:in std_logic_vector(17 downto 0);--17
       gonglvyinsu:out std_logic_vector(17 downto 0));
  end component;

  component fenpin is 
  port(clk_24M:in std_logic;
  --The newly generated clock has 80K 8K 24M
      new_clk_8K:out std_logic;
      new_clk_80k:out std_logic;
      new_clk_24M:out std_logic;
      new_clk_1hz:out std_logic);
end component fenpin;

  component AD0809 is
    port(clk,eoc:in std_logic;
         din:in std_logic_vector(7 downto 0);
         start,oe,ale:out std_logic;
         rom_data_clk:out std_logic;
         dout:out std_logic_vector(7 downto 0));
  end component AD0809;

  component shizaigonglv is
    port(clk:in std_logic;
    --The apparent power only needs to calculate the multiplication result in 1 second
    --it can be 8k
         u_youxiaozhi:in std_logic_vector(13 downto 0);
         i_youxiaozhi:in std_logic_vector(13 downto 0);
         shizaigonglv:out std_logic_vector(17 downto 0));
  end component shizaigonglv;

  component xuanze is
    port(k:in std_logic_vector(2 downto 0);
         din0,din1:in std_logic_vector(13 downto 0);--youxiaozhi
         din2:in std_logic_vector(17 downto 0);--yougong
         din3:in std_logic_vector(17 downto 0);--wugong
         din4:in std_logic_vector(17 downto 0);--gonglvyinsu
         dout:out std_logic_vector(15 downto 0);
         dout7:out std_logic_vector(4 downto 0));
  end component xuanze;

  component XSKZ is
    port(kk:in std_logic_vector(2 downto 0);
         ru:in std_logic_vector(15 downto 0);
         clk24M:in std_logic;
         --The faster the display control clock, the better
         din7:in std_logic_vector(4 downto 0);
         dout7:out std_logic_vector(7 downto 0);
         sel:out std_logic_vector(7 downto 0));
  end component XSKZ;
  
  component ROM is
  port(clk:in std_logic;
       din1:out std_logic_vector(7 downto 0);
       din2:out std_logic_vector(7 downto 0));
  end component ROM;

  --signal
  signal s_new_clk_8K,s_new_clk_80k,s_new_clk_24M,s_new_clk_1hz: std_logic;
  signal s_din1,s_din2:std_logic_vector(7 downto 0);
  signal s_rom_clk_din1:std_logic;
  signal s_rom_clk_din2:std_logic;
  signal s_dout_I:std_logic_vector(7 downto 0);
  signal s_dout_I_rms:std_logic_vector(13 downto 0);
  signal s_dout_U:std_logic_vector(7 downto 0);
  signal s_dout_U_rms:std_logic_vector(13 downto 0);
  signal s_yougong:std_logic_vector(17 downto 0);
  signal s_shizaigonglv:std_logic_vector(17 downto 0);
  signal s_wugong:std_logic_vector(17 downto 0);
  signal s_wugong_pinfang_int: natural range 0 to 2147483647;--integer-max-31bit
  signal s_gonglvyinsu:std_logic_vector(17 downto 0);
  signal s_xuanze_dout:std_logic_vector(15 downto 0);
  signal s_xuanze_dout7:std_logic_vector(4 downto 0);


  begin
  u0:fenpin port map(clk24M,s_new_clk_8K,s_new_clk_80k,s_new_clk_24M,s_new_clk_1hz);
  --Current AD0809
  u1:AD0809 port map(s_new_clk_80k,s_new_clk_80k,s_din1,start1,oe1,ale1,s_rom_clk_din1,s_dout_I);--sin
  --Current youxiaozhi
  u2:youxiaozhi port map(s_new_clk_8k,s_rom_clk_din2,s_dout_I,s_dout_I_rms);
  --Voltage AD0809
  u3:AD0809 port map(s_new_clk_80k,s_new_clk_80k,s_din2,start2,oe2,ale2,s_rom_clk_din2,s_dout_U);--cos
  --Voltage youxiaozhi
  u4:youxiaozhi port map(s_new_clk_8k,s_new_clk_80K,s_dout_U,s_dout_U_rms);
  --yougong
  u5:yougong port map(s_new_clk_8K,s_din1,s_din2,s_yougong);
  --shizai
  u6:shizaigonglv port map(s_new_clk_8K,s_dout_U_rms,s_dout_I_rms,s_shizaigonglv);
  --wugong
  u7:wugong port map(s_new_clk_8K,s_yougong,s_shizaigonglv,s_wugong);
  --gonglvyinsu
  u8:gonglvyinsu port map(s_new_clk_8K,s_shizaigonglv,s_yougong,s_gonglvyinsu);
  --xuanze
  u9:xuanze port map(key,s_dout_I_rms,s_dout_U_rms,s_yougong,s_wugong,s_gonglvyinsu,
                     s_xuanze_dout,s_xuanze_dout7);
  --XSZK
  u10:XSKZ port map(key,s_xuanze_dout,s_new_clk_8K,s_xuanze_dout7,dout,sel);
  
  --ROM
  u11:ROM port map(s_rom_clk_din1,s_din1,s_din2);

end art;





