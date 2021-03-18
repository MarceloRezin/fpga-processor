-- Libs
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Entidade
entity clock_tb is
end clock_tb;

architecture sim of clock_tb is
    
    signal  base_clk           :   std_logic               :=  '0';
	 signal  manual_clk         :   std_logic               :=  '0';
	 signal  manual_clk_enable  :   std_logic               :=  '1';
    signal  divisor            :   integer range 0 to 4    :=  2;
    
	 signal  out_clk  :   std_logic               :=  '0';
	 signal  reset_out  :   std_logic;

begin

    DUT :   entity work.clock(main) port map(base_clk, manual_clk, manual_clk_enable, divisor, out_clk);

    base_clk   <=  not base_clk after 2 ns; -- 50MHZ 50% duty cicle
	 manual_clk <=  not manual_clk after 10 ns;
	 

end sim;