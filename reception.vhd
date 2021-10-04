library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_std.all;   

entity reception is
	port(
	
		 clk,rst, reception : in std_logic
		 
		 );
end entity;

architecture rtl of reception is
	
	signal Tick10us : std_logic;
	
	begin
	
		A0 : entity work.FDIV generic map ( Fclock => 50E6)
							  port    map ( clk => clk,
											rst => rst,
											Tick10us => Tick10us
										  );
		
		A1 : entity work.machineEtatReception port map( clk => clk,
														rst => rst,
														emission => reception,
														tick1bit => Tick10us
													  );
				
end architecture;