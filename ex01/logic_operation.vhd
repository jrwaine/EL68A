library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity logic_operation is
    port (  logic_in : in unsigned (2 downto 0);
            logic_out : out unsigned (6 downto 0)
    );
end entity;

architecture a_logic_operation of logic_operation is
begin

    logic_out(6) <= '1' when (logic_in(0) and logic_in(1) and logic_in(2))='1' else '0';
    logic_out(5) <= '0' when (logic_in(0) and logic_in(1) and logic_in(2))='1' else '1';
    logic_out(4) <= '1' when (logic_in(0) or logic_in(1) or logic_in(2))='1' else '0';
    logic_out(3) <= '0' when (logic_in(0) or logic_in(1) or logic_in(2))='1' else '1';
    logic_out(2) <= '1' when (logic_in(0) xor logic_in(1) xor logic_in(2))='1' else '0';
    logic_out(1) <= '0' when (logic_in(0) xor logic_in(1) xor logic_in(2))='1' else '1';
    logic_out(0) <= '1' when logic_in(0)='0' else '0';

end architecture;

