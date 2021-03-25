-- Implementa um registrador com buffer tri-state para ser usado como acumulador ou registrador auxiliar.
-- Autor: Marcelo Rezin
-- Data: 18/03/2021

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity register_8_bit is
	port (
		clk		:	in		std_logic;
		bus_io	:	inout	std_logic_vector(7 downto 0);
		
		acc_in	:	in		std_logic;
		acc_out	:	in		std_logic;
		reset		:	in		std_logic
	);
end register_8_bit;

architecture main of register_8_bit is

	signal	valor	:	std_logic_vector(7 downto 0)	:=	(others => '0');

begin

	--Simula um buffer tri-state pra controlar a entrada e saida pelo barramento
	bus_io	<=	valor	when	acc_out = '1'	else
					(others => 'Z');

    process(clk)
    begin

        if rising_edge(clk) then
			
			if acc_in = '1' then

				valor	<=	bus_io;
				
			elsif reset = '1' then

				valor	<=	(others => '0');
			
			end if;
			
        end if;

    end process;

end main;