library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_std.all;

entity compteurs is 

	port( rst_cpt_bit,h,raz : in std_logic;
		  fin_bits, fin_transmits : out std_logic
		);
		
end entity;

architecture RTL of compteurs is

signal top_325, fin_bit_tmp : std_logic;

begin

	-- Diviseur d'horloge (/325)
	process(h,raz) is
	
		variable reg_div : natural range 0 to 324;
		
		begin
		
		if raz = '1' then
			reg_div := 0;
			
		elsif rising_edge(h) then
		
			if reg_div = 324 then
				reg_div := 0; 
				top_325 <= '1';
				
			else 
				reg_div := reg_div + 1; 
				top_325 <= '0';
				
			end if;
			
		end if;
		
	end process;

	-- Diviseur de diviseur d'horloge (/16)
	process(h,raz) is
	
		variable reg_div_16 : natural range 0 to 15;
		
		begin
	
		if raz = '1' then 
			reg_div_16 := 0;
			
		elsif rising_edge(h) then
		
			if top_325 = '1' then
			
				if reg_div_16 = 15 then 
					reg_div_16 := 0; 
					fin_bit_tmp <='1';
					
				else 
					reg_div_16 := reg_div_16 + 1; 
					fin_bit_tmp <= '0';
					
				end if;
	
			else 
				reg_div_16 := reg_div_16; 
				fin_bit_tmp <= '0';
				
			end if;
	
		end if;
		
	end process;

	fin_bits<=fin_bit_tmp;

	-- Compte le nombre de bit's
	process(h,raz) is
	
	variable cpt_bit : natural range 0 to 10;
	
	begin
	
		if raz = '1' then 
			cpt_bit := 0;
			
		elsif rising_edge(h) then
		
			if rst_cpt_bit = '1' then
				cpt_bit := 0;
				
			elsif fin_bit_tmp = '1' then
			
				if cpt_bit = 9 then 
					cpt_bit := 0; 
					fin_transmits <= '1';
					
				else 
					cpt_bit := cpt_bit + 1; 
					fin_transmits <= '0';
					
				end if;
				
			else 
				cpt_bit := cpt_bit; 
				fin_transmits <= '0';
			
			end if;
			
		end if;

	end process;

end architecture;
