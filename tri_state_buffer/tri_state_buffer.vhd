-- Implementa um buffer tri state de 2 sentidos.
-- Autor: Marcelo Rezin
-- Data: 20/03/2021

-- send -> out_bus
-- read <- out_bus

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tri_state_buffer is
	port (
		dir	:	in		std_logic;  -- 0 entrada, 1 saida
		en		:	in		std_logic;
		
		a		:	inout	std_logic_vector(7 downto 0);
		b  	:	inout	std_logic_vector(7 downto 0)
	);
end tri_state_buffer;

architecture main of tri_state_buffer is
begin
	
	b	<= a when dir = '0' and en = '1' else (others => 'Z');
	a	<=	b when dir = '1' and en	= '1' else (others => 'Z');

end main;