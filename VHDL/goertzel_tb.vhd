--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:35:54 12/20/2016
-- Design Name:   
-- Module Name:   D:/Goertzel_vhdl/goertzel_tb.vhd
-- Project Name:  Goertzel_vhdl
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Goertzel
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use std.textio.all;
use ieee.std_logic_textio.all;
use work.package_en.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY goertzel_tb IS
END goertzel_tb;
 
ARCHITECTURE behavior OF goertzel_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Goertzel
    PORT(
         RST : IN  std_logic;
         CLK : IN  std_logic;
         X : IN  std_logic_vector(11 downto 0);
         Y1 : OUT  std_logic_vector(60 downto 0);
         Y2 : OUT  std_logic_vector(60 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal RST_s : std_logic := '0';
   signal CLK_s : std_logic := '0';
   signal X_s : std_logic_vector(11 downto 0) := (others => '0');

 	--Outputs
   signal Y1_s : std_logic_vector(60 downto 0);
   signal Y2_s : std_logic_vector(60 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
	signal end_of_file : std_logic := '0';
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Goertzel PORT MAP (
          RST => RST_s,
          CLK => CLK_s,
          X => X_s,
          Y1 => Y1_s,
          Y2 => Y2_s
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK_s <= '0';
		wait for CLK_period/2;
		CLK_s <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
	file infile : text is in "sine_bin1.txt";
	variable inline : line;
	variable data_read : std_logic_vector(11 downto 0);
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		RST_s <= '1';
		
		while(not endfile(infile)) loop
			wait until en = '1';

			readline(infile, inline);
			read(inline, data_read);
			x_s <= data_read;	
		end loop;
		
		if(endfile(infile)) then
			x_s <= (others => '0');
			end_of_file <= '1';
		end if;
		
      wait;
   end process;

END;
