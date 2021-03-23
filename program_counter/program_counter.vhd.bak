-- Implementa um divisor de clock com a possibilidade de pulsos manuais
-- Autor: Marcelo Rezin
-- Data: 10/02/2021

library ieee;
use ieee.std_logic_1164.all;

entity clock is
	port (
		base_clk				:	in		std_logic;
		manual_clk			:	in		std_logic;
		manual_clk_enable	:	in		std_logic;
		divisor				:	in		integer range 0 to 50000000	:=	0;
		
		out_clk				:	out	std_logic
	);
end clock;

architecture main of clock is

	signal	out_clk_tmp					:	std_logic	:=	'0';
	signal	out_clk_tmp_up	    		:	std_logic	:=	'0';
	
	signal	manual_clk_tmp_up	    	:	std_logic	:=	'0';
	signal	reset_manual_clk_tmp_up	:	std_logic	:=	'0';
	
	signal	reset_out_clk_tmp			:	std_logic	:=	'0';

begin

    process(base_clk)
        variable count_tmp	:	integer range 0 to 50_000_000	:=	0;
    begin
        
        if rising_edge(base_clk) then
		  
				if out_clk_tmp_up = '1' then

					out_clk_tmp_up	<=	'0';

				end if;
		  
				if manual_clk_enable = '1' then
				
					if manual_clk_tmp_up = '1' then
					
						count_tmp		:=	0;
						out_clk_tmp_up	<=	'1';
						
					end if;
					
				else
					
					count_tmp	:=	count_tmp + 1;
					
					if count_tmp = divisor then
						
						count_tmp		:=	0; 
						out_clk_tmp_up	<=	'1';             

					end if;
					
				end if;

        end if;

        if falling_edge(base_clk) then

            if out_clk_tmp_up = '1' then
                reset_out_clk_tmp	<=	'1';
					 
					if manual_clk_tmp_up	= '1' then
						reset_manual_clk_tmp_up	<=	'1';
					end if;
					 
            end if;

            if reset_out_clk_tmp = '1' then
                reset_out_clk_tmp	<=	'0';
            end if;
				
				if reset_manual_clk_tmp_up = '1' then
                reset_manual_clk_tmp_up	<=	'0';
            end if;

        end if;

    end process;

    process(out_clk_tmp_up, reset_out_clk_tmp)
    begin

        if reset_out_clk_tmp = '1' then
            out_clk_tmp	<=	'0';
        elsif rising_edge(out_clk_tmp_up) then
            out_clk_tmp	<=	'1';
        end if;

    end process;
	 
	 process(manual_clk, reset_manual_clk_tmp_up)
    begin

        if reset_manual_clk_tmp_up = '1' then
            manual_clk_tmp_up	<=	'0';
        elsif rising_edge(manual_clk) then
            manual_clk_tmp_up	<=	'1';
        end if;

    end process;

    out_clk	<=	out_clk_tmp;

end main;