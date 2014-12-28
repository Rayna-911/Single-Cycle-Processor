-- This file is generated by automatic tools.
library ieee;
use ieee.std_logic_1164.all;

entity sll_32 is
  port (
    B    : in std_logic_vector(31 downto 0);
    A     : in std_logic_vector(31 downto 0);
    R     : out std_logic_vector(31 downto 0) -- result
    
  );
end sll_32;

architecture dataflow of sll_32 is
component mux4 is port(
		sel1	  : in	std_logic;
      sel0	  : in	std_logic;
	   src00  :	in	std_logic;
	   src01  :	in	std_logic;
	   src10  :	in	std_logic;
	   src11  :	in	std_logic;
	   z	  : out std_logic
);
end component;

signal mux4_0, mux4_1: std_logic_vector(31 downto 0);
begin
  mux4_0_map: mux4 port map(B(1),B(0),A(0),'0','0','0',mux4_0(0));
  mux4_0_map1: mux4 port map(B(1),B(0),A(1),A(0),'0','0',mux4_0(1));
  mux4_0_map2: mux4 port map(B(1),B(0),A(2),A(1),A(0),'0',mux4_0(2));
  mux4_0_map3: mux4 port map(B(1),B(0),A(3),A(2),A(1),A(0),mux4_0(3));
  mux4_0_map4: mux4 port map(B(1),B(0),A(4),A(3),A(2),A(1),mux4_0(4));
  mux4_0_map5: mux4 port map(B(1),B(0),A(5),A(4),A(3),A(2),mux4_0(5));
  mux4_0_map6: mux4 port map(B(1),B(0),A(6),A(5),A(4),A(3),mux4_0(6));
  mux4_0_map7: mux4 port map(B(1),B(0),A(7),A(6),A(5),A(4),mux4_0(7));
  mux4_0_map8: mux4 port map(B(1),B(0),A(8),A(7),A(6),A(5),mux4_0(8));
  mux4_0_map9: mux4 port map(B(1),B(0),A(9),A(8),A(7),A(6),mux4_0(9));
  mux4_0_map10: mux4 port map(B(1),B(0),A(10),A(9),A(8),A(7),mux4_0(10));
  mux4_0_map11: mux4 port map(B(1),B(0),A(11),A(10),A(9),A(8),mux4_0(11));
  mux4_0_map12: mux4 port map(B(1),B(0),A(12),A(11),A(10),A(9),mux4_0(12));
  mux4_0_map13: mux4 port map(B(1),B(0),A(13),A(12),A(11),A(10),mux4_0(13));
  mux4_0_map14: mux4 port map(B(1),B(0),A(14),A(13),A(12),A(11),mux4_0(14));
  mux4_0_map15: mux4 port map(B(1),B(0),A(15),A(14),A(13),A(12),mux4_0(15));
  mux4_0_map16: mux4 port map(B(1),B(0),A(16),A(15),A(14),A(13),mux4_0(16));
  mux4_0_map17: mux4 port map(B(1),B(0),A(17),A(16),A(15),A(14),mux4_0(17));
  mux4_0_map18: mux4 port map(B(1),B(0),A(18),A(17),A(16),A(15),mux4_0(18));
  mux4_0_map19: mux4 port map(B(1),B(0),A(19),A(18),A(17),A(16),mux4_0(19));
  mux4_0_map20: mux4 port map(B(1),B(0),A(20),A(19),A(18),A(17),mux4_0(20));
  mux4_0_map21: mux4 port map(B(1),B(0),A(21),A(20),A(19),A(18),mux4_0(21));
  mux4_0_map22: mux4 port map(B(1),B(0),A(22),A(21),A(20),A(19),mux4_0(22));
  mux4_0_map23: mux4 port map(B(1),B(0),A(23),A(22),A(21),A(20),mux4_0(23));
  mux4_0_map24: mux4 port map(B(1),B(0),A(24),A(23),A(22),A(21),mux4_0(24));
  mux4_0_map25: mux4 port map(B(1),B(0),A(25),A(24),A(23),A(22),mux4_0(25));
  mux4_0_map26: mux4 port map(B(1),B(0),A(26),A(25),A(24),A(23),mux4_0(26));
  mux4_0_map27: mux4 port map(B(1),B(0),A(27),A(26),A(25),A(24),mux4_0(27));
  mux4_0_map28: mux4 port map(B(1),B(0),A(28),A(27),A(26),A(25),mux4_0(28));
  mux4_0_map29: mux4 port map(B(1),B(0),A(29),A(28),A(27),A(26),mux4_0(29));
  mux4_0_map30: mux4 port map(B(1),B(0),A(30),A(29),A(28),A(27),mux4_0(30));
  mux4_0_map31: mux4 port map(B(1),B(0),A(31),A(30),A(29),A(28),mux4_0(31));


  mux4_1_map0: mux4 port map(B(3),B(2),mux4_0(0),'0','0','0',mux4_1(0));
  mux4_1_map1: mux4 port map(B(3),B(2),mux4_0(1),'0','0','0',mux4_1(1));
  mux4_1_map2: mux4 port map(B(3),B(2),mux4_0(2),'0','0','0',mux4_1(2));
  mux4_1_map3: mux4 port map(B(3),B(2),mux4_0(3),'0','0','0',mux4_1(3));
  mux4_1_map4: mux4 port map(B(3),B(2),mux4_0(4),mux4_0(0),'0','0',mux4_1(4));
  mux4_1_map5: mux4 port map(B(3),B(2),mux4_0(5),mux4_0(1),'0','0',mux4_1(5));
  mux4_1_map6: mux4 port map(B(3),B(2),mux4_0(6),mux4_0(2),'0','0',mux4_1(6));
  mux4_1_map7: mux4 port map(B(3),B(2),mux4_0(7),mux4_0(3),'0','0',mux4_1(7));
  mux4_1_map8: mux4 port map(B(3),B(2),mux4_0(8),mux4_0(4),mux4_0(0),'0',mux4_1(8));
  mux4_1_map9: mux4 port map(B(3),B(2),mux4_0(9),mux4_0(5),mux4_0(1),'0',mux4_1(9));
  mux4_1_map10: mux4 port map(B(3),B(2),mux4_0(10),mux4_0(6),mux4_0(2),'0',mux4_1(10));
  mux4_1_map11: mux4 port map(B(3),B(2),mux4_0(11),mux4_0(7),mux4_0(3),'0',mux4_1(11));
  mux4_1_map12: mux4 port map(B(3),B(2),mux4_0(12),mux4_0(8),mux4_0(4),mux4_0(0),mux4_1(12));
  mux4_1_map13: mux4 port map(B(3),B(2),mux4_0(13),mux4_0(9),mux4_0(5),mux4_0(1),mux4_1(13));
  mux4_1_map14: mux4 port map(B(3),B(2),mux4_0(14),mux4_0(10),mux4_0(6),mux4_0(2),mux4_1(14));
  mux4_1_map15: mux4 port map(B(3),B(2),mux4_0(15),mux4_0(11),mux4_0(7),mux4_0(3),mux4_1(15));
  mux4_1_map16: mux4 port map(B(3),B(2),mux4_0(16),mux4_0(12),mux4_0(8),mux4_0(4),mux4_1(16));
  mux4_1_map17: mux4 port map(B(3),B(2),mux4_0(17),mux4_0(13),mux4_0(9),mux4_0(5),mux4_1(17));
  mux4_1_map18: mux4 port map(B(3),B(2),mux4_0(18),mux4_0(14),mux4_0(10),mux4_0(6),mux4_1(18));
  mux4_1_map19: mux4 port map(B(3),B(2),mux4_0(19),mux4_0(15),mux4_0(11),mux4_0(7),mux4_1(19));
  mux4_1_map20: mux4 port map(B(3),B(2),mux4_0(20),mux4_0(16),mux4_0(12),mux4_0(8),mux4_1(20));
  mux4_1_map21: mux4 port map(B(3),B(2),mux4_0(21),mux4_0(17),mux4_0(13),mux4_0(9),mux4_1(21));
  mux4_1_map22: mux4 port map(B(3),B(2),mux4_0(22),mux4_0(18),mux4_0(14),mux4_0(10),mux4_1(22));
  mux4_1_map23: mux4 port map(B(3),B(2),mux4_0(23),mux4_0(19),mux4_0(15),mux4_0(11),mux4_1(23));
  mux4_1_map24: mux4 port map(B(3),B(2),mux4_0(24),mux4_0(20),mux4_0(16),mux4_0(12),mux4_1(24));
  mux4_1_map25: mux4 port map(B(3),B(2),mux4_0(25),mux4_0(21),mux4_0(17),mux4_0(13),mux4_1(25));
  mux4_1_map26: mux4 port map(B(3),B(2),mux4_0(26),mux4_0(22),mux4_0(18),mux4_0(14),mux4_1(26));
  mux4_1_map27: mux4 port map(B(3),B(2),mux4_0(27),mux4_0(23),mux4_0(19),mux4_0(15),mux4_1(27));
  mux4_1_map28: mux4 port map(B(3),B(2),mux4_0(28),mux4_0(24),mux4_0(20),mux4_0(16),mux4_1(28));
  mux4_1_map29: mux4 port map(B(3),B(2),mux4_0(29),mux4_0(25),mux4_0(21),mux4_0(17),mux4_1(29));
  mux4_1_map30: mux4 port map(B(3),B(2),mux4_0(30),mux4_0(26),mux4_0(22),mux4_0(18),mux4_1(30));
  mux4_1_map31: mux4 port map(B(3),B(2),mux4_0(31),mux4_0(27),mux4_0(23),mux4_0(19),mux4_1(31));
  
  mux4_2_map0: mux4 port map(B(5),B(4),mux4_1(0),'0','0','0',R(0));
  mux4_2_map1: mux4 port map(B(5),B(4),mux4_1(1),'0','0','0',R(1));
  mux4_2_map2: mux4 port map(B(5),B(4),mux4_1(2),'0','0','0',R(2));
  mux4_2_map3: mux4 port map(B(5),B(4),mux4_1(3),'0','0','0',R(3));
  mux4_2_map4: mux4 port map(B(5),B(4),mux4_1(4),'0','0','0',R(4));
  mux4_2_map5: mux4 port map(B(5),B(4),mux4_1(5),'0','0','0',R(5));
  mux4_2_map6: mux4 port map(B(5),B(4),mux4_1(6),'0','0','0',R(6));
  mux4_2_map7: mux4 port map(B(5),B(4),mux4_1(7),'0','0','0',R(7));
  mux4_2_map8: mux4 port map(B(5),B(4),mux4_1(8),'0','0','0',R(8));
  mux4_2_map9: mux4 port map(B(5),B(4),mux4_1(9),'0','0','0',R(9));
  mux4_2_map10: mux4 port map(B(5),B(4),mux4_1(10),'0','0','0',R(10));
  mux4_2_map11: mux4 port map(B(5),B(4),mux4_1(11),'0','0','0',R(11));
  mux4_2_map12: mux4 port map(B(5),B(4),mux4_1(12),'0','0','0',R(12));
  mux4_2_map13: mux4 port map(B(5),B(4),mux4_1(13),'0','0','0',R(13));
  mux4_2_map14: mux4 port map(B(5),B(4),mux4_1(14),'0','0','0',R(14));
  mux4_2_map15: mux4 port map(B(5),B(4),mux4_1(15),'0','0','0',R(15));
  mux4_2_map16: mux4 port map(B(5),B(4),mux4_1(16),mux4_1(0),'0','0',R(16));
  mux4_2_map17: mux4 port map(B(5),B(4),mux4_1(17),mux4_1(1),'0','0',R(17));
  mux4_2_map18: mux4 port map(B(5),B(4),mux4_1(18),mux4_1(2),'0','0',R(18));
  mux4_2_map19: mux4 port map(B(5),B(4),mux4_1(19),mux4_1(3),'0','0',R(19));
  mux4_2_map20: mux4 port map(B(5),B(4),mux4_1(20),mux4_1(4),'0','0',R(20));
  mux4_2_map21: mux4 port map(B(5),B(4),mux4_1(21),mux4_1(5),'0','0',R(21));
  mux4_2_map22: mux4 port map(B(5),B(4),mux4_1(22),mux4_1(6),'0','0',R(22));
  mux4_2_map23: mux4 port map(B(5),B(4),mux4_1(23),mux4_1(7),'0','0',R(23));
  mux4_2_map24: mux4 port map(B(5),B(4),mux4_1(24),mux4_1(8),'0','0',R(24));
  mux4_2_map25: mux4 port map(B(5),B(4),mux4_1(25),mux4_1(9),'0','0',R(25));
  mux4_2_map26: mux4 port map(B(5),B(4),mux4_1(26),mux4_1(10),'0','0',R(26));
  mux4_2_map27: mux4 port map(B(5),B(4),mux4_1(27),mux4_1(11),'0','0',R(27));
  mux4_2_map28: mux4 port map(B(5),B(4),mux4_1(28),mux4_1(12),'0','0',R(28));
  mux4_2_map29: mux4 port map(B(5),B(4),mux4_1(29),mux4_1(13),'0','0',R(29));
  mux4_2_map30: mux4 port map(B(5),B(4),mux4_1(30),mux4_1(14),'0','0',R(30));
  mux4_2_map31: mux4 port map(B(5),B(4),mux4_1(31),mux4_1(15),'0','0',R(31));






end dataflow;
