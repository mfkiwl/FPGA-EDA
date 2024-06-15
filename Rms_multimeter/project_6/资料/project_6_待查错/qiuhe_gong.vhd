library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

--test--->(129-128)*(130-128)*4=8

entity qiuhe_gong is 
  port(clk8k:in std_logic;
  --The power module also needs to be calculated 8000 times within 1 second
  --so the clk must be 8k
       din1,din2:in std_logic_vector(7 downto 0);
       dout:out std_logic_vector(28 downto 0));
end qiuhe_gong;
architecture art of qiuhe_gong is
  begin
  process(clk8k)
  variable m:integer range 0 to 8000:=1;
  variable n:integer range 0 to 520200000:=1;
  variable p,q:integer range 0 to 255:=1;
  variable din1_integer:integer range 0 to 255:=1;
  variable din2_integer:integer range 0 to 255:=1;
  begin
  --din_integer:=conv_integer(din);
  din1_integer:=conv_integer(din1);
  din2_integer:=conv_integer(din2);
  if(clk8k'event and clk8k='1')then
    p:=din1_integer;
    q:=din2_integer;
    --if(m=8000) then 
    if(m=4) then
      m:=0;
      dout<=std_logic_vector(to_unsigned(n,29));
      n:=0;
    else 
      m:=m+1;
      if(p>128 and q>128) then 
        n:=n+(p-128)*(q-128);
      elsif(p<128 and q<128) then 
        n:=n+(128-p)*(128-q);
      elsif(p<128 and q>128) then
        n:=n-(128-p)*(q-128);
      elsif(p>128 and q<128) then 
        n:=n-(p-128)*(128-q);
      end if;
    end if;
  end if;
  end process;
end architecture art;