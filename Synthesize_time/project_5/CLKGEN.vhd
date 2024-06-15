library ieee;
use ieee.std_logic_1164.all;
entity CLKGEN is
port(clk: in std_logic;
     newclk: out std_logic);
end entity CLKGEN;
architecture art of CLKGEN is
--signal cnt: integer range 0 to 10#23999999#;
signal cnt: integer range 0 to 10#21#;--Frequency division by 2
begin
 process(clk) is
 begin
 if clk'event and clk='1' then
   --if cnt=10#23999999# then cnt<=0;
   if cnt=10#21# then cnt<=0;
   else cnt<=cnt+1;
  end if;
 end if;
end process;
process(cnt) is
   begin
   --if cnt=10#23999999# then newclk<='1';
  if cnt=10#21# then newclk<='1';
      else
        newclk<='0';
    end if;
  end process;
 end architecture art;