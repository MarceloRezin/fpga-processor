-- Utilitario para testar o modulo de clock na placa
-- Autor: Marcelo Rezin
-- Data: 17/03/2021

-- Libs
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;

-- Entidade
entity clock_tester is
    port(
        clk_50MHZ   	:  in  std_logic;
        clock_btn    :  in  std_logic;
		  clock_switch	:	in  std_logic;
   
        led         	:	out std_logic
    );
end clock_tester;

architecture main of clock_tester is

    component clock is
        port(
            base_clk				:	in		std_logic;
				manual_clk			:	in		std_logic;
				manual_clk_enable	:	in		std_logic;
				divisor				:	in		integer range 0 to 50000000 :=  0;
		
				out_clk				:	out	std_logic
        );
    end component clock;

    constant prescaler	:	integer range 0 to 50000000	:=	50_000_000;
    signal  clk_1HZ		:	std_logic							:=	'0';

    signal  led_tmp	   :	std_logic							:=	'0';

begin

    divisor_50Mx	:	clock port map(clk_50MHZ, clock_btn, clock_switch, prescaler, clk_1HZ);

    process(clk_1HZ)
    begin

        if rising_edge(clk_1HZ) then
           led_tmp <= not led_tmp;
        end if;

    end process;

	 led <= led_tmp;

end main;