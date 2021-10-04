library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_std.all;

entity ME is 

	port( go,h,raz,fin_bits,fin_transmits : in std_logic;
		  cmd : out std_logic_vector(1 downto 0);
		  rst_cpt_bit : out std_logic);
		  
end entity;

architecture ME_a of ME is

	type state_type is (Attente,Attd_bit,Chargement,Memorisation,Decalage);
	signal State : state_type;
	
	begin

	process(h)
	begin
	
		if raz = '1' then
		
			State <= Attente;
			cmd <= "11";
			rst_cpt_bit <= '0';
			
		elsif rising_edge(h) then
		
			case State is
			
			when Attente =>
			
				if go = '1' then
				
					State <= Attd_bit;
					cmd <= "01";
					rst_cpt_bit <= '1';
					
				end if;
				
			when Attd_bit => 
			
				if fin_bits = '1' then
				
					State <= Chargement;
					cmd <= "10";
					rst_cpt_bit <= '0';
					
				end if;
				
			when Chargement => 
			
				State <= Memorisation;
				cmd <= "01";
				rst_cpt_bit <= '0';
				
			when Memorisation =>
			
				if fin_bits = '1' then
				
					State <= Decalage;
					cmd <= "00";
					rst_cpt_bit <= '0';
					
				end if;
				
			when Decalage => 
			
				if fin_transmits = '1' then
				
					State <= Attente;
					cmd <= "11";
					rst_cpt_bit <= '0';
					
				else 
				
					State <= Memorisation;
					cmd <= "01";
					rst_cpt_bit <= '0';
					
				end if;
				
			end case;
			
		end if;
		
	end process;
	
end architecture;	

			
		  