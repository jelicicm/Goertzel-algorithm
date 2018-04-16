----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:15:24 12/20/2016 
-- Design Name: 
-- Module Name:    filler - Behavioral 
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

entity filler is
    Port ( RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           EN : in  STD_LOGIC;
           X : in  STD_LOGIC_VECTOR (11 downto 0);
           Y : out  STD_LOGIC_VECTOR (60 downto 0));
end filler;

architecture Behavioral of filler is

begin
	process(CLK, RST)
	begin
		if(RST = '0') then
			y <= (others => '0');
		elsif(CLK = '1' and CLK'event) then
			if(EN = '1') then
				y <= (60 downto 30 => X(11)) & X(10 downto 0) & (18 downto 0 => X(11));
			end if;
		end if;
	end process;

end Behavioral;

