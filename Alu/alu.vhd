library ieee;
use ieee.std_logic_1164.all;

entity alu is 
	port (
		Sub: in std_logic;
		Cout: out std_logic;
		A, B: in std_logic_vector (3 downto 0);	
		Q: out std_logic_vector (3 downto 0)
	);
end entity;

architecture main of alu is 
component full_adder is
	port (
		A, B, Cin: in std_logic;
		Q, Cout: out std_logic
	);
end component;

component fourbit_not is
	port (
		Input: in std_logic_vector;
		Output: out std_logic_vector
	);
end component;
component fourbit_mux is
	port (
		S: in std_logic;
		I1: in std_logic_vector (3 downto 0);
		I2: in std_logic_vector (3 downto 0);
		O: out std_logic_vector (3 downto 0)
	);
end component;

signal C: std_logic_vector (4 downto 0);
signal mB, mB_inv: std_logic_vector (3 downto 0);

begin
inverter:  fourbit_not port map(B,mB_inv);
mux: fourbit_mux port map(Sub, B, mB_inv, mB);

adders: for N in 0 to 3 generate
		adder: full_adder port map(A(N), mB(N), C(N), Q(N), C(N+1));
end generate;

C(0) <= Sub;
Cout <= C(4);

end architecture;
