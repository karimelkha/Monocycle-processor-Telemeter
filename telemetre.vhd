library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.numeric_std.all;

entity telemetre is 

	port(
		 clk,rst,echo : in std_logic;
		 trig, go 	  : out std_logic;
		 sortie		  : out std_logic_vector(7 downto 0)
		);
end entity;

architecture arch of telemetre is

	type statetype is (initiation, A1,A2,A3,A4,A5,A6);
	signal state : statetype;
	signal compteur : integer;
	
	begin
	
		process(clk,rst)
			
		begin
		
			if rst = '1' then
			
				state <= initiation;
				compteur <= 0;
				
			elsif rising_edge(clk) then
				
				case state is
					
					when initiation =>
						
						state <= A1;
						trig <= '1';
						compteur <= compteur+1;
						
					when A1 => 
						
						if compteur >= 500 then
							
							state <= A2;
							trig <= '1';
							compteur <= compteur + 1;
						
						end if;
						
					when A2 =>
					
						if echo = '1' then
						
							compteur <= compteur + 1;
							state <= A3;
							
						end if;
					
				when A3 =>
				
					if echo = '0' then
					
						state <= A4;
						
					else
					
						state <= A3;
						compteur <= compteur + 1;
						
					end if;
					
				when A4 =>
				
					if (compteur >= 750000) then
					
						state <= A6;
						compteur <= compteur + 1;
						go <= '0';
						sortie <= (others => '0');
						
					else
					
						state <= A5;
						sortie <= std_logic_vector(to_unsigned((34*compteur)/1E5,8));
						go <= '1';
						
					end if;
					
				when A5 =>
				
					state <= A6;
					compteur <= compteur + 1;
					go <= '0';
					
				when A6 =>
				
					if compteur > 5E6 then
					
						state <= initiation;
						compteur <= 0;
						
					else
					
						state <= A6;
						compteur <= compteur + 1;
						go <= '0'; 
						
					end if;
					
			end case;
			
		end if;
		
	end process;
	
end architecture;
						
						
						
						
						
						
						
						
						
						
						
						
						
						