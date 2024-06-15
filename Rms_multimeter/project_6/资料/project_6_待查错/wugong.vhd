library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;--to_unsigned
library lpm;
use lpm.lpm_components.all;
--As the value increases, 
--the number of clock pulses required for square root calculation will also increase.
entity wugong is
  port(clk:in std_logic;
  --Reactive power also needs to be square rooted for the 17 digits within 1 second
  --so it can be 8k here
       yougong:in std_logic_vector(17 downto 0);
       shizai:in std_logic_vector(17 downto 0);
       wugong:out std_logic_vector(17 downto 0));
end wugong;

architecture art of wugong is
  signal s_wugong_pinfang_int:integer range 0 to 2147483647:=1; 
  signal s_wugong:std_logic_vector(17 downto 0); 
  type state is (s0,s1);
  begin
  chengfa : lpm_mult
  generic map (
    lpm_hint => "MAXIMIZE_SPEED=5",
    lpm_representation => "UNSIGNED",
    lpm_type => "LPM_MULT",
    lpm_widtha => 18,
    lpm_widthb => 18,
    lpm_widthp => 18
  )
  port map (
    dataa => yougong,
    datab => shizai,
    result => s_wugong
  );
  s_wugong_pinfang_int<=conv_integer(s_wugong);
  process(clk,yougong,shizai)
  variable ps,ns:state:=s0;
  variable n:integer range 0 to 2147483647;
  variable m:integer range 0 to 65535;
  variable s:integer range 0 to 65535;
  begin 
  if(clk'event and clk='1') then 
    ps:=ns;
    case ps is
    when s0=>
            n:=s_wugong_pinfang_int;
            m:=0;
            ns:=s1;
    when s1=>
          if(n/=s_wugong_pinfang_int) then 
          n:=s_wugong_pinfang_int;
          m:=0;
          end if;
            m:=m+1;
            s:=m*m;
            if(s<n) then 
              ns:=s1;
            else 
              ns:=s0;
              wugong<=std_logic_vector(to_unsigned(m,18));
            end if;
    when others=>null;
    end case;
  end if;
  end process;
end art;      
