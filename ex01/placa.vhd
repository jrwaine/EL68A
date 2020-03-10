library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity placa is
    	
		port(
		-- sinais que sao usados no toplevel (substituem o que vinha do testbench)
		-- RST   : in std_logic;  -- KEY0 R22
      -- CLK_H : in std_logic;  -- L1 (50 MHz)
		
		-- sinais que são a interface de teste no HW físico
		-- HALT_KEY : in std_logic; 	-- SW9: L2
		-- TURBO_EN : in std_logic; 	-- SW8: M1
		SWITCHES : in unsigned (9 downto 0); -- SW0-SW2
		LED		: out unsigned (9 downto 0)  -- LED9..LED6
		-- HEX0 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		-- HEX1 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0); -- (max 99)
		-- HEX2 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0); -- sempre apagados
		-- HEX3 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)  -- sempre apagados
		);
end;

architecture a_placa of placa is
    component logic_operation
            port (  logic_in : in unsigned (2 downto 0);
            logic_out : out unsigned (6 downto 0)
    );
    end component;

    component decoder
            port (  decoder_in : in unsigned (2 downto 0);
                    decoder_out : out unsigned (7 downto 0)
    );
    end component;
    signal decoder_in: unsigned(2 downto 0);
begin
    dec0: decoder
	 PORT MAP ( decoder_in => decoder_in,
	 			decoder_out => LED(9 downto 2));
					
	--log0: logic_operation
	--port map (logic_in => decoder_in, 
	--				 logic_out => LED(9 downto 3) );
	decoder_in <= SWITCHES(2 downto 0);
	--LED(2) <= '0';
	LED(1) <= '0';
	LED(0) <= '0';
	
	LED <= SWITCHES;

end architecture;