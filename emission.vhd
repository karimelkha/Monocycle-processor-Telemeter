library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_std.all;

entity emission is 
	port( go,h,raz : in std_logic;
		  din 	   : in std_logic_vector(7 downto 0);
		  sout	   : out std_logic);
end entity;

architecture RTL of emission is 

	signal fin_bits,fin_transmits,rst_cpt_bit : std_logic;
	signal cmd : std_logic_vector(1 downto 0);



	begin

	C0: entity work.compteurs port map(rst_cpt_bit =>rst_cpt_bit,
						   h =>h,
						   raz =>raz,
						   fin_bits =>fin_bits,
						   fin_transmits => fin_transmits
						   );
						   
	C1: entity work.decalage port map(cmd => cmd,
						  din => din,
						  h => h,
						  raz => raz,
						  sout => sout
						  );
	
	C2: entity work.ME port map(go => go,
					h => h,
					raz => raz,
					fin_bits => fin_bits,
					fin_transmits => fin_transmits,
					cmd => cmd,
					rst_cpt_bit => rst_cpt_bit
					);


end architecture;






