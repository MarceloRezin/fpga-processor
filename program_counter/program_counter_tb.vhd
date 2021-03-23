-- Libs
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Entidade
entity program_counter_tb is
end program_counter_tb;

architecture sim of program_counter_tb is
    
    signal  clk      :  std_logic               		:=	'0';
	 signal	bus_io	:	std_logic_vector(7 downto 0)	:=	(others => 'Z');
	 signal  inc		:  std_logic							:=	'1';
	 signal  jmp		:  std_logic							:=	'0';
    signal  pc_out	:  std_logic							:=	'1';
	 signal  reset		:  std_logic							:=	'0';

begin

	DUT	:	entity work.program_counter(main) port map(clk, bus_io, inc, jmp, pc_out, reset);

	clk	<=	not clk after 2 ns; -- 50MHZ 50% duty cicle
	
	estimulos: process
   begin        
	
		wait for 20 ns;
		
		inc	<=	'0';
		
		wait for 20 ns;
		
		pc_out	<=	'0';
		
		wait for 10 ns;
		
		jmp	<=	'1';
		
		wait for 10 ns;
		
		bus_io	<=	"00001111";

		wait for 10 ns;

		jmp	<=	'0';
		
		wait for 10 ns;
		
		bus_io	<=	(others	=> 'Z');
		
		wait for 10 ns;
		
		pc_out	<=	'1';
		
		wait for 20 ns;
		
		inc	<=	'1';
	
      wait;

   end process;
	 
end sim;