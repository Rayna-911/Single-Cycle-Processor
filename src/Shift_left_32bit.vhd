library ieee;
use ieee.std_logic_1164.all;
use  work.eecs361_gates.all;
use  work.eecs361.mux_n;
use  work.eecs361.mux;

entity shift_left_32bit is
  port (
    A     : in  std_logic_vector(31 downto 0);--operand
    B     : in  std_logic_vector(31 downto 0);--shift offset 000000~100000
    R     : out std_logic_vector(31 downto 0) -- result
  );
end shift_left_32bit;

architecture structural of shift_left_32bit is 

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



signal level0,level1: std_logic_vector(31 downto 0);  
signal level2_sel   : std_logic_vector(1  downto 0);
signal or1          : std_logic_vector(12 downto 0);
signal or2          : std_logic_vector(5  downto 0);
signal or3          : std_logic_vector(2  downto 0);
signal or4,or5,or6          : std_logic;
begin
   --level2 selection for  > 32bit shift
   or1_map   : or_gate_n generic map(n => 13)
                         port map   (x => B  (31 downto 19), y => B(18 downto 6),z => or1);
   or2_map   : or_gate_n generic map(n => 6)
                         port map   (x => or1(12 downto 7) , y => or1(6  downto 1),z => or2);
   or3_map   : or_gate_n generic map(n => 3)
                         port map   (x => or2(5 downto 3)  , y => or2(2  downto 0),z => or3);
   or4_map   : or_gate   port map   (x => or3(2)  , y => or3(1),z => or4);
   or5_map   : or_gate   port map   (x => or1(0)  , y => or3(0),z => or5);
   or6_map   : or_gate   port map   (x => or5     , y => or4   ,z => or6);--or result of all  bit from 31 downto 7
   sel1_map  : or_gate   port map   (x => or6     , y => B(5)  ,z => level2_sel(1));--  31(or) or b(5)  any 1 at 31~b(6) will cause overflow
   sel0_map  : or_gate   port map   (x => or6     , y => B(4)  ,z => level2_sel(0));--  31(or) or b(4)
  
   --level0
   mux000_map: mux_4to1 port map (A(0),'0'  , '0' ,'0' ,  B(1 downto 0),level0(0));
   mux001_map: mux_4to1 port map (A(1), A(0), '0' ,'0' ,  B(1 downto 0),level0(1));
   mux002_map: mux_4to1 port map (A(2), A(1), A(0),'0' ,  B(1 downto 0),level0(2));
   mux003_map: mux_4to1 port map (A(3), A(2), A(1), A(0), B(1 downto 0),level0(3));
   mux004_map: mux_4to1 port map (A(4), A(3), A(2), A(1), B(1 downto 0),level0(4));
   mux005_map: mux_4to1 port map (A(5), A(4), A(3), A(2), B(1 downto 0),level0(5));
   mux006_map: mux_4to1 port map (A(6), A(5), A(4), A(3), B(1 downto 0),level0(6));
   mux007_map: mux_4to1 port map (A(7), A(6), A(5), A(4), B(1 downto 0),level0(7));
   mux008_map: mux_4to1 port map (A(8), A(7), A(6), A(5), B(1 downto 0),level0(8));
   mux009_map: mux_4to1 port map (A(9), A(8), A(7), A(6), B(1 downto 0),level0(9));
   mux010_map: mux_4to1 port map (A(10),A(9), A(8), A(7), B(1 downto 0),level0(10));
   mux011_map: mux_4to1 port map (A(11),A(10),A(9), A(8), B(1 downto 0),level0(11));
   mux012_map: mux_4to1 port map (A(12),A(11),A(10),A(9), B(1 downto 0),level0(12));
   mux013_map: mux_4to1 port map (A(13),A(12),A(11),A(10),B(1 downto 0),level0(13));
   mux014_map: mux_4to1 port map (A(14),A(13),A(12),A(11),B(1 downto 0),level0(14));
   mux015_map: mux_4to1 port map (A(15),A(14),A(13),A(12),B(1 downto 0),level0(15));
   mux016_map: mux_4to1 port map (A(16),A(15),A(14),A(13),B(1 downto 0),level0(16));
   mux017_map: mux_4to1 port map (A(17),A(16),A(15),A(14),B(1 downto 0),level0(17));
   mux018_map: mux_4to1 port map (A(18),A(17),A(16),A(15),B(1 downto 0),level0(18));
   mux019_map: mux_4to1 port map (A(19),A(18),A(17),A(16),B(1 downto 0),level0(19));
   mux020_map: mux_4to1 port map (A(20),A(19),A(18),A(17),B(1 downto 0),level0(20));
   mux021_map: mux_4to1 port map (A(21),A(20),A(19),A(18),B(1 downto 0),level0(21));
   mux022_map: mux_4to1 port map (A(22),A(21),A(20),A(19),B(1 downto 0),level0(22));
   mux023_map: mux_4to1 port map (A(23),A(22),A(21),A(20),B(1 downto 0),level0(23));
   mux024_map: mux_4to1 port map (A(24),A(23),A(22),A(21),B(1 downto 0),level0(24));
   mux025_map: mux_4to1 port map (A(25),A(24),A(23),A(22),B(1 downto 0),level0(25));
   mux026_map: mux_4to1 port map (A(26),A(25),A(24),A(23),B(1 downto 0),level0(26));
   mux027_map: mux_4to1 port map (A(27),A(26),A(25),A(24),B(1 downto 0),level0(27));
   mux028_map: mux_4to1 port map (A(28),A(27),A(26),A(25),B(1 downto 0),level0(28));
   mux029_map: mux_4to1 port map (A(29),A(28),A(27),A(26),B(1 downto 0),level0(29));
   mux030_map: mux_4to1 port map (A(30),A(29),A(28),A(27),B(1 downto 0),level0(30));
   mux031_map: mux_4to1 port map (A(31),A(30),A(29),A(28),B(1 downto 0),level0(31));
   
     
   --level1
   mux100_map: mux_4to1 port map (level0(0), '0'  , '0' ,'0' ,  B(3 downto 2),level1(0));
   mux101_map: mux_4to1 port map (level0(1), '0'  , '0' ,'0' ,  B(3 downto 2),level1(1));
   mux102_map: mux_4to1 port map (level0(2), '0', '0','0' ,  B(3 downto 2),level1(2));
   mux103_map: mux_4to1 port map (level0(3), '0', '0', '0', B(3 downto 2),level1(3));
   mux104_map: mux_4to1 port map (level0(4), level0(0), '0', level0(1), B(3 downto 2),level1(4));
   mux105_map: mux_4to1 port map (level0(5), level0(1), '0', level0(2), B(3 downto 2),level1(5));
   mux106_map: mux_4to1 port map (level0(6), level0(2), '0', level0(3), B(3 downto 2),level1(6));
   mux107_map: mux_4to1 port map (level0(7), level0(3), '0', level0(4), B(3 downto 2),level1(7));
   mux108_map: mux_4to1 port map (level0(8), level0(4), level0(0), '0', B(3 downto 2),level1(8));
   mux109_map: mux_4to1 port map (level0(9), level0(5), level0(1), '0', B(3 downto 2),level1(9));
   mux110_map: mux_4to1 port map (level0(10),level0(6), level0(2), '0', B(3 downto 2),level1(10));
   mux111_map: mux_4to1 port map (level0(11),level0(7),level0(3), '0', B(3 downto 2),level1(11));
   mux112_map: mux_4to1 port map (level0(12),level0(8),level0(4),level0(0), B(3 downto 2),level1(12));
   mux113_map: mux_4to1 port map (level0(13),level0(9),level0(5),level0(1),B(3 downto 2),level1(13));
   mux114_map: mux_4to1 port map (level0(14),level0(10),level0(6),level0(2),B(3 downto 2),level1(14));
   mux115_map: mux_4to1 port map (level0(15),level0(11),level0(7),level0(3),B(3 downto 2),level1(15));
   mux116_map: mux_4to1 port map (level0(16),level0(12),level0(8),level0(4),B(3 downto 2),level1(16));
   mux117_map: mux_4to1 port map (level0(17),level0(13),level0(9),level0(5),B(3 downto 2),level1(17));
   mux118_map: mux_4to1 port map (level0(18),level0(14),level0(10),level0(6),B(3 downto 2),level1(18));
   mux119_map: mux_4to1 port map (level0(19),level0(15),level0(11),level0(7),B(3 downto 2),level1(19));
   mux120_map: mux_4to1 port map (level0(20),level0(16),level0(12),level0(8),B(3 downto 2),level1(20));
   mux121_map: mux_4to1 port map (level0(21),level0(17),level0(13),level0(9),B(3 downto 2),level1(21));
   mux122_map: mux_4to1 port map (level0(22),level0(18),level0(14),level0(10),B(3 downto 2),level1(22));
   mux123_map: mux_4to1 port map (level0(23),level0(19),level0(15),level0(11),B(3 downto 2),level1(23));
   mux124_map: mux_4to1 port map (level0(24),level0(20),level0(16),level0(12),B(3 downto 2),level1(24));
   mux125_map: mux_4to1 port map (level0(25),level0(21),level0(17),level0(13),B(3 downto 2),level1(25));
   mux126_map: mux_4to1 port map (level0(26),level0(22),level0(18),level0(14),B(3 downto 2),level1(26));
   mux127_map: mux_4to1 port map (level0(27),level0(23),level0(19),level0(15),B(3 downto 2),level1(27));
   mux128_map: mux_4to1 port map (level0(28),level0(24),level0(20),level0(16),B(3 downto 2),level1(28));
   mux129_map: mux_4to1 port map (level0(29),level0(25),level0(21),level0(17),B(3 downto 2),level1(29));
   mux130_map: mux_4to1 port map (level0(30),level0(26),level0(22),level0(18),B(3 downto 2),level1(30));
   mux131_map: mux_4to1 port map (level0(31),level0(27),level0(23),level0(19),B(3 downto 2),level1(31));
   
   --level2
   mux200_map: mux_4to1 port map (level1(0),'0'        , '0'     ,'0',level2_sel,R(0));
   mux201_map: mux_4to1 port map (level1(1), '0'       , '0'     ,'0',level2_sel,R(1));
   mux202_map: mux_4to1 port map (level1(2), '0'       , '0'     ,'0',level2_sel,R(2));
   mux203_map: mux_4to1 port map (level1(3), '0'       ,'0'      ,'0',level2_sel,R(3));
   mux204_map: mux_4to1 port map (level1(4), '0'       ,'0'      ,'0',level2_sel,R(4));
   mux205_map: mux_4to1 port map (level1(5), '0'       ,'0'      ,'0',level2_sel,R(5));
   mux206_map: mux_4to1 port map (level1(6), '0'       ,'0'      ,'0',level2_sel,R(6));
   mux207_map: mux_4to1 port map (level1(7), '0'       ,'0'      ,'0',level2_sel,R(7));
   mux208_map: mux_4to1 port map (level1(8), '0'       ,'0'      ,'0',level2_sel,R(8));
   mux209_map: mux_4to1 port map (level1(9), '0'       ,'0'      ,'0',level2_sel,R(9));
   mux210_map: mux_4to1 port map (level1(10),'0'       ,'0'      ,'0',level2_sel,R(10));
   mux211_map: mux_4to1 port map (level1(11),'0'       ,'0'      ,'0',level2_sel,R(11));
   mux212_map: mux_4to1 port map (level1(12),'0'       ,'0'      ,'0',level2_sel,R(12));
   mux213_map: mux_4to1 port map (level1(13),'0'       ,'0'      ,'0',level2_sel,R(13));
   mux214_map: mux_4to1 port map (level1(14),'0'       ,'0'      ,'0',level2_sel,R(14));
   mux215_map: mux_4to1 port map (level1(15),'0'       ,'0'      ,'0',level2_sel,R(15));
   mux216_map: mux_4to1 port map (level1(16),level1(0) ,'0'      ,'0',level2_sel,R(16));
   mux217_map: mux_4to1 port map (level1(17),level1(1) ,'0'      ,'0',level2_sel,R(17));
   mux218_map: mux_4to1 port map (level1(18),level1(2) ,'0'      ,'0',level2_sel,R(18));
   mux219_map: mux_4to1 port map (level1(19),level1(3) ,'0'      ,'0',level2_sel,R(19));
   mux220_map: mux_4to1 port map (level1(20),level1(4) ,'0'      ,'0',level2_sel,R(20));
   mux221_map: mux_4to1 port map (level1(21),level1(5) ,'0'      ,'0',level2_sel,R(21));
   mux222_map: mux_4to1 port map (level1(22),level1(6) ,'0'      ,'0',level2_sel,R(22));
   mux223_map: mux_4to1 port map (level1(23),level1(7) ,'0'      ,'0',level2_sel,R(23));
   mux224_map: mux_4to1 port map (level1(24),level1(8) ,'0'      ,'0',level2_sel,R(24));
   mux225_map: mux_4to1 port map (level1(25),level1(9) ,'0'      ,'0',level2_sel,R(25));
   mux226_map: mux_4to1 port map (level1(26),level1(10),'0'      ,'0',level2_sel,R(26));
   mux227_map: mux_4to1 port map (level1(27),level1(11),'0'      ,'0',level2_sel,R(27));
   mux228_map: mux_4to1 port map (level1(28),level1(12),'0'      ,'0',level2_sel,R(28));
   mux229_map: mux_4to1 port map (level1(29),level1(13),'0'      ,'0',level2_sel,R(29));
   mux230_map: mux_4to1 port map (level1(30),level1(14),'0'      ,'0',level2_sel,R(30));
   mux231_map: mux_4to1 port map (level1(31),level1(15),level1(0),'0',level2_sel,R(31));   



end structural;

