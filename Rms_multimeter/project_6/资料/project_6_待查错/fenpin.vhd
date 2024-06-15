library ieee;
use ieee.std_Logic_1164.all;
use ieee.std_logic_unsigned.all;
entity fenpin is 
  port(clk_24M:in std_logic;
  --The newly generated clock has 80K 8K 24M
      new_clk_8K:out std_logic;
      new_clk_80k:out std_logic;
      new_clk_24M:out std_logic;
      new_clk_1hz:out std_logic);
end entity fenpin;
architecture art of fenpin is 
begin 
  --new_clk_24M<=clk_24M;
  process(clk_24M)
  variable m_8k:std_logic:='0';
  variable m_80k:std_logic:='0';
  variable m_1hz:std_logic:='0';
  variable data_8k:integer range 0 to 2999:=0;--8k
  variable data_80k:integer range 0 to 299:=0;--80k
  variable data_1hz:integer range 0 to 23999999:=0;--1hz
  begin 
    if (clk_24M'event and clk_24M='1') then
      --if data_8k<2999 then----8k--divide 3000
      if data_8k<1 then--divide 2--Simulation
      data_8k:=data_8k+1;
      else 
        data_8k:=0;
        m_8k:=not(m_8k);
      end if;
      --if data_1hz<24999999 then----1hz--divide 24000000
      if data_1hz<1 then--divide 2--Simulation
        data_1hz:=data_1hz+1;
      else 
        data_1hz:=0;
        m_1hz:=not(m_1hz);
      end if;
      --if data_80k<299 then--80k--divide 300
      if data_80k<1 then--divide 2--Simulation
        data_80k:=data_80k+1;
      else 
        data_80k:=0;
      m_80k:=not(m_80k);
      end if;
      new_clk_8K<=m_8k;
      new_clk_80K<=m_80k;
      new_clk_1hz<=m_1hz;
    new_clk_24M<=m_80k;
    end if;
  end process;
end art;