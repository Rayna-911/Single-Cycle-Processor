library ieee;
use ieee.std_logic_1164.all;
use  work.eecs361_gates.all;


entity ALU_1bit is
  port (
    x      : in  std_logic;
    y      : in  std_logic;
    M      : in  std_logic_vector(1 downto 0);--control  signal
    Result : out std_logic;
    cout   : out std_logic 
  );
end ALU_1bit;

architecture structural of ALU_1bit is 
component FullAdder_1bit is
  port (
    x   : in  std_logic;
    y   : in  std_logic;
    cin : in  std_logic;
    sum : out std_logic;
    cout: out std_logic 
  );
end component FullAdder_1bit;
component mux_4to1 is
  port (
	option00 :in	std_logic;
	option01 :in	std_logic;
	option10 :in	std_logic;
	option11 :in	std_logic;
	selector :in	std_logic_vector(1 downto 0);
	selection:out std_logic
  );
end component mux_4to1;

signal and0,or0,xor0,add: std_logic;  

begin
   --add,cout = x fulladder y,sub get from here
   xor0_map          :   xor_gate port map (x => M(0), y => y, z => xor0); --M(0) is used as invert  and cin. M(0)=1,sub
   fulladder_1bit_map:   FullAdder_1bit port map (x => x, y => xor0, cin => M(0), sum => add, cout => cout);
   --and
   and0_map          : and_gate port map (x => x, y => y, z => and0);
   --or
   or0_map           : or_gate port map (x => x, y => y, z => or0);
   --operation selecyion
   mux_4to1_map      : mux_4to1 port map (option00 => add,  option01 => add, option10 => and0, option11 => or0,	selector => M, selection  => Result);

end structural;

