library ieee;
use ieee.std_logic_1164.all;
use work.eecs361.mux_32;

entity mux_4to1_32bit is
  port (
	sel    : in  std_logic_vector(1 downto 0);
	src00  : in  std_logic_vector(31 downto 0);
	src01  : in  std_logic_vector(31 downto 0);
	src10  : in  std_logic_vector(31 downto 0);
	src11  : in  std_logic_vector(31 downto 0);
	z	    : out std_logic_vector(31 downto 0)
  );
end mux_4to1_32bit;

architecture structural of mux_4to1_32bit is
  signal sel0,sel1: std_logic_vector(31 downto 0);
begin
  mux0_map: mux_32 port map (sel =>  sel(0), src0  => src00, src1 => src01, z	=> sel0);
  mux1_map: mux_32 port map (sel =>  sel(0), src0  => src10, src1 => src11, z	=> sel1);
  mux_map : mux_32 port map (sel =>  sel(1), src0  => sel0,  src1 => sel1,  z	=> z);
end structural;
