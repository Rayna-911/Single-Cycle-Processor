library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;

entity mux_16to1 is
port (
       src0,src1,src2,src3,src4,src5,src6,src7,src8,src9,src10,src11,src12,src13,src14,src15 :	in	std_logic_vector(31 downto 0);
       sel0,sel1,sel2,sel3 : in std_logic;
	   z	 : out std_logic_vector(31 downto 0)
      );
end mux_16to1;

architecture structural of mux_16to1 is   
signal sg1,sg2,sg3,sg4 : std_logic_vector(31 downto 0);
 
begin 
    p0: entity work.mux_4to1 port map(sel0,sel1,src0,src1,src2,src3,sg1);
        
    p1: entity work.mux_4to1 port map(sel0,sel1,src4,src5,src6,src7,sg2);
        
    p2: entity work.mux_4to1 port map(sel0,sel1,src8,src9,src10,src11,sg3); 
	
	p3: entity work.mux_4to1 port map(sel0,sel1,src12,src13,src14,src15,sg4);
        
    p4: entity work.mux_4to1 port map(sel2,sel3,sg1,sg2,sg3,sg4,z);
    
end architecture structural;