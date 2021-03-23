-- Utilitario para testar o contador de programa, juntamente com um barramento na placa.
-- Autor: Marcelo Rezin
-- Data: 23/03/2021

-- Libs
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;

-- Entidade
entity program_counter_tester is
    port(
        clk_50MHZ			:  in 	std_logic;
        clock_btn			:  in 	std_logic;
		  inc_switch		:	in		std_logic;
		  jmp_switch		:	in		std_logic;
		  pc_out_switch	:	in		std_logic;
		  bus_switches		:	in		std_logic_vector(3 downto 0);
   
        clock_led      	:	out	std_logic;
		  bus_io				:	out	std_logic_vector(3 downto 0)
    );
end program_counter_tester;

architecture main of program_counter_tester is

    component clock is
        port(
            base_clk				:	in		std_logic;
				manual_clk			:	in		std_logic;
				manual_clk_enable	:	in		std_logic;
				divisor				:	in		integer range 0 to 50000000 :=  0;
		
				out_clk				:	out	std_logic
        );
    end component clock;
	 
	 component program_counter is
        port(
            clk		:	in		std_logic;
				bus_io	:	inout	std_logic_vector(7 downto 0);
		
				inc		:	in		std_logic;
				jmp		:	in		std_logic;
				pc_out	:	in		std_logic;
				reset		:	in		std_logic
        );
    end component program_counter;

    constant prescaler	:	integer range 0 to 50000000	:=	50_000_000;
	 constant manual_clk	:	std_logic							:=	'1';
	 constant pc_reset	:	std_logic							:=	'0';
	 
    signal  clk_1HZ		:	std_logic							:=	'0';
    signal  led_tmp	   :	std_logic							:=	'0';
	 signal	bus_io_tmp	:	std_logic_vector(7 downto 0)	:=	(others	=> 'Z');

begin

	clock_led 	<= clk_1HZ;
	bus_io		<=	bus_io_tmp(3 downto 0);
	bus_io_tmp	<=	std_logic_vector(resize(unsigned(bus_switches), bus_io_tmp'length)) when pc_out_switch = '0' else
						(others	=> 'Z');

	divisor_50Mx	:	clock port map(clk_50MHZ, clock_btn, manual_clk, prescaler, clk_1HZ);
	pc					:	program_counter port map(clk_1HZ, bus_io_tmp, inc_switch, jmp_switch, pc_out_switch, pc_reset);

end main;