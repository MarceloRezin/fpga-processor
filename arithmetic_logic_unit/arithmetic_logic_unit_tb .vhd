-- Libs
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Entidade
entity arithmetic_logic_unit_tb is
end arithmetic_logic_unit_tb ;

architecture sim of arithmetic_logic_unit_tb	is
    
	 signal	bus_io	:	std_logic_vector(7 downto 0)	:=	(others => 'Z');
	 signal	acc		:	std_logic_vector(7 downto 0)	:=	"10101010";
	 signal	b_reg		:	std_logic_vector(7 downto 0)	:=	"00000001";
	 signal	op			:	std_logic_vector(2 downto 0)	:=	"000";
	 signal  alu_out	:  std_logic							:=	'0';

begin

	DUT	:	entity work.arithmetic_logic_unit(main) port map(bus_io, acc, b_reg, op, alu_out);
	
	estimulos: process
   begin        
	
		wait for 20 ns;
		
		alu_out	<=	'1';
		
		wait for 20 ns;
		
		op	<=	"001";
		
		wait for 20 ns;
		
		op	<=	"010";
		
		wait for 20 ns;
		
		op	<=	"011";
		
		wait for 20 ns;
		
		op	<=	"100";
		
		wait for 20 ns;
		
		op	<=	"101";
	
      wait;

   end process;
	 
end sim;