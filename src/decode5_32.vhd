library ieee;
use ieee.std_logic_1164.all;
use work.eecs361.dec_n;

entity decode5_32 is
  port (
    src	: in std_logic_vector(4 downto 0);
    result	: out std_logic_vector(31 downto 0)
  );
end decode5_32;

architecture structural of decode5_32 is
begin
decode: dec_n
generic map(n => 5)
port map(
src, result);
end structural;