--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:37:30 10/16/2018
-- Design Name:   
-- Module Name:   /bin/lab2/total_tb.vhd
-- Project Name:  lab2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: total
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY total_tb IS
END total_tb;
 
ARCHITECTURE behavior OF total_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT total
    PORT(
         clock : IN  std_logic;
         butt : IN  std_logic;
         rst : IN  std_logic;
         switches_in : IN  std_logic_vector(7 downto 0);
         display_out : OUT  std_logic_vector(6 downto 0);
         leds_out : OUT  std_logic_vector(9 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal butt : std_logic := '0';
   signal rst : std_logic := '0';
   signal switches_in : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal display_out : std_logic_vector(6 downto 0);
   signal leds_out : std_logic_vector(9 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: total PORT MAP (
          clock => clock,
          butt => butt,
          rst => rst,
          switches_in => switches_in,
          display_out => display_out,
          leds_out => leds_out
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 10 ns;	
         butt <= '0';
         rst <= '1';
         switches_in <= "00000000";
      wait for 10 ns;
			switches_in <= "01010101";
		wait for 10 ns;	
			butt <= '1';
		wait for 10 ns;
			butt <= '0';
		wait for 10 ns;
			rst <= '0';
		wait for 10 ns;
			rst <= '1';
		wait for 10 ns;	
			switches_in <= "11000011";
		wait for 10 ns;	
			butt <= '1';
		wait for 10 ns;
			butt <= '0';
		wait for 10 ns;
			switches_in <= "11010011";
		wait for 10 ns;	
			butt <= '1';
		wait for 10 ns;
			butt <= '0';
		wait for 10 ns;
			switches_in <= "11000011";
		wait for 10 ns;	
			butt <= '1';
		wait for 10 ns;
			butt <= '0';

      -- insert stimulus here 

      wait;
   end process;

END;
