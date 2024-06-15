library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
entity quling is
  port(din0,din1,din2,din3,din4:in std_logic_vector(7 downto 0);
       dout0,dout1,dout2,dout3,dout4:out std_logic_vector(7 downto 0));
end quling;
architecture art of quling is
  begin 
  process(din0,din1,din2,din3,din4)
  begin 
--In the "data_change" module, 
--a flag for decimal points has been set. 
--Therefore, in the "quling" module, 
--only zeros before the decimal point of the cell will be displayed. 
  if(din4="00111111") then
    if(din3="00111111") then
      if(din2="00111111") then
        if(din1="00111111") then
          dout4<="00000000";
          dout3<="00000000";
          dout2<="00000000";
          dout1<="00000000";
          dout0<=din0;
        else
          dout4<="00000000";
          dout3<="00000000";
          dout2<="00000000";
          dout1<=din1;
          dout0<=din0;
        end if;
      else
        dout4<="00000000";
        dout3<="00000000";
        dout2<=din2;
        dout1<=din1;
        dout0<=din0;
      end if;
    else
      dout4<="00000000";
      dout3<=din3;
      dout2<=din2;
      dout1<=din1;
      dout0<=din0;
    end if;
  else
    dout4<=din4;
    dout3<=din3;
    dout2<=din2;
    dout1<=din1;
    dout0<=din0;
  end if;
  end process;
end art;
        