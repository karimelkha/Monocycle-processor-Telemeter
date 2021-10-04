library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_std.all;

entity uart_tb is 
end entity;

architecture bench of uart_tb is

	signal clk, rst, reception,go : std_logic;
	signal distance :  std_logic_vector(7 downto 0);
    signal emission :  std_logic;
	
	begin
	
	clock: process
	begin
		while now <= 10000000 ns loop
			clk <= '0';
			wait for 20 ns;
			clk <= '1';
			wait for 20 ns;
			end loop;
			wait;
	end process;
		
	reset: process
	begin 
		rst <= '1';
		wait for 1000 ns;
		rst <= '0';
		wait;
	end process;
	
	stimulus: process
	begin
	
	wait for 200 ns;
	
            reception<='0'; --start 

        wait for 200 ns;
		
            reception<='1'; -- 0

        wait for 200 ns; 
		
            reception<='0'; -- 1

        wait for 200 ns;
		
            reception<='0'; -- 2

        wait for 200 ns;
		
            reception<='0'; -- 3

        wait for 200 ns;
		
            reception<='1'; -- 4

        wait for 200 ns;
		
            reception<='0'; -- 5

        wait for 200 ns;
		
            reception<='1'; -- 6

        wait for 200 ns;
		
            reception<='0'; -- 7
			
        wait for 200 ns;
		
            reception<='1'; --stop 
			
        wait for 200 ns;
		
	end process;
	
	AZERTY : entity work.uart port map ( clk => clk,
										 rst => rst, 
										 reception => reception,
										 go => go,
										 distance => distance,
										 emission => emission
										);
										
end architecture;
		
		
	