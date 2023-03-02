-------------
--1bit Mux
------------

library ieee;
use ieee.std_logic_1164.all;

entity onebit_mux is
	port (
		S, I1, I2: in std_logic;
		O: out std_logic
	);
end entity;

architecture main of onebit_mux is
begin	
	O <= ((NOT S) AND I1) OR (S AND I2);
end architecture;


---------------
--4bit Mux
---------------

library ieee;
use ieee.std_logic_1164.all;


entity fourbit_mux is
	port (
		S: in std_logic;
		I1: in std_logic_vector (3 downto 0);
		I2: in std_logic_vector (3 downto 0);
		O: out std_logic_vector (3 downto 0)
	);
end entity;

architecture main of fourbit_mux is 
component onebit_mux is 
	port (
	 	S, I1, I2: in std_logic;
		O: out std_logic
	);
end component;
begin
	muxes: for N in 0 to 3 generate
		mux: onebit_mux port map(S, I1(N), I2(N), O(N));
	end generate;
end architecture;
