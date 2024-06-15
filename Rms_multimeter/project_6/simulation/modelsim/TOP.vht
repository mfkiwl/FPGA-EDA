-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "05/19/2023 13:21:32"
                                                            
-- Vhdl Test Bench template for design  :  TOP
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY TOP_vhd_tst IS
END TOP_vhd_tst;
ARCHITECTURE TOP_arch OF TOP_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL ale1 : STD_LOGIC;
SIGNAL ale2 : STD_LOGIC;
SIGNAL clk24M : STD_LOGIC：='0';
SIGNAL dout : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL eoc1 : STD_LOGIC;
SIGNAL eoc2 : STD_LOGIC;
SIGNAL key : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL oe1 : STD_LOGIC;
SIGNAL oe2 : STD_LOGIC;
SIGNAL s_din1 : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL s_din2 : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL s_new_clk_1hz : STD_LOGIC;
SIGNAL s_new_clk_8K : STD_LOGIC;
SIGNAL s_new_clk_24M : STD_LOGIC;
SIGNAL s_new_clk_80k : STD_LOGIC;
SIGNAL s_rom_clk_din1 : STD_LOGIC;
SIGNAL s_shizaigonglv : STD_LOGIC_VECTOR(17 DOWNTO 0);
SIGNAL sel : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL start1 : STD_LOGIC;
SIGNAL start2 : STD_LOGIC;
COMPONENT TOP
	PORT (
	ale1 : OUT STD_LOGIC;
	ale2 : OUT STD_LOGIC;
	clk24M : IN STD_LOGIC;
	dout : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	eoc1 : IN STD_LOGIC;
	eoc2 : IN STD_LOGIC;
	key : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	oe1 : OUT STD_LOGIC;
	oe2 : OUT STD_LOGIC;
	s_din1 : BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0);
	s_din2 : BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0);
	s_new_clk_1hz : BUFFER STD_LOGIC;
	s_new_clk_8K : BUFFER STD_LOGIC;
	s_new_clk_24M : BUFFER STD_LOGIC;
	s_new_clk_80k : BUFFER STD_LOGIC;
	s_rom_clk_din1 : BUFFER STD_LOGIC;
	s_shizaigonglv : BUFFER STD_LOGIC_VECTOR(17 DOWNTO 0);
	sel : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	start1 : OUT STD_LOGIC;
	start2 : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : TOP
	PORT MAP (
-- list connections between master ports and signals
	ale1 => ale1,
	ale2 => ale2,
	clk24M => clk24M,
	dout => dout,
	eoc1 => eoc1,
	eoc2 => eoc2,
	key => key,
	oe1 => oe1,
	oe2 => oe2,
	s_din1 => s_din1,
	s_din2 => s_din2,
	s_new_clk_1hz => s_new_clk_1hz,
	s_new_clk_8K => s_new_clk_8K,
	s_new_clk_24M => s_new_clk_24M,
	s_new_clk_80k => s_new_clk_80k,
	s_rom_clk_din1 => s_rom_clk_din1,
	s_shizaigonglv => s_shizaigonglv,
	sel => sel,
	start1 => start1,
	start2 => start2
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
        -- code that executes only once                      
WAIT;                                                       
END PROCESS init;                                           
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN                                                         
        -- code executes for every event on sensitivity list  
		  clk24M<=not clk24M after 20ns;
WAIT;                                                        
END PROCESS always;                                          
END TOP_arch;
