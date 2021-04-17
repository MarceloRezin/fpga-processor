-- Implementa uma unidade logica aritimetica que recebe os dados do acumulador e do registrador b e realiza a uma
-- operacao de acordo com o operador informado, como descrito na tabela abaixo. Tambem possui um buffer tri-state
-- para comunicacao com o barramento.
--
--	OP  		| 2  1  0
--	-------------------
--	ADD 		| 0  0  0
--	SUB 		| 0  0  1
-- AND 		| 0  1  0
-- OR  		| 0  1  1
-- XOR 		| 1  0  0
-- NOT(acc) | 1  0  1
--				| 1  1  0
--          | 1  1  1

-- Autor: Marcelo Rezin
-- Data: 14/04/2021

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity arithmetic_logic_unit is
	port (
		bus_io	:	inout	std_logic_vector(7 downto 0);
	
		acc		:	in		std_logic_vector(7 downto 0);
		b_reg		:	in		std_logic_vector(7 downto 0);
		op			:	in		std_logic_vector(2 downto 0);
		alu_out	:	in		std_logic
	);
end arithmetic_logic_unit;

architecture main of arithmetic_logic_unit is

	signal	result	:	std_logic_vector(7 downto 0)	:=	(others => '0');

begin

	result	<=	std_logic_vector(unsigned(acc) + unsigned(b_reg))	when op = "000"	else
					std_logic_vector(unsigned(acc) - unsigned(b_reg))	when op = "001"	else
					acc and b_reg													when op = "010"	else
					acc or b_reg													when op = "011"	else
					acc xor b_reg													when op = "100"	else
					not acc															when op = "101"	else
					(others => '0');

	--Simula um buffer tri-state pra controlar a entrada e saida pelo barramento
	bus_io	<=	result	when	alu_out = '1'	else
					(others => 'Z');

end main;