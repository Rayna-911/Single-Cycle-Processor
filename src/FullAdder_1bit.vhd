library ieee;
use ieee.std_logic_1164.all;
use  work.eecs361_gates.all;

entity FullAdder_1bit is
  port (
    x   : in  std_logic;
    y   : in  std_logic;
    cin : in  std_logic;
    sum : out std_logic;
    cout: out std_logic 
  );
end FullAdder_1bit;

architecture structural of FullAdder_1bit is   
signal xor1: std_logic;  
signal and1: std_logic;   
signal and2: std_logic;
begin
   --sum= x xor y xor cin
   xor1_map: xor_gate port map (x=>x,y=>y,z=>xor1);
   sum_map : xor_gate port map (x=>xor1,y=>cin,z=>sum);
   
   --cout= c&(x xor y)+x&y 
   and1_map: and_gate port map (x=>xor1,y=>cin,z=>and1);
   and2_map: and_gate port map (x=>x,y=>y,z=>and2);
   cout_map: or_gate  port map (x=>and1,y=>and2,z=>cout);
end structural;
