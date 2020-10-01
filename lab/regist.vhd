----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:17:11 10/16/2018 
-- Design Name: 
-- Module Name:    regist - Behavioral 
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

entity regist is
	port(
		load, clk, reset: in std_logic;
		switches: in std_logic_vector(7 downto 0);
		display : in  STD_LOGIC_VECTOR (3 downto 0);
		solution: out std_logic_vector(7 downto 0)
	);
end regist;

architecture Behavioral of regist is

begin
	process (clk, reset) 
	begin
      if rising_edge(clk) then 
			if (reset = '0') then 
				solution <= "00000000"; 
         elsif (load = '1' and display = "0000") then 
            solution <= switches; 
         end if; 
		end if;
	end process;
end Behavioral;

