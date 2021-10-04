library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_std.all;

entity reception_tb is
end entity;

architecture bench of reception_tb is

	signal clk,rst,reception : std_logic;
	
	begin
	
		CLKGenerator: process
		
		begin
		
			CLK <= '0';
			wait for 5 NS;
			
			CLK <= '1';
			wait for 5 NS;
			
		end process;

		
		reset: process
		
		begin
		
			rst <= '1';
			wait for 10 ns;
			
			rst <= '0';
			wait for 2000 ns;
			
			wait;
			
		end process;
		
		stimulus: process
		
		begin
			-- start
			reception <= '0';
			wait for 3500 ns;
			
			-- bit 0
			reception <= '0';
			wait for 3500 ns;
			
			-- 1
			reception <= '0';
			wait for 3500 ns;
			
			--2
			reception <= '0';
			wait for 3500 ns;
			
			-- 3
			reception <= '1';
			wait for 3500 ns;
			
			-- 4
			reception <= '1';
			wait for 3500 ns;
			
			-- 5
			reception <= '0';
			wait for 3500 ns;
			
			-- 6
			reception <= '0';
			wait for 3500 ns;
			
			-- 7
			reception <= '0';
			wait for 3500 ns;
			
			-- stop
			reception <= '1';
			wait for 3500 ns;
			
		end process;
		
		A0 : entity work.reception port map (clk => clk,
											 rst => rst,
											 reception => reception);
		
end architecture;
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
		
			
			