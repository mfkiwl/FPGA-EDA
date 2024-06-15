library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
entity display is
  port(clk256:in std_logic;
       din0,din1,din2,din3,din4,
       din7:in std_logic_vector(7 downto 0);
       dout:out std_logic_vector(7 downto 0);
       sel:out std_logic_vector(7 downto 0));
end display;
architecture art of display is
  type state is(s0,s1,s2,s3,s4,s5,s6,s7);
  begin
  process(clk256,din0,din1,din2,din3,din4,din7)
  variable ps,ns:state;
  begin 
  if(clk256'event and clk256='1') then
    case ps is
      when s0 =>ns:=s1;
                dout<=din0;--low position--the first digit tube is on the far left
                sel<="11111110";--low level effective
      when s1 =>ns:=s2;
                dout<=din1;
                sel<="11111101";
      when s2 =>ns:=s3;
                dout<=din2;
                sel<="11111011"; 
      when s3 =>ns:=s4;
                dout<=din3;
                sel<="11110111";
      when s4 =>ns:=s5;
                dout<=din4;
                sel<="11101111";     
      when s5 =>ns:=s6;
                dout<="00000000";
                sel<="11011111";     
      when s6 =>ns:=s7;
                dout<="00000000";
                sel<="10111111";
      when s7 =>ns:=s0;
                dout<=din7;
                sel<="01111111"; 
      when others=>null;
    end case;
  end if;
  ps:=ns;
  end process;
end art;
            
                
