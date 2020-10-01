----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:57:06 10/16/2018 
-- Design Name: 
-- Module Name:    FSM - Behavioral 
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

entity FSM is
	port(
		clk, button, reset, eq: in std_logic;
		display: out std_logic_vector(3 downto 0);
		leds: out std_logic_vector(9 downto 0)
	);
end FSM;

architecture Behavioral of FSM is
	type STATES is (INITIAL, THREE, TWO, ONE, FINAL);
	signal state, next_state: STATES;
begin

	SYNC: process (clk, reset)
	begin
		if clk'event and clk = '1' then
			if reset = '0' then
				state <= INITIAL;
			else
				state <= next_state;
			end if;
		end if;
	end process SYNC;

	COMB: process (state, eq, button)
	begin
		case state is
			when INITIAL =>
				display <= "0000";
				leds <= "1111111111";
				if(button = '1') then next_state <= THREE;
				else						 next_state <= INITIAL;
				end if;
			when THREE =>
				display <= "0011";
				leds <= "0000000000";
				if(button = '1' and eq = '1')      then next_state <= INITIAL;
				elsif(button = '1' and eq = '0')   then next_state <= TWO;
				else						                   next_state <= THREE;
				end if;
			when TWO =>
				display <= "0010";
				leds <= "0000000000";
				if(button = '1' and eq = '1')      then next_state <= INITIAL;
				elsif(button = '1' and eq = '0')   then next_state <= ONE;
				else						                   next_state <= TWO;
				end if;
			when ONE =>
				display <= "0001";
				leds <= "0000000000";
            if(button = '1' and eq = '1')      then next_state <= INITIAL;
				elsif(button = '1' and eq = '0')   then next_state <= FINAL;
				else						                   next_state <= ONE;
				end if;
			when FINAL =>
				display <= "1111";
				leds <= "0000000000";
				next_state <= FINAL;
		end case;
	end process COMB;
end Behavioral;

