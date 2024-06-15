library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity TZKZQ is
    port(key3: in std_logic;  
	     key4: in std_logic;
         key5: in std_logic;
         key6: in std_logic;
         clk_key:in std_logic;
         max_days:in std_logic_vector(4 downto 0);
         sec_en,min_en,hour_en,day_en,
         mon_en,year_en,week_en:out std_logic;
         hour_cur:in std_logic_vector(4 downto 0);
         min_cur,sec_cur:in std_logic_vector(5 downto 0);
         year_cur:in std_logic_vector(6 downto 0);
         mon_cur:in std_logic_vector(3 downto 0);
         day_cur:in std_logic_vector(4 downto 0);
         week_cur:in std_logic_vector(2 downto 0);
         sec,min:buffer std_logic_vector(5 downto 0);
         hour:buffer std_logic_vector(4 downto 0);
         day:buffer std_logic_vector(4 downto 0);
         mon:buffer std_logic_vector(3 downto 0);
         year:buffer std_logic_vector(6 downto 0);
         week:buffer std_logic_vector(2 downto 0));
end entity TZKZQ;
architecture art of tzkzq is
type statetype is (normal,sec_set,min_set,hour_set,
	               day_set,mon_set,year_set,week_set);
	signal mode :statetype; 
	signal key :std_logic_vector(2 downto 0);
	begin
	key<=key3&key4&key5;

    process(key,clk_key) is
	begin  
    -- sec_en<="1";
    -- min_en<="1";
    -- hour_en<="1";
    -- day_en<="1";
    -- mon_en<="1";
    -- year_en<="1";
    -- week_en<="1"; 
--assigning initial values in VHDL synthesis is meaningless

	if clk_key'event and clk_key='1' then
    
    if (key="000") then 
        sec_en<='1';
        min_en<='1';
        hour_en<='1';
        day_en<='1';
        mon_en<='1';
        year_en<='1';
        week_en<='1';   
    end if;
    --give an initial state based on the initial hardware in sequential statements

    if (key="001") then mode <=sec_set;sec_en<='0';sec<=sec_cur; 
    else sec_en<='1';
    end if;

    if (key="010") then mode <=min_set;min_en<='0';min<=min_cur;
    else min_en<='1';
    end if;

    if (key="011") then mode <=hour_set;hour_en<='0';hour<=hour_cur;
    else hour_en<='1';
    end if;

    if (key="100") then mode <=day_set;day_en<='0';day<=day_cur;
    else day_en<='1';
    end if;

    if (key="101") then mode <=mon_set;mon_en<='0';mon<=mon_cur;
    else mon_en<='1';
    end if;

    if (key="110") then mode <=year_set;year_en<='0';year<=year_cur;
    else year_en<='1';
    end if;

    if (key="111") then mode <=week_set;week_en<='0';week<=week_cur; 
    else week_en<='1';
    end if;

--when the set signal is active, there will be no carry
--when the set signal is invalid, counting will continue

    if(key6='1') then
    case mode is
    when sec_set=>
        if sec="111011" then
                        sec<="000000";
                    else
                        sec<=sec+1;
                    end if;
    when min_set=>
        if min="111011" then
                        min<="000000";
                    else
                        min<=min+1;
                    end if;
    when hour_set=>
        if hour="11000" then
                        hour<="00000";
                    else
                        hour<=hour+1;
                    end if;
    when day_set=>
        if day=max_days then
                        day<="00001";
                    else
                        day<=day+1;
                    end if;
    when mon_set=>--mon<=mon_cur;
        if mon="1100" then
                        mon<="0001";
                    else
                        mon<=mon+1;
                    end if;
    when year_set=>
        if year="1100011" then
                        year<="0000001";
                    else
                        year<=year+1;
                    end if;
    when week_set=>
        if week="111" then
                        week<="001";
                    else
                        week<=week+1;
                    end if;
    when others =>null;
    end case;
	end if;

    end if;
	end process;
end architecture art;