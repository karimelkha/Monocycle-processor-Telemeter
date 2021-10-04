library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_std.all;

entity uart is
	
	port(
		 clk, rst, reception,go : in std_logic;
		 distance : in std_logic_vector(7 downto 0);
		 emission : out std_logic
		);
		
end entity;

architecture arch of uart is

	begin
	
	A0 : entity work.reception port map ( clk => clk,
										  rst => rst,
										  reception => reception
										);
										
    A1 : entity work.emission port map ( go => go,
										 h => clk, 
										 raz => rst,
										 din => distance,
										 sout => emission
										);
										
end architecture;
		 
		