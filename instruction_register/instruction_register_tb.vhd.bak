-- Libs
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Entidade
entity register_8_bit_tb is
end register_8_bit_tb;

architecture sim of register_8_bit_tb  is
    
    signal  clk      :  std_logic               		:=	'0';
	 signal	bus_io	:	std_logic_vector(7 downto 0)	:=	(others => 'Z');
	 signal  acc_in	:  std_logic							:=	'0';
	 signal  acc_out	:  std_logic							:=	'0';
	 signal  reset		:  std_logic							:=	'0';

begin

	DUT	:	entity work.register_8_bit(main) port map(clk, bus_io, acc_in, acc_out, reset);

	clk	<=	not clk after 2 ns; -- 50MHZ 50% duty cicle
	
	estimulos: process
   begin        
	
		wait for 20 ns;
		
		bus_io	<=	"10101010";
		
		wait for 20 ns;
		
		acc_in	<=	'1';
		
		wait for 30 ns;
		
		acc_in	<=	'0';
		bus_io	<=	(others => 'Z');
		
		wait for 10 ns;
		
		acc_out	<=	'1';
	
      wait;

   end process;
	 
end sim;