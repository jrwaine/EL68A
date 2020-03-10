library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity decoder is
    port (  decoder_in : in unsigned (2 downto 0);
            decoder_out : out unsigned (7 downto 0)
    );
end entity;

architecture a_decoder of decoder is
begin

    decoder_out <= x"01" when decoder_in = "000" else
		x"02" when decoder_in = "001" else
		x"04" when decoder_in = "010" else
		x"08" when decoder_in = "011" else
		x"10" when decoder_in = "100" else
		x"20" when decoder_in = "101" else
		x"40" when decoder_in = "110" else
		x"80" when decoder_in = "111" else
		x"FF";

end architecture;

