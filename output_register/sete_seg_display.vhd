-- Exibe em um display de sete segmentos o valor recebido
-- Autor: Marcelo Rezin
-- Data: 12/05/2021

-- Libs
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Entidade
entity sete_seg_display is
    port(
        numero      :   in integer range 0 to 9;
        out_display :   out std_logic_vector(6 downto 0)
    );
end sete_seg_display;

architecture behavioral of sete_seg_display is

begin

    out_display <=  "1000000" when (numero = 0) else
                    "1111001" when (numero = 1) else
                    "0100100" when (numero = 2) else
                    "0110000" when (numero = 3) else
                    "0011001" when (numero = 4) else
                    "0010010" when (numero = 5) else
                    "0000010" when (numero = 6) else
                    "1111000" when (numero = 7) else
                    "0000000" when (numero = 8) else
                    "0010000" when (numero = 9) else
                    "1111111";

end behavioral;