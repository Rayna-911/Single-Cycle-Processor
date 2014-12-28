
library ieee;
use ieee.std_logic_1164.all;

entity nor_gate_32 is
  port (
    x   : in  std_logic_vector(31 downto 0);
    m   : out std_logic
  );
end nor_gate_32;

architecture dataflow of nor_gate_32 is
  

 --   signal m: std_logic_vector(30 downto 0);
signal x_out: std_logic_vector(31 downto 0);
signal and_out: std_logic_vector(31 downto 0);

component not_gate is port(x: in std_logic; z:out std_logic);
end component;

component and_gate is port(x,y: in  std_logic; z: out std_logic);
end component ;

begin
not_0: not_gate port map(x(0), x_out(0));
not_1: not_gate port map(x(1), x_out(1));
not_2: not_gate port map(x(2), x_out(2));
not_3: not_gate port map(x(3), x_out(3));
not_4: not_gate port map(x(4), x_out(4));
not_5: not_gate port map(x(5), x_out(5));
not_6: not_gate port map(x(6), x_out(6));
not_7: not_gate port map(x(7), x_out(7));
not_8: not_gate port map(x(8), x_out(8));
not_9: not_gate port map(x(9), x_out(9));
not_10: not_gate port map(x(10), x_out(10));
not_11: not_gate port map(x(11), x_out(11));
not_12: not_gate port map(x(12), x_out(12));
not_13: not_gate port map(x(13), x_out(13));
not_14: not_gate port map(x(14), x_out(14));
not_15: not_gate port map(x(15), x_out(15));
not_16: not_gate port map(x(16), x_out(16));
not_17: not_gate port map(x(17), x_out(17));
not_18: not_gate port map(x(18), x_out(18));
not_19: not_gate port map(x(19), x_out(19));
not_20: not_gate port map(x(20), x_out(20));
not_21: not_gate port map(x(21), x_out(21));
not_22: not_gate port map(x(22), x_out(22));
not_23: not_gate port map(x(23), x_out(23));
not_24: not_gate port map(x(24), x_out(24));
not_25: not_gate port map(x(25), x_out(25));
not_26: not_gate port map(x(26), x_out(26));  
not_27: not_gate port map(x(27), x_out(27));  
not_28: not_gate port map(x(28), x_out(28));  
not_29: not_gate port map(x(29), x_out(29));  
not_30: not_gate port map(x(30), x_out(30));
not_31: not_gate port map(x(31), x_out(31));  
 
 
and_0: and_gate port map(x_out(0),x_out(1), and_out(0));
and_1: and_gate port map(x_out(1),and_out(0), and_out(1));  
and_2: and_gate port map(x_out(2),and_out(1), and_out(2));  
and_3: and_gate port map(x_out(3),and_out(2), and_out(3));  
and_4: and_gate port map(x_out(4),and_out(3), and_out(4));  
and_5: and_gate port map(x_out(5),and_out(4), and_out(5));  
and_6: and_gate port map(x_out(6),and_out(5), and_out(6));  
and_7: and_gate port map(x_out(7),and_out(6), and_out(7));  
and_8: and_gate port map(x_out(8),and_out(7), and_out(8));  
and_9: and_gate port map(x_out(9),and_out(8), and_out(9));  
and_10: and_gate port map(x_out(10),and_out(9), and_out(10));  
and_11: and_gate port map(x_out(11),and_out(10), and_out(11));  
and_12: and_gate port map(x_out(12),and_out(11), and_out(12));  
and_13: and_gate port map(x_out(13),and_out(12), and_out(13));  
and_14: and_gate port map(x_out(14),and_out(13), and_out(14));  
and_15: and_gate port map(x_out(15),and_out(14), and_out(15));  
and_16: and_gate port map(x_out(16),and_out(15), and_out(16));    
and_17: and_gate port map(x_out(17),and_out(16), and_out(17));  
and_18: and_gate port map(x_out(18),and_out(17), and_out(18));    
and_19: and_gate port map(x_out(19),and_out(18), and_out(19));    
and_20: and_gate port map(x_out(20),and_out(19), and_out(20));    
and_21: and_gate port map(x_out(21),and_out(20), and_out(21));  
and_22: and_gate port map(x_out(22),and_out(21), and_out(22));  
and_23: and_gate port map(x_out(23),and_out(22), and_out(23));  
and_24: and_gate port map(x_out(24),and_out(23), and_out(24));  
and_25: and_gate port map(x_out(25),and_out(24), and_out(25));  
and_26: and_gate port map(x_out(26),and_out(25), and_out(26));  
and_27: and_gate port map(x_out(27),and_out(26), and_out(27));  
and_28: and_gate port map(x_out(28),and_out(27), and_out(28));  
and_29: and_gate port map(x_out(29),and_out(28), and_out(29));  
and_30: and_gate port map(x_out(30),and_out(29), and_out(30));    
and_31: and_gate port map(x_out(31),and_out(30), and_out(31));    
  
  
  


m<=and_out(31);

  
end dataflow;
