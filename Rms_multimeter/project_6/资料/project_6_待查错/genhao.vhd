library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;--to_unsigned
entity genhao is
  port(clk:in std_logic;
  --To calculate the square of n within 1 second, 
  --with n incrementing by 1 each time. 
  --The maximum value of n is such that its square is a 17-bit binary number
  --n_max=363,so the clk_min is 363hz
  --clk can be  8k here
       din:in std_logic_vector(16 downto 0);
       dout:out std_logic_vector(7 downto 0));
end genhao;
architecture art of genhao is
  type state is (s0,s1);
  signal din_integer:integer range 0 to 131071:=1;
  begin 
  process(clk,din)
  variable n:integer range 0 to 131071 :=1;
  variable m:integer range 0 to 255 :=1;
  variable s:integer range 0 to 65025 :=1;
  variable ps,ns:state:=s0;

  begin
    din_integer<=conv_integer(din);

  if(clk'event and clk='1') then 
    ps:=ns;
    case ps is
    when s0=>
            n:=din_integer;
            m:=0;
            ns:=s1;
    when s1=>
--When the value of n changes, 
--if the square root value has not been calculated completely,
-- it needs to be updated again; otherwise, 
--it will keep getting stuck at the previous square root value.    
            if(n/=din_integer) then 
            n:=din_integer;
            m:=0;
            end if;

            m:=m+1;
            s:=m*m;

            if(s<n) then 
              ns:=s1;
            else 
              ns:=s0;
              dout<=std_logic_vector(to_unsigned(m,8));
            end if;
    when others=>null;
    end case;
  end if;
  end process;
end art;      