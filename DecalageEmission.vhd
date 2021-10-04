library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_std.all;

entity decalage is 

	port( cmd 	: in std_logic_vector(1 downto 0);
		  din 	: in std_logic_vector(7 downto 0);
		  h,raz : in std_logic;
		  sout	: out std_logic);
		  
end entity;

architecture RTL of decalage is

	signal registre : std_logic_vector(9 downto 0);
	
	begin

	
	process (h,raz) is
	
	begin
	
		if raz = '1' then 
			registre <= (others => '1');
			
		elsif rising_edge(h) then
		
			case cmd is
			
				when "00" => registre <= '1'& registre(9 downto 1);
				
				when "10" => registre <= '1'& din & '0';
				
				when "01" => registre <= registre; 
				
				when "11" => registre <= (others => '1');
				
				when others => registre <= (others => '1');
				
			end case;
			
		end if;
		
	end process;
	
	sout <= registre(0);

end architecture;
