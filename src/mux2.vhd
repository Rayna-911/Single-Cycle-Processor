library ieee;
use ieee.std_logic_1164.all;

entity mux2 is
 
  port (
	sel	  : in	std_logic;
	src0  :	in	std_logic;
	src1  :	in	std_logic;
	z	  : out std_logic
  );
end entity mux2;

architecture behavioral of mux2 is
begin
  z	<= src0 when sel = '0' else src1;
end architecture behavioral;
