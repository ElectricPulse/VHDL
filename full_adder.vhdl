library ieee;
use ieee.std_logic_1164.all;

entity fulladder is
	port (
	A, B, Cin: in std_logic;
	Q, Cout: out std_logic
	);
end entity;

architecture main of fulladder is
	component half_adder is 
		port (
		A, B: in std_logic;
		Q, Cout: out std_logic
		);
	end component;

	signal Subtotal, C1, C2: std_logic;

	begin
		ADDER1: half_adder port map (A=>A, B=>B, Q=>Subtotal, Cout=>C1);
		ADDER2: half_adder port map (A=>Cin, B=>Subtotal, Q=>Q, Cout=>C2);

		Cout <= C1 or C2;

end architecture;
	
