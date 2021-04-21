-- Libs
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Entidade
entity random_access_memory_tb is
end random_access_memory_tb ;

architecture sim of random_access_memory_tb	is
    
	 signal  clk		:  std_logic							:=	'0';
	 signal	bus_io	:	std_logic_vector(7 downto 0)	:=	(others => 'Z');
	 signal	add		:	std_logic_vector(3 downto 0)	:=	"0000";
	 signal  ram_in	:  std_logic							:=	'0';
	 signal  ram_out	:  std_logic							:=	'0';

begin

	DUT	:	entity work.random_access_memory(main) port map(clk, bus_io, add, ram_in, ram_out);
	
	clk	<=	not clk after 2 ns;
	
	estimulos: process
   begin        
	
		wait for 20 ns;
		
		bus_io	<=	"00010001";
		
		add		<=	"0000";
		
		ram_in	<=	'1';
		
		wait for 6 ns;
	
		ram_in	<=	'0';
		
		add		<=	"0001";
		
		bus_io	<=	"00000000";
		
		ram_in	<=	'1';
		
		wait for 6 ns;
	
		ram_in	<=	'0';
		
		add		<=	"0010";
		
		bus_io	<=	"00100010";
		
		ram_in	<=	'1';
		
		wait for 6 ns;
	
		ram_in	<=	'0';
		
		add		<=	"0011";
		
		bus_io	<=	"00110011";
		
		ram_in	<=	'1';
		
		wait for 6 ns;
	
		ram_in	<=	'0';
		
		add		<=	"0100";
		
		bus_io	<=	"01000100";
		
		ram_in	<=	'1';
		
		wait for 6 ns;
		
		ram_in	<=	'0';
		
		bus_io	<=	(others => 'Z');
		
		add		<=	"0000";
		
		wait for 6 ns;
		
		ram_out	<=	'1';
		
		wait for 6 ns;
		
		add		<=	"0001";
		
		wait for 6 ns;
		
		add		<=	"0010";
		
		wait for 6 ns;
		
		add		<=	"0011";
		
		wait for 6 ns;
		
		add		<=	"0100";
	
      wait;

   end process;
	 
end sim;