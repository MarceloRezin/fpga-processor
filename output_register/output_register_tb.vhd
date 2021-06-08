-- Libs
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;

-- Entidade
entity output_register_tb is
end output_register_tb ;

architecture sim of output_register_tb	is
    
	signal	clk		:  std_logic							:=	'0';
	signal	bus_io	:	std_logic_vector(7 downto 0)	:=	(others => 'Z');
	signal	out_view	:	std_logic_vector(7 downto 0)	:=	(others => '0');

	signal	reset		:	std_logic							:=	'0';
	signal  	opr_in	:  std_logic							:=	'0';
	
	--signal  	sig_sw	:  std_logic							:=	'0';
	 
	--signal	unidade	:	std_logic_vector(6 downto 0);
	--signal	dezena	:	std_logic_vector(6 downto 0);
	--signal	centena	:	std_logic_vector(6 downto 0);
	--signal	sinal		:	std_logic;

begin

	DUT	:	entity work.output_register(main) port map(clk, bus_io, opr_in, reset, out_view);
	
	clk	<=	not clk after 2 ns;
	
	estimulos: process
   begin        
	
		wait for 20 ns;
		
		bus_io	<=	"00010001";
		
		opr_in	<=	'1';
		
		wait for 6 ns;
	
		opr_in	<=	'0';
		
		bus_io	<=	"11111111";
		
		wait for 6 ns;

		opr_in	<=	'1';
	
		wait for 6 ns;

		opr_in	<=	'0';
--		sig_sw	<=	'1';
		
		wait for 20 ns;
		
		reset		<= '1';

      wait;

   end process;
	 
end sim;