-- Implementa o contador de programa que se comunica com o barramento.
-- Autor: Marcelo Rezin
-- Data: 18/03/2021

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity program_counter is
	port (
		clk		:	in		std_logic;
		bus_io	:	inout	std_logic_vector(7 downto 0);
		
		inc		:	in		std_logic;
		jmp		:	in		std_logic;
		pc_out	:	in		std_logic;
		reset		:	in		std_logic
	);
end program_counter;

architecture main of program_counter is

	signal	contagem	:	unsigned(3 downto 0)	:=	(others => '0'); -- 4 bits para PC

begin

	--Simula um buffer tri-state pra controlar a entrada e saida pelo barramento
	bus_io	<=	std_logic_vector(resize(contagem, bus_io'length))	when	pc_out = '1'	else
					(others => 'Z');

    process(clk)
    begin

        if rising_edge(clk) then
			
			if inc = '1' then

				contagem	<=	contagem + "0001";
				
			elsif jmp = '1' then

				contagem	<=	resize(unsigned(bus_io), contagem'length);
			
			end if;
			
        end if;

    end process;

end main;