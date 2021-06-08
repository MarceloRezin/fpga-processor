-- Implementa um registrador de saida, que fornece uma visualizacao dos resultados.
-- Autor: Marcelo Rezin
-- Data: 06/05/2021

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;

entity output_register is
	port (
		clk		:	in		std_logic;
		bus_io	:	in		std_logic_vector(7 downto 0);
		
		opr_in	:	in		std_logic;
		--sig_sw	:	in		std_logic; --Switch de sinal
		reset		:	in		std_logic;
		
		--unidade	:	out	std_logic_vector(6 downto 0);
		--dezena	:	out	std_logic_vector(6 downto 0);
		--centena	:	out	std_logic_vector(6 downto 0);
		--sinal		:	out	std_logic
		out_view	:	out		std_logic_vector(7 downto 0)
	);
end output_register;

architecture main of output_register is

	component register_8_bit is
		port (
			clk		:	in		std_logic;
			bus_io	:	inout	std_logic_vector(7 downto 0);
			
			acc_in	:	in		std_logic;
			acc_out	:	in		std_logic;
			reset		:	in		std_logic
		);
	end component register_8_bit;
	
	--component sete_seg_display is
	--	port(
	--		numero      :   in integer range 0 to 9;
	--		out_display :   out std_logic_vector(6 downto 0)
	--	);
	--end component sete_seg_display;

	signal	valor_reg	:	std_logic_vector(7 downto 0)	:=	(others => '0');
	signal	reg_out		:	std_logic;
	
	--signal	valor_reg_int	:	integer range -128 to 255;

	--signal  resto_cem      :   integer range 0 to 99            :=  0;
	
	--signal  centena_tmp      :   integer range 0 to 9            :=  0;
	--signal  dezena_tmp      :   integer range 0 to 9            :=  0;
	--signal  unidade_tmp     :   integer range 0 to 9            :=  0;

begin

	registrador	:	register_8_bit port map(clk, valor_reg, opr_in, reg_out,reset);
	
	valor_reg	<=	bus_io when opr_in = '1' else
						(others => 'Z');
						
	reg_out		<=	not opr_in;
	
	out_view		<= valor_reg when reg_out = '1' else
						(others => '0');
	
	
	--sinal	<=	sig_sw;
	
	--valor_reg_int	<=	to_integer(unsigned(valor_reg)) when sig_sw = '0' else
	--						to_integer(signed(valor_reg));

	--resto_cem	<=	valor_reg_int rem 100;
	
	--centena_tmp	<=	valor_reg_int / 100;
	--dezena_tmp <= resto_cem / 10;
	--unidade_tmp <=	resto_cem rem 10;
	
	--display_centena	:	sete_seg_display port map(centena_tmp, centena);
	--display_dezena		:  sete_seg_display port map(dezena_tmp, dezena);
   --display_unidade	:  sete_seg_display port map(unidade_tmp, unidade);

end main;