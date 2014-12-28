library ieee;
use ieee.std_logic_1164.all;

entity mux4 is
  port (
	   sel1	  : in	std_logic;
	   sel0	  : in	std_logic;

	src00  :	in	std_logic;
	src01  :	in	std_logic;
	src10  :	in	std_logic;
	src11  :	in	std_logic;
	z	  : out std_logic
  );
end entity mux4;

architecture structural of mux4 is

component mux2 is port(	sel	  : in	std_logic;
	                       src0  :	in	std_logic;
	                       src1  :	in	std_logic;
	                       z	  : out std_logic);
end component;

signal mux2_0_out, mux2_1_out: std_logic;

begin
    mux2_0: mux2 port map(sel0,src00,src01,mux2_0_out);
    mux2_1: mux2 port map(sel0,src10,src11,mux2_1_out);
    mux2_2: mux2 port map(sel1,mux2_0_out, mux2_1_out, z);
end architecture structural;
