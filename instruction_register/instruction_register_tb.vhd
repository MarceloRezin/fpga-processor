-- Libs
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Entidade
entity instruction_register_tb is
end instruction_register_tb;

architecture sim of instruction_register_tb  is
    
    signal  clk      :  std_logic               		:=	'0';
	 signal	bus_io	:	std_logic_vector(7 downto 0)	:=	(others => 'Z');
	 signal  ir_in		:  std_logic							:=	'0';
	 signal  ir_out	:  std_logic							:=	'0';
	 signal  reset		:  std_logic							:=	'0';

begin

	DUT	:	entity work.instruction_register(main) port map(clk, bus_io, ir_in, ir_out, reset);

	clk	<=	not clk after 2 ns; -- 50MHZ 50% duty cicle
	
	estimulos: process
   begin        
	
		wait for 20 ns;
		
		bus_io	<=	"00011110";
		
		wait for 20 ns;
		
		ir_in	<=	'1';
		
		wait for 30 ns;
		
		ir_in	<=	'0';
		bus_io	<=	(others => 'Z');
		
		wait for 10 ns;
		
		ir_out	<=	'1';
	
      wait;

   end process;
	 
end sim;