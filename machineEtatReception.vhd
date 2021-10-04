library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_std.all;

entity machineEtatReception is
	port( 
		 clk, rst, emission : in std_logic;
		 tick1bit			: in std_logic
		);
end machineEtatReception;

architecture rtl of machineEtatReception is
	
	type StateType is ( initiation, attente, charge, stop);
	signal etat : StateType;
	signal registre : std_logic_vector(7 downto 0);
	signal i : integer;
	
	begin
	
		process(clk,rst)
		begin
			if rst = '1' then
				etat <= initiation;
				i <= 0;
				registre <= (others => '0');
				
			elsif rising_edge(clk) then
			
				case etat is
				
					when initiation =>
					
						if emission = '0' then
							
							if tick1bit = '1' then
								
								etat <= attente;
								i <= i + 1;
							end if;
							
						else
							
							etat <= initiation;
							i <= 0;
							registre <= (others => '0');
							
						end if;
						
					when attente =>
					
						if tick1bit = '1' then
							
							if i<9 then
							
								etat <= charge;
								registre(i - 1) <= emission;
								
							elsif i >= 9 then
								
								if emission = '1' then
								
									etat <= stop;
									
								else 
									
									etat <= initiation;
									i <= 0;
									registre <= (others => '0');
									
								end if;
							
							end if;
							
						end if;
						
					when charge => 
						
						etat <= attente;
						i <= i + 1;
						
					when stop => 
					
						if tick1bit = '1' then 
						
							etat <= initiation;
							i <= 0;
							registre <= (others => '0');
							
						end if;
		
				end case;

			end if;
			
		end process;
		
end architecture;
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						