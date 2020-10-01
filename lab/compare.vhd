----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:06:24 10/16/2018 
-- Design Name: 
-- Module Name:    compare - Behavioral 
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

entity compare is
	port(
		switches, solution: in std_logic_vector(7 downto 0);
		eq: out std_logic
	);
end compare;

architecture Behavioral of compare is

begin
	process(switches, solution)
	begin
		if(switches = solution) then
			eq <= '1';
		else
			eq <= '0';
		end if;
	end process;
end Behavioral;

