library ieee;
use ieee.std_logic_1164.all;

entity top is
	port (
		btn4: in std_logic;
		led4: out std_logic;
		sw_bank1, sw_bank2: in std_logic_vector (3 downto 0);
		led_bank1: out std_logic_vector (3 downto 0);
		io2: out std_logic
	);
end entity;

architecture main of top is
component alu is 
	port (
		Sub: in std_logic;
		Cout: out std_logic;
		A, B: in std_logic_vector (3 downto 0);	
		Q: out std_logic_vector (3 downto 0)
	);
end component;
begin
	UUT: alu port map (NOT btn4,led4,sw_bank1,sw_bank2,led_bank1);
end architecture;