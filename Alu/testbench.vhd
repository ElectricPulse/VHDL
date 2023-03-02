library ieee;
use ieee.std_logic_1164.all;



entity test is
end entity;

architecture bench of test is 
component alu is 
	 port (
	 		Sub: in std_logic;
			Cout: out std_logic;
			A, B: in std_logic_vector (3 downto 0);
			Q: out std_logic_vector (3 downto 0)
);
end component;

function toString ( vector: std_logic_vector) return string is
	variable temp: string (1 to vector'length) := (others => NUL);
	variable i: integer := 1;
	begin
		for element in vector'range loop
			temp(i) := std_logic'image(vector((element)))(2);
			i := i+1;
		end loop;
	return temp;
end function;

signal tA, tB, tQ: std_logic_vector (3 downto 0);
signal tCout, tSub: std_logic;

begin
	testing: process
		begin

		tA <= "1111"; tB <= "1111"; tSub <= '0';
		wait for 10 ns;
		assert tQ = "1110" and tCout = '1'
			report "Adding" severity failure;
		
		--4 - 2 = 2
		tA <= "0100"; tB <= "0010"; tSub <= '1';
		wait for 10 ns;
		assert tQ = "0010" and tCout = '1'
			report "Subratcting" severity failure;
		
		tA <= "1000"; tB <= "0111"; tSub <= '1';
		wait for 10 ns;
		assert tQ = "0001" and tCout = '1'
			report "Subtracting" severity failure;
			

		report "Tests went OK";
		wait;
	end process;
	UUT: alu port map (tSub,tCout, tA, tB, tQ);
end architecture;



