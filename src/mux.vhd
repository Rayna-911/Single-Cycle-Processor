library ieee;
use ieee.std_logic_1164.all;

entity mux is
 
  port (
	sel	  : in	std_logic;
	src0  :	in	std_logic;
	src1  :	in	std_logic;
	z	  : out std_logic
  );
end entity mux;

architecture behavioral of mux is
begin
  z	<= src0 when sel = '0' else src1;
end architecture behavioral;
