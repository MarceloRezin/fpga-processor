-- Libs
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Entidade
entity tri_state_buffer_tb is
end tri_state_buffer_tb;

architecture sim of tri_state_buffer_tb is
    
	signal  	dir	:  std_logic               		:=	'0';
	signal	en		:	std_logic 							:=	'1';
	signal	a		:	std_logic_vector(7 downto 0);	
	signal	b  	:	std_logic_vector(7 downto 0)	:=	(others => 'Z');

begin

	DUT :   entity work.tri_state_buffer(main) port map(dir, en, a, b);
	 
	estimulos: process
   begin        

		a	<=	"10101010";
				
		wait for 5 ns;
	 
		dir	<=	'1';	 
		a <= (others => 'Z');
				
		wait for 5 ns;
	 
		b	<= "11100011";
			
		wait for 5 ns;
		en <= '0';

		wait;

   end process;

end sim;