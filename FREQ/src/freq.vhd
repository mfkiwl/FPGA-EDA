library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity freq is
    generic(
        CNT_MAX:integer:=5
    );
    port(
        clk_in:in std_logic;
        clk1:in std_logic;
        clk2:in std_logic;
        ena:in std_logic;
        com:out std_logic_vector(7 downto 0);
        seg:out std_logic_vector(7 downto 0)
    );
end;

architecture art of freq is
    --component;

    component clk_div_and_data_reg
    generic (
      CNT_MAX : integer
    );
    port (
      clk_in : in std_logic;
      data_in : in std_logic_vector(31 downto 0);
      data_out : out std_logic_vector(31 downto 0);
      clr : out std_logic
    );
  end component;
  
  
    component CNT10
    port (
      CLK : in STD_LOGIC;
      CLR : in STD_LOGIC;
      ENA : in STD_LOGIC;
      CQ : out STD_LOGIC_VECTOR(3 DOWNTO 0);
      CO : out STD_LOGIC
    );
  end component;

    component CTRLS
      port (
        CLK : in STD_LOGIC;
        SEL : out STD_LOGIC_VECTOR(2 DOWNTO 0)
      );
    end component;

    component DISPLAY
      port (
        SEL : in STD_LOGIC_VECTOR(2 DOWNTO 0);
        DATAIN : in STD_LOGIC_VECTOR(31 DOWNTO 0);
        COM : out STD_LOGIC_VECTOR(7 DOWNTO 0);
        SEG : out STD_LOGIC_VECTOR(7 DOWNTO 0)
      );
    end component;

    --signal
    signal cnt_temp:std_logic;
    signal s0_cq,s1_cq,s2_cq,s3_cq,s4_cq,s5_cq,s6_cq,s7_cq:std_logic_vector(3 downto 0);
    signal s0_co,s1_co,s2_co,s3_co,s4_co,s5_co,s6_co,s7_co:std_logic;
    signal s_clr:std_logic;
    signal s_data_in:std_logic_vector(31 downto 0);
    signal s_data_out:std_logic_vector(31 downto 0);
    signal s_sel:std_logic_vector(2 downto 0);
    
    begin

        u0:CNT10 port map(clk_in,s_clr,ena,s0_cq,s0_co);
        u1:CNT10 port map(s0_co,s_clr,ena,s1_cq,s1_co);
        u2:CNT10 port map(s1_co,s_clr,ena,s2_cq,s2_co);
        u3:CNT10 port map(s2_co,s_clr,ena,s3_cq,s3_co);
        u4:CNT10 port map(s3_co,s_clr,ena,s4_cq,s4_co);
        u5:CNT10 port map(s4_co,s_clr,ena,s5_cq,s5_co);
        u6:CNT10 port map(s5_co,s_clr,ena,s6_cq,s6_co);
        u7:CNT10 port map(s6_co,s_clr,ena,s7_cq,s7_co);
        u8:clk_div_and_data_reg generic map(CNT_MAX) port map(clk1,s_data_in,s_data_out,s_clr);
        s_data_in<=s7_cq&s6_cq&s5_cq&s4_cq&s3_cq&s2_cq&s1_cq&s0_cq;
        u9:ctrls port map(clk2,s_sel);
        u10:display port map(s_sel,s_data_out,com,seg);

        
end architecture;


