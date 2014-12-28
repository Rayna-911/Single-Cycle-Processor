library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;

entity extender_32bit is
port(
	extOp : in std_logic;
	imm16 : in std_logic_vector(15 downto 0);
	imm32 : out std_logic_vector(31 downto 0));
end extender_32bit;

architecture structural of extender_32bit is
signal flag : std_logic;
signal temp : std_logic_vector(31 downto 0);

begin
and1: entity work.and_gate
port map(extOp,imm16(15),flag);

temp(31 downto 16) <= (others => flag);
temp(15 downto 0) <= imm16(15 downto 0);

imm32 <= temp;
end structural;