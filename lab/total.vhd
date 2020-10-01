----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:28:03 10/16/2018 
-- Design Name: 
-- Module Name:    total - Behavioral 
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

entity total is
	port(
		clock, butt, rst: in std_logic;
		switches_in: in std_logic_vector(7 downto 0);
		display_out: out std_logic_vector(6 downto 0);
		leds_out: out std_logic_vector(9 downto 0)
	);
end total;


architecture Structural of total is
	component FSM
	port(
		clk, button, reset, eq: in std_logic;
		display: out std_logic_vector(3 downto 0);
		leds: out std_logic_vector(9 downto 0)
	);
	end component;
	component compare
		port (
			switches, solution: in std_logic_vector(7 downto 0);
			eq: out std_logic
		);
	end component;
	component regist
		port(
			load, clk, reset: in std_logic;
			switches: in std_logic_vector(7 downto 0);
			display : in  STD_LOGIC_VECTOR (3 downto 0);
			solution: out std_logic_vector(7 downto 0)
		);
	end component;
	component conv_7seg
		port( 
			x       : in   STD_LOGIC_VECTOR (3 downto 0);
			display : out  STD_LOGIC_VECTOR (6 downto 0) 
		);
	end component;
--	component debouncer
--		port (
--		   rst             : in std_logic;
--		   clk             : in std_logic;
--			x               : in std_logic;
--	      xDeb            : out std_logic;
--	  	   xDebFallingEdge : out std_logic;
--			xDebRisingEdge  : out std_logic
--		);
--	end component;
	signal OUTPUT_SOL: std_logic_vector(7 downto 0); 
	signal LEDS_NUM: std_logic_vector(9 downto 0); 
	signal DISP_NUM: std_logic_vector(6 downto 0);
	signal DISP: std_logic_vector(3 downto 0); 
	signal EQUAL, XDEB, XFALLING, XRISING: std_logic;
	begin
--	   mod_debouncer: debouncer port map (rst, clock, butt, XDEB, XFALLING, XRISING);
		mod_regist: regist port map (butt, clock, rst, switches_in, DISP, OUTPUT_SOL);--
		mod_compare: compare port map (switches_in, OUTPUT_SOL, EQUAL);
		mod_FSM: FSM port map (clock, butt, rst, EQUAL, DISP, LEDS_NUM);--
		mod_conv_7seg: conv_7seg port map (DISP, DISP_NUM);
		
		display_out <= DISP_NUM;
		leds_out <= LEDS_NUM;

end Structural;

