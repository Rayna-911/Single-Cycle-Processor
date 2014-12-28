library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;

entity sub_sel is
  port (
    M        : in  std_logic_vector(3 downto 0);
    invert   : out std_logic
  );
end sub_sel;

architecture structural of sub_sel is
  signal or1: std_logic;
  signal or2: std_logic;
  signal not1: std_logic;
  
  begin
    --sub_selection invert=(m3+m3) nor (m1+ not m0)
       or1_map   : or_gate  port map(x=>M(3),y=>M(2),z=>or1);
       not1_map  : not_gate port map(x=>M(0),z=>not1);  
       or2_map   : or_gate  port map(x=>M(1),y=>not1,z=>or2);
       invert_map: nor_gate port map(x=>or1,y=>or2,z=>invert); 
end structural;

