-- Implementa uma memoria ram com 64 bits de capacidade (16x8) e um buffer tri-state
-- Autor: Marcelo Rezin
-- Data: 26/04/2021

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity memory_address_register is
	port (
		clk		:	in		std_logic;
		bus_io	:	in		std_logic_vector(7 downto 0);

		mar_in	:	in		std_logic;
		reset		:	in		std_logic;
		add		:	out	std_logic_vector(3 downto 0)
	);
end memory_address_register;

architecture main of memory_address_register is

	signal	valor	:	std_logic_vector(3 downto 0)	:=	(others => '0');

begin
	
	add		<=	valor;

    process(clk)
    begin

        if rising_edge(clk) then
			
			if mar_in = '1' then

				valor	<=	bus_io(3 downto 0);
				
			elsif reset = '1' then

				valor	<=	(others => '0');
			
			end if;
			
        end if;

    end process;

end main;