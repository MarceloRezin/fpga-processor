-- Libs
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Entidade
entity memory_address_register_tb is
end memory_address_register_tb ;

architecture sim of memory_address_register_tb	is
    
	 signal  clk		:  std_logic							:=	'0';
	 signal	bus_io	:	std_logic_vector(7 downto 0)	:=	(others => 'Z');
	 signal	add		:	std_logic_vector(3 downto 0)	:=	"0000";
	 signal  mar_in	:  std_logic							:=	'0';
	 signal  reset		:  std_logic							:=	'0';

begin

	DUT	:	entity work.memory_address_register(main) port map(clk, bus_io, mar_in, reset, add);
	
	clk	<=	not clk after 2 ns;
	
	estimulos: process
   begin        
	
		wait for 20 ns;
		
		bus_io	<=	"00011001";
		
		mar_in	<=	'1';
		
		wait for 6 ns;
	
		mar_in	<=	'0';
		
		wait for 6 ns;
	
		reset	<=	'1';
	
      wait;

   end process;
	 
end sim;