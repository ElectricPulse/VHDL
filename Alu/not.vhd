library ieee;
use ieee.std_logic_1164.all;

entity fourbit_not is
	port (	
		Input: in std_logic_vector (3 downto 0);
		Output: out std_logic_vector (3 downto 0)
	);
end entity;

architecture main of fourbit_not is 
begin
	
	Output(0) <= NOT Input(0);
	Output(1) <= NOT Input(1);
	Output(2) <= NOT Input(2);
	Output(3) <= NOT Input(3);

end architecture;
