----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:29:33 12/20/2016 
-- Design Name: 
-- Module Name:    multiplier - Behavioral 
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
use IEEE.STD_LOGIC_SIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity multiplier is
	Generic(N : integer := 61);
    Port ( RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           en : in  STD_LOGIC;
           A : in  STD_LOGIC_VECTOR (N-1 downto 0);
           B : in  STD_LOGIC_VECTOR (N-1 downto 0);
           Y : out  STD_LOGIC_VECTOR (N-1 downto 0));
end multiplier;

architecture Behavioral of multiplier is
	signal y_tmp : std_logic_vector(2*N - 1 downto 0) := (others => '0');
begin
	y_tmp <= A*B;

	process(CLK, RST)
	begin
		if(RST = '0') then
			Y <= (others => '0');
		elsif(CLK'event and CLK = '1') then
			if(en = '1') then
				Y <= y_tmp(2*N - 1) & y_tmp(89 downto 30);
			end if;
		end if;
	end process;

end Behavioral;

