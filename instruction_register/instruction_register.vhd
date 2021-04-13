-- Implementa um registrador com buffer tri-state para ser usado no armazenamento da instrucao.
-- Libera o LSB no barramento e o MSB para a unidade de controle.
-- Autor: Marcelo Rezin
-- Data: 18/03/2021

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity instruction_register is
	port (
		clk		:	in		std_logic;
		bus_io	:	inout	std_logic_vector(7 downto 0);
		
		ir_in		:	in		std_logic;
		ir_out	:	in		std_logic;
		reset		:	in		std_logic;
		
		ctrl_out	:	out	std_logic_vector(3 downto 0) -- MSB vai para unidade de controle
	);
end instruction_register;

architecture main of instruction_register is

	signal	operador	:	unsigned(3 downto 0)	:=	(others => '0'); -- MSB
	signal	operando	:	unsigned(3 downto 0)	:=	(others => '0'); -- LSB

begin

	--Simula um buffer tri-state pra controlar a entrada e saida pelo barramento
	bus_io	<=	std_logic_vector(resize(operando, bus_io'length))	when	ir_out = '1'	else
					(others => 'Z');
					
	ctrl_out	<= std_logic_vector(operador) when ir_out	= '1'	else
					(others => '0');

    process(clk)
    begin

        if rising_edge(clk) then
			
			if ir_in = '1' then

				operador	<=	unsigned(bus_io(7 downto 4));
				operando	<=	unsigned(bus_io(3 downto 0));
				
			elsif reset = '1' then

				operador	<=	(others => '0');
				operando	<=	(others => '0');
			
			end if;
			
        end if;

    end process;

end main;