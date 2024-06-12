library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity DTTIMES is
    generic(
        CNT_MAX:integer:=6
    );
    port(
        clk1:in std_logic;
        clk2:in std_logic;
        clr:in std_logic;
        ena:in std_logic;
        com:out std_logic_vector(7 downto 0);
        seg:out std_logic_vector(7 downto 0)
    );
end;

architecture art of DTTIMES is

    --component;
    component CNT6
    generic (
      CNT_MAX : integer
    );
    port (
      clk : in std_logic;
      clr : in std_logic;
      ena : in std_logic;
      cq : out std_logic_vector(3 downto 0);
      co : out std_logic
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
      DATAIN : in STD_LOGIC_VECTOR(23 DOWNTO 0);
      COM : out STD_LOGIC_VECTOR(7 DOWNTO 0);
      SEG : out STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
    end component;  

    component freq_div
    generic (
        CNT_MAX : integer
    );
    port (
        clk_in : in std_logic;
        clk_out : out std_logic
    );
end component;
    --signal
    signal s1_co,s2_co,s3_co,s4_co,s5_co,s6_co:std_logic;
    signal s1_cq,s2_cq,s3_cq,s4_cq,s5_cq,s6_cq:std_logic_vector(3 downto 0);
    signal s_sel:std_logic_vector(2 downto 0);
    signal s_datain:std_logic_vector(23 downto 0);
    signal s_clk_out:std_logic;
    constant CNT_MAX_div:integer:=5;
    begin
        s_datain <= s6_cq&s5_cq&s4_cq&s3_cq&s2_cq&s1_cq;
        u0:freq_div generic map (CNT_MAX_div) port map(clk1,s_clk_out);
        u1:CNT10 port map(s_clk_out,clr,ena,s1_cq,s1_co);
        u2:CNT10 port map(s1_co,clr,ena,s2_cq,s2_co);
        u3:CNT10 port map(s2_co,clr,ena,s3_cq,s3_co);
        u4:CNT6 generic map (CNT_MAX) port map(s3_co,clr,ena,s4_cq,s4_co);
        u5:CNT10 port map(s4_co,clr,ena,s5_cq,s5_co);
        u6:CNT6 generic map (CNT_MAX) port map(s5_co,clr,ena,s6_cq,s6_co); 
        u7:CTRLS port map(clk2,s_sel);   
        u8:DISPLAY port map(s_sel,s_datain,com,seg);   

end architecture;


