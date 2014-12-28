
library ieee;
use ieee.std_logic_1164.all;
use  work.eecs361_gates.all;
use  work.eecs361.mux_n;

entity SignExt_30bit is
  port (
    imm   : in  std_logic_vector(15 downto 0);
    Ext   : out std_logic_vector(29 downto 0) 
  );
end SignExt_30bit;

architecture structural of SignExt_30bit is   
signal ext_low : std_logic_vector(15 downto 0);
signal mux_out : std_logic_vector(29 downto 0);  
begin
   mux_map: mux_n       generic map (n => 30) port map (sel => imm(15),src0 => "000000000000001111111111111111",src1 => "111111111111111111111111111111",z => mux_out);
   and_map: and_gate_n  generic map (n => 16) port map (x => mux_out(15 downto 0), y => imm, z => ext_low);
   Ext(29 downto 16) <=  mux_out(29 downto 16);
   Ext(15 downto 0 ) <=  ext_low;      
 

end structural;