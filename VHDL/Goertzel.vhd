----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:45:34 12/20/2016 
-- Design Name: 
-- Module Name:    Goertzel - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.package_en.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Goertzel is
	 Generic ( N : integer := 61);
    Port ( RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           X : in  STD_LOGIC_VECTOR (11 downto 0);
           Y1 : out  STD_LOGIC_VECTOR (60 downto 0);
           Y2 : out  STD_LOGIC_VECTOR (60 downto 0));
end Goertzel;

architecture Behavioral of Goertzel is
	
	component registar
		Port ( RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           EN : in  STD_LOGIC;
           X : in  STD_LOGIC_VECTOR(N-1 downto 0);
           Y : out  STD_LOGIC_VECTOR(N-1 downto 0));
	end component;
	
	component adder
		Port ( RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           en : in  STD_LOGIC;
           a : in  STD_LOGIC_VECTOR (N-1 downto 0);
           b : in  STD_LOGIC_VECTOR (N-1 downto 0);
           c : in  STD_LOGIC_VECTOR (N-1 downto 0);
           y : out  STD_LOGIC_VECTOR (N-1 downto 0));
	end component;
	
	component en_gen
		Port ( RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           en_out : out  STD_LOGIC);
	end component;
	
	component filler
		Port ( RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           EN : in  STD_LOGIC;
           X : in  STD_LOGIC_VECTOR (11 downto 0);
           Y : out  STD_LOGIC_VECTOR (60 downto 0));
	end component;
	
	component minus_one
		Port ( RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           en : in  STD_LOGIC;
           X : in  STD_LOGIC_VECTOR (N-1 downto 0);
           Y : out  STD_LOGIC_VECTOR (N-1 downto 0));
	end component;
	
	component multiplier
		Port ( RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           en : in  STD_LOGIC;
           A : in  STD_LOGIC_VECTOR (N-1 downto 0);
           B : in  STD_LOGIC_VECTOR (N-1 downto 0);
           Y : out  STD_LOGIC_VECTOR (N-1 downto 0));
	end component;
	
	--signal en : std_logic;
	signal fill_out : std_logic_vector(N-1 downto 0);
	signal add_out : std_logic_vector(N-1 downto 0);
	signal reg1_out : std_logic_vector(N-1 downto 0);
	signal reg2_out : std_logic_vector(N-1 downto 0);
	signal mult_out : std_logic_vector(N-1 downto 0);
	signal minus_1_out : std_logic_vector(N-1 downto 0);
	constant const : std_logic_vector(N-1 downto 0) := "0000000000000000000000000000001111111111111111101011010011010";
begin

	Y1 <= reg1_out;
	Y2 <= reg2_out;

	REG1: registar port map(RST, CLK, en, add_out, reg1_out);
	REG2: registar port map(RST, CLK, en, reg1_out, reg2_out);
	ADD: adder port map(RST, CLK, '1', fill_out, minus_1_out, mult_out, add_out);
	EN_GNRTR: en_gen port map(RST, CLK, en);
	FILL: filler port map(RST, CLK, '1', X, fill_out);
	MIN_ONE: minus_one port map(RST, CLK, '1', reg2_out, minus_1_out);
	MULT: multiplier port map(RST, CLK, '1', reg1_out, const, mult_out);
	
end Behavioral;

