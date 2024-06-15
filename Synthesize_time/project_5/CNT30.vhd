library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity CNT30 is 
   port(ld: in std_logic;--Set signal (active low)
	     clk:in std_logic;--Clock pulse (rising edge triggered)
		  datain: in std_logic_vector(4 downto 0);--preset value
		  year :in std_logic_vector(6 downto 0);--current year
		  yue: in std_logic_vector(3 downto 0);--current month
		  num: buffer std_logic_vector( 4 downto 0);--counting result  
		  maxday: out std_logic_vector(4 downto 0);--total number of days in this month  
			key6:in std_logic;
		  co : out std_logic);--carry signal
end entity CNT30;
architecture art of CNT30 is 
signal total_days:std_logic_vector(4 downto 0);
 begin
 process(ld,clk)  is  
 variable runnian :std_logic;
 begin
 case year is
   when"0000000"=>runnian:='1';-- 0
   --If the current year is 00, output a confirmation signal that it is a leap year
   when"0000100"=>runnian:='1';--4       
	when"0001000"=>runnian:='1';--8
	when"0001100"=>runnian:='1';--12
	when"0010000"=>runnian:='1';--16
	when"0010100"=>runnian:='1';--20
	when"0011000"=>runnian:='1';--24
	when"0011100"=>runnian:='1';--28
	when"0100000"=>runnian:='1';--32
	when"0100100"=>runnian:='1';--36
	when"0101000"=>runnian:='1';--40
	when"0101100"=>runnian:='1';--44
	when"0110000"=>runnian:='1';--48
	when"0110100"=>runnian:='1';--52
	when"0111000"=>runnian:='1';--56
	when"0111100"=>runnian:='1';--60
	when"1000000"=>runnian:='1';--64
	when"1000100"=>runnian:='1';--68
	when"1001000"=>runnian:='1';--72
	when"1001100"=>runnian:='1';--76
	when"1010000"=>runnian:='1';--80
	when"1010100"=>runnian:='1';--84
	when"1011000"=>runnian:='1';--88
	when"1011100"=>runnian:='1';--92
	when"1100000"=>runnian:='1';--96
	when others  =>runnian:='0';-- 
end case;

case yue is
	when "0001" =>total_days<="11111";--1 
	--If the current month is 1, output the total number of days in this month as 31
	when "0011" =>total_days<="11111";--3 
	when "0101" =>total_days<="11111";--5 
	when "0111" =>total_days<="11111";--7 
	when "1000" =>total_days<="11111";--8 
	when "1010" =>total_days<="11111";--10 
	when "1100" =>total_days<="11111";--12 
	when "0100" =>total_days<="11110";--4  
	when "0110" =>total_days<="11110";--6 
	when "1001" =>total_days<="11110";--9 
	when "1011" =>total_days<="11110";--11 
	when "0010"=>   --2
	if (runnian='1') then
	total_days<="11101"; --If it is a leap year, the total number of days in February is 29
	else 
	total_days<="11100"; --No, the total number of days in February is 28 
	end if;
	when others=>null;
end case;
		
		if (ld='0')  then
--The counting stops if the set signal is active			 
		num<=datain;
		maxday<= total_days;
		elsif((clk'event and clk='1')and key6='0') then
		maxday<= total_days;
		if  num =total_days then
		 num<="00001";co<='1';
		 else
		 num <=num+1; co<='0';
		 end if;
		end if;
  end process;
 end architecture art;
			