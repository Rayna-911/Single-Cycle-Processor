library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;

entity reg_32bit is
  port (
    clk, arst, RegWr	: in std_logic;
    Rw, Ra, Rb	: in std_logic_vector(4 downto 0);
    busW 		: in std_logic_vector(31 downto 0);
	busA, busB,out_reg5,out_reg6,out_reg7  : out std_logic_vector(31 downto 0));
end reg_32bit;

architecture arch of reg_32bit is 
signal Rw_decode, Ra_decode, Rb_decode,selector,reg0,reg1,reg2,reg3,reg4,reg5,reg6,reg7,reg8,reg9,reg10,reg11,reg12,reg13,reg14,reg15,reg16,reg17,reg18,reg19,reg20,reg21,reg22,reg23,reg24,reg25,reg26,reg27,reg28,reg29,reg30,reg31: std_logic_vector(31 downto 0);
signal neg_clk: std_logic;

begin
decode1: entity work.decode5_32
port map (Rw,Rw_decode);

selector1: for i in 31 downto 0 generate
	and1: entity work.and_gate
	port map(RegWr, Rw_decode(i), selector(i));
	end generate;

Dff0: for i in 31 downto 0 generate
store0:  entity work.dffr_a port map(clk,arst,'0','0',busW(i),selector(0),reg0(i));
end generate;
Dff1: for i in 31 downto 0 generate
store1:  entity work.dffr_a port map(clk,arst,'0','0',busW(i),selector(1),reg1(i));
end generate;
Dff2: for i in 31 downto 0 generate
store2:  entity work.dffr_a port map(clk,arst,'0','0',busW(i),selector(2),reg2(i));
end generate;
Dff3: for i in 31 downto 0 generate
store3:  entity work.dffr_a port map(clk,arst,'0','0',busW(i),selector(3),reg3(i));
end generate;
Dff4: for i in 31 downto 0 generate
store4:  entity work.dffr_a port map(clk,arst,'0','0',busW(i),selector(4),reg4(i));
end generate;
Dff5: for i in 31 downto 0 generate
store5:  entity work.dffr_a port map(clk,arst,'0','0',busW(i),selector(5),reg5(i));
end generate;
Dff6: for i in 31 downto 0 generate
store6:  entity work.dffr_a port map(clk,arst,'0','0',busW(i),selector(6),reg6(i));
end generate;
Dff7: for i in 31 downto 0 generate
store7:  entity work.dffr_a port map(clk,arst,'0','0',busW(i),selector(7),reg7(i));
end generate;
Dff8: for i in 31 downto 0 generate
store8:  entity work.dffr_a port map(clk,arst,'0','0',busW(i),selector(8),reg8(i));
end generate;
Dff9: for i in 31 downto 0 generate
store9:  entity work.dffr_a port map(clk,arst,'0','0',busW(i),selector(9),reg9(i));
end generate;
Dff10: for i in 31 downto 0 generate
store10:  entity work.dffr_a port map(clk,arst,'0','0',busW(i),selector(10),reg10(i));
end generate;
Dff11: for i in 31 downto 0 generate
store11:  entity work.dffr_a port map(clk,arst,'0','0',busW(i),selector(11),reg11(i));
end generate;
Dff12: for i in 31 downto 0 generate
store12:  entity work.dffr_a port map(clk,arst,'0','0',busW(i),selector(12),reg12(i));
end generate;
Dff13: for i in 31 downto 0 generate
store13:  entity work.dffr_a port map(clk,arst,'0','0',busW(i),selector(13),reg13(i));
end generate;
Dff14: for i in 31 downto 0 generate
store14:  entity work.dffr_a port map(clk,arst,'0','0',busW(i),selector(14),reg14(i));
end generate;
Dff15: for i in 31 downto 0 generate
store15:  entity work.dffr_a port map(clk,arst,'0','0',busW(i),selector(15),reg15(i));
end generate;
Dff16: for i in 31 downto 0 generate
store16:  entity work.dffr_a port map(clk,arst,'0','0',busW(i),selector(16),reg16(i));
end generate;
Dff17: for i in 31 downto 0 generate
store17:  entity work.dffr_a port map(clk,arst,'0','0',busW(i),selector(17),reg17(i));
end generate;
Dff18: for i in 31 downto 0 generate
store18:  entity work.dffr_a port map(clk,arst,'0','0',busW(i),selector(18),reg18(i));
end generate;
Dff19: for i in 31 downto 0 generate
store19:  entity work.dffr_a port map(clk,arst,'0','0',busW(i),selector(19),reg19(i));
end generate;
Dff20: for i in 31 downto 0 generate
store20:  entity work.dffr_a port map(clk,arst,'0','0',busW(i),selector(20),reg20(i));
end generate;
Dff21: for i in 31 downto 0 generate
store21:  entity work.dffr_a port map(clk,arst,'0','0',busW(i),selector(21),reg21(i));
end generate;
Dff22: for i in 31 downto 0 generate
store22:  entity work.dffr_a port map(clk,arst,'0','0',busW(i),selector(22),reg22(i));
end generate;
Dff23: for i in 31 downto 0 generate
store23:  entity work.dffr_a port map(clk,arst,'0','0',busW(i),selector(23),reg23(i));
end generate;
Dff24: for i in 31 downto 0 generate
store24:  entity work.dffr_a port map(clk,arst,'0','0',busW(i),selector(24),reg24(i));
end generate;
Dff25: for i in 31 downto 0 generate
store25:  entity work.dffr_a port map(clk,arst,'0','0',busW(i),selector(25),reg25(i));
end generate;
Dff26: for i in 31 downto 0 generate
store26:  entity work.dffr_a port map(clk,arst,'0','0',busW(i),selector(26),reg26(i));
end generate;
Dff27: for i in 31 downto 0 generate
store27:  entity work.dffr_a port map(clk,arst,'0','0',busW(i),selector(27),reg27(i));
end generate;
Dff28: for i in 31 downto 0 generate
store28:  entity work.dffr_a port map(clk,arst,'0','0',busW(i),selector(28),reg28(i));
end generate;
Dff29: for i in 31 downto 0 generate
store29:  entity work.dffr_a port map(clk,arst,'0','0',busW(i),selector(29),reg29(i));
end generate;
Dff30: for i in 31 downto 0 generate
store30:  entity work.dffr_a port map(clk,arst,'0','0',busW(i),selector(30),reg30(i));
end generate;
Dff31: for i in 31 downto 0 generate
store31:  entity work.dffr_a port map(clk,arst,'0','0',busW(i),selector(31),reg31(i));
end generate;

