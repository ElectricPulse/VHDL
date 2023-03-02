library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
	port (
		A, B, Cin: in std_logic;
		Q, Cout: out std_logic
	);
end entity;

architecture main of full_adder is
component half_adder is
	port (
	A, B: in std_logic;
	Q, Cout: out std_logic
	);
end component;

signal Subtotal, C1, C2: std_logic;

begin

adder1: half_adder port map (A, B, Subtotal, C1);
adder2: half_adder port map (Subtotal, Cin, Q, C2);

Cout <= C1 or C2;

end architecture;
