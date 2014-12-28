library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;

entity mux_32to1 is
port (
       src0,src1,src2,src3,src4,src5,src6,src7,src8,src9,src10,src11,src12,src13,src14,src15,src16,src17,src18,src19,src20,src21,src22,src23,src24,src25,src26,src27,src28,src29,src30,src31 :	in	std_logic_vector(31 downto 0);
       sel0,sel1,sel2,sel3,sel4 : in std_logic;
	   z	 : out std_logic_vector(31 downto 0)
      );
end mux_32to1;

architecture structural of mux_32to1 is   
signal sg1,sg2: std_logic_vector(31 downto 0);
begin 
    p0: entity work.mux_16to1 port map(src0,src1,src2,src3,src4,src5,src6,src7,src8,src9,src10,src11,src12,src13,src14,src15,sel0,sel1,sel2,sel3,sg1);
        
    p1: entity work.mux_16to1 port map(src16,src17,src18,src19,src20,src21,src22,src23,src24,src25,src26,src27,src28,src29,src30,src31,sel0,sel1,sel2,sel3,sg2);
        
    p2: entity work.mux_32 port map(sel4,sg1,sg2,z);
  
end architecture structural;
    
    
    