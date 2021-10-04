library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.numeric_std.all;

entity projet is 

	port( 
		 clk,rst,reception,echo : in std_logic;
		 emission,trig 			: out std_logic
		);
		
end entity projet;

architecture arch of projet is

	signal go 		: std_logic;
	signal distance : std_logic_vector(7 downto 0);
	
	begin
	
	A0 : entity work.uart port map ( clk => clk, 
									 rst => rst,
									 reception => reception,
									 go => go,
									 distance => distance, 
									 emission => emission
									);
							
	A1 : entity work.telemetre port map ( clk => clk,
										  rst => rst,
										  echo => echo,
										  trig => trig,
										  go => go,
										  sortie => distance
										);
										
end architecture;
										  