mux1: entity work.mux_32to1 port map(reg0,reg1,reg2,reg3,reg4,reg5,reg6,reg7,reg8,reg9,reg10,reg11,reg12,reg13,reg14,reg15,reg16,reg17,reg18,reg19,reg20,reg21,reg22,reg23,reg24,reg25,reg26,reg27,reg28,reg29,reg30,reg31,Ra(0),Ra(1),Ra(2),Ra(3),Ra(4),busA);
mux2: entity work.mux_32to1 port map(reg0,reg1,reg2,reg3,reg4,reg5,reg6,reg7,reg8,reg9,reg10,reg11,reg12,reg13,reg14,reg15,reg16,reg17,reg18,reg19,reg20,reg21,reg22,reg23,reg24,reg25,reg26,reg27,reg28,reg29,reg30,reg31,Rb(0),Rb(1),Rb(2),Rb(3),Rb(4),busB);

mux5: entity work.mux_32to1 port map(reg0,reg1,reg2,reg3,reg4,reg5,reg6,reg7,reg8,reg9,reg10,reg11,reg12,reg13,reg14,reg15,reg16,reg17,reg18,reg19,reg20,reg21,reg22,reg23,reg24,reg25,reg26,reg27,reg28,reg29,reg30,reg31,'1','0','1','0','0',out_reg5);
mux6: entity work.mux_32to1 port map(reg0,reg1,reg2,reg3,reg4,reg5,reg6,reg7,reg8,reg9,reg10,reg11,reg12,reg13,reg14,reg15,reg16,reg17,reg18,reg19,reg20,reg21,reg22,reg23,reg24,reg25,reg26,reg27,reg28,reg29,reg30,reg31,'0','1','1','0','0',out_reg6);
mux7: entity work.mux_32to1 port map(reg0,reg1,reg2,reg3,reg4,reg5,reg6,reg7,reg8,reg9,reg10,reg11,reg12,reg13,reg14,reg15,reg16,reg17,reg18,reg19,reg20,reg21,reg22,reg23,reg24,reg25,reg26,reg27,reg28,reg29,reg30,reg31,'1','1','1','0','0',out_reg7);


 
end arch;