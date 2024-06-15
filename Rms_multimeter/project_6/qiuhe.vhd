library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
entity qiuhe is 
  port(clk8k:in std_logic;
  --Collecting 8000 times in 1 second, so a frequency of 80K is needed.
       din:in std_logic_vector(7 downto 0);
       dout:out std_logic_vector(28 downto 0));
end qiuhe;
architecture art of qiuhe is
  begin 
  process(clk8k,din)
  variable m: integer range 0 to 8000:=1;
  variable n: integer range 0 to 520200000:=1;
  variable p: integer range 0 to 255:=1;
  variable din_integer: integer range 0 to 255:=1; 
  --variable dout_integer: integer range 0 to 520200000; 
  begin
  din_integer:=conv_integer(din);
  --dout <=std_logic_vector(to unsigned(dout_integer));
   
  if(clk8k'event and clk8k='1')then
    p:=din_integer;
    --if(m=512) then 
    if(m=256) then 
      m:=0;
      dout<=std_logic_vector(to_unsigned(n,29));
      n:=0;
    else 
      m:=m+1;
      n:=n+p*p;
    end if;
  end if;
  end process;
  end art;
