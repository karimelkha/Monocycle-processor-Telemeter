library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_std.all;

entity emission_tb is 
end entity;

architecture bench of emission_tb is

	signal go,h,raz   : std_logic;
	signal din 	   : std_logic_vector(7 downto 0);
	signal sout	   : std_logic;

	begin
	
		CLKGenerator: process
		begin
			while now <= 1000000 NS loop
			  h <= '0';
			  wait for 20 NS;
			  h <= '1';
			  wait for 20 NS;
			end loop;
			wait;
		end process;

		STIMULUSRES: process
		begin
		raz <= '1';
		wait for 50 NS;
		raz <= '0';
		wait;
		end process STIMULUSRES;
		
		STIMULUS: process
		begin
		go <= '0';
		din <= "01100010";
		wait for 100 NS;
		go <= '1';
		wait;
		end process;
		
		
		UUT: entity work.emission(RTL) port map(
												 go   => go,
												 h    => h,
												 raz  => raz,
												 din  => din,
												 sout => sout);
												 
end architecture;
		
		
		
		
		
		
		
		
		
		
		
		

