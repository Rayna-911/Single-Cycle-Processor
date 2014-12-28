library ieee;
use ieee.std_logic_1164.all;
use  work.eecs361_gates.all;
entity Adder_30bit is
  port (
    x   : in  std_logic_vector(29  downto 0);
    y   : in  std_logic_vector(29  downto 0);
    cin : in  std_logic;
    sum : out std_logic_vector(29  downto 0);
    cout: out std_logic 
  );
end Adder_30bit;

architecture structural of Adder_30bit is
component FullAdder_1bit is
  port (
    x   : in  std_logic;
    y   : in  std_logic;
    cin : in  std_logic;
    sum : out std_logic;
    cout: out std_logic 
  );
end component FullAdder_1bit;   
signal  cout_inter : std_logic_vector(28  downto  0);

begin
   adder_0:  FullAdder_1bit port map (x(0),  y(0),  cin,            sum(0), cout_inter(0));
   adder_1:  FullAdder_1bit port map (x(1),  y(1),  cout_inter(0),  sum(1), cout_inter(1));
   adder_2:  FullAdder_1bit port map (x(2),  y(2),  cout_inter(1),  sum(2), cout_inter(2));
   adder_3:  FullAdder_1bit port map (x(3),  y(3),  cout_inter(2),  sum(3), cout_inter(3));
   adder_4:  FullAdder_1bit port map (x(4),  y(4),  cout_inter(3),  sum(4), cout_inter(4));
   adder_5:  FullAdder_1bit port map (x(5),  y(5),  cout_inter(4),  sum(5), cout_inter(5));
   adder_6:  FullAdder_1bit port map (x(6),  y(6),  cout_inter(5),  sum(6), cout_inter(6));
   adder_7:  FullAdder_1bit port map (x(7),  y(7),  cout_inter(6),  sum(7), cout_inter(7));
   adder_8:  FullAdder_1bit port map (x(8),  y(8),  cout_inter(7),  sum(8), cout_inter(8));
   adder_9:  FullAdder_1bit port map (x(9),  y(9),  cout_inter(8),  sum(9), cout_inter(9));
   adder_10: FullAdder_1bit port map (x(10), y(10), cout_inter(9),  sum(10),cout_inter(10));  
   adder_11: FullAdder_1bit port map (x(11), y(11), cout_inter(10), sum(11),cout_inter(11));
   adder_12: FullAdder_1bit port map (x(12), y(12), cout_inter(11), sum(12),cout_inter(12));
   adder_13: FullAdder_1bit port map (x(13), y(13), cout_inter(12), sum(13),cout_inter(13));
   adder_14: FullAdder_1bit port map (x(14), y(14), cout_inter(13), sum(14),cout_inter(14));
   adder_15: FullAdder_1bit port map (x(15), y(15), cout_inter(14), sum(15),cout_inter(15));
   adder_16: FullAdder_1bit port map (x(16), y(16), cout_inter(15), sum(16),cout_inter(16));
   adder_17: FullAdder_1bit port map (x(17), y(17), cout_inter(16), sum(17),cout_inter(17));
   adder_18: FullAdder_1bit port map (x(18), y(18), cout_inter(17), sum(18),cout_inter(18));
   adder_19: FullAdder_1bit port map (x(19), y(19), cout_inter(18), sum(19),cout_inter(19));
   adder_20: FullAdder_1bit port map (x(20), y(20), cout_inter(19), sum(20),cout_inter(20)); 
   adder_21: FullAdder_1bit port map (x(21), y(21), cout_inter(20), sum(21),cout_inter(21));
   adder_22: FullAdder_1bit port map (x(22), y(22), cout_inter(21), sum(22),cout_inter(22));
   adder_23: FullAdder_1bit port map (x(23), y(23), cout_inter(22), sum(23),cout_inter(23));
   adder_24: FullAdder_1bit port map (x(24), y(24), cout_inter(23), sum(24),cout_inter(24));
   adder_25: FullAdder_1bit port map (x(25), y(25), cout_inter(24), sum(25),cout_inter(25));
   adder_26: FullAdder_1bit port map (x(26), y(26), cout_inter(25), sum(26),cout_inter(26));
   adder_27: FullAdder_1bit port map (x(27), y(27), cout_inter(26), sum(27),cout_inter(27));
   adder_28: FullAdder_1bit port map (x(28), y(28), cout_inter(27), sum(28),cout_inter(28));
   adder_29: FullAdder_1bit port map (x(29), y(29), cout_inter(28), sum(29),cout);  
     
end structural;
