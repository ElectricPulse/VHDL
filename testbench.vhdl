library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity test is
end;

architecture bench of test is
	component fulladder
		port (
			A, B, Cin: in std_logic;
			Q, Cout: out std_logic
			);
	end component;

	signal tA,tB,tCin,tQ,tCout: STD_LOGIC;
	signal counter: integer;


	begin
	testing: process
		procedure pass is
		begin
			report "Test[" & integer'image(counter) & "]: Passed";
		end procedure;
		begin
			counter <= 1;
			tA <= '0'; tB <= '0'; tCin <= '0'; wait for 10 ns;
				assert tQ = '0' and tCout = '0' report "Error" severity failure;
			pass;
			counter <= counter + 1;
			
			tA <= '0'; tB <= '0'; tCin <= '1'; wait for 10 ns;
				assert tQ = '1' and tCout = '0' report "Error" severity failure;
			pass;
			counter <= counter + 1;

			tA <= '1'; tB <= '1'; tCin <= '1'; wait for 10 ns;
				assert tQ = '1' and tCout = '1' report "Error" severity failure;
			pass;
			

		wait;
		end process;

	UUT: fulladder port map (A=>tA, B=>tB, Cin=>tCin, Q=>tQ, Cout=>tCout);
end bench;

