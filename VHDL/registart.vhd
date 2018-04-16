----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:34:26 12/20/2016 
-- Design Name: 
-- Module Name:    registar - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity registar is
	Generic(N : integer := 61);
    Port ( RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           EN : in  STD_LOGIC;
           X : in  STD_LOGIC_VECTOR(N-1 downto 0);
           Y : out  STD_LOGIC_VECTOR(N-1 downto 0));
end registar;

architecture Behavioral of registar is

begin
	process(clk, rst)
	begin
		if(RST = '0') then
			y <= (others => '0');
		elsif(CLK'event and CLK = '1') then
			if(EN = '1') then
				Y <= X;
			end if;
		end if;
	end process;

end Behavioral;

