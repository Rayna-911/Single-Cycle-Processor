library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;

entity final is 
port (
clk,rset: in std_logic;
PC:out std_logic_vector(31 downto 0);
Instruction_out:out std_logic_vector(31 downto 0);
RegDst1,ALUSrc1,MemtoReg1,RegWrite1,MemWrite1,Branch1,Jump1,ExtOp1,ze_out, mem_read: out std_logic;
ALU_op1, alu_ctr1: out std_logic_vector(3 downto 0);
busW1,busA1,busB1,imm321,alu_output1,DataOut1,out_reg5,out_reg6,out_reg7: out std_logic_vector(31 downto 0)
);
end final;

architecture struct of final is
  
component Inst_Fetch is
  port (
    --signal for start up
    --arst   : in  std_logic; --for reset all bits 0
	  aload  : in  std_logic; --for initialize with the address of first instruction in program 
	  start  : in  std_logic; --start runing the program
	  --signal for logic control
    Branch     : in  std_logic;
    Jump       : in  std_logic;
    zero       : in  std_logic;
    clk        : in  std_logic;
    pc         :out std_logic_vector(31  downto 0);
    Instruction: out std_logic_vector(31  downto 0) 
  );
end component Inst_Fetch;

component alu_32 is 
port( 
    ctrl  : in std_logic_vector(3 downto 0);
    A     : in std_logic_vector(31 downto 0);
    B     : in std_logic_vector(31 downto 0);
    cout  : out std_logic;  
    overf    : out std_logic;  
    ze    : out std_logic;
    R     : out std_logic_vector(31 downto 0)); -- result)
  end component alu_32;
  
component mux is
  port (
	sel	  : in	std_logic;
	src0  :	in	std_logic;
	src1  :	in	std_logic;
	z	  : out std_logic
  );
end component mux;



signal RegDst,ALUSrc,MemtoReg,RegWrite,MemWrite,Branch,Jump,ExtOp,cout,overf,ze : std_logic;
signal ALU_op, alu_ctr: std_logic_vector(3 downto 0);
signal rw: std_logic_vector(4 downto 0);
signal busW,busA,busB,imm32,alu_output,DataOut,instruction,aluB,aluA,shiftamount: std_logic_vector(31 downto 0);

--signal for ze selecion
signal bne_inter,bne_sel,ze_neg,ze_inst:std_logic;
signal bne_bottom,bne_top,bne_3:std_logic_vector(2 downto 0);
--end of signal for ze selection
--signal for MemeRead Generate
signal lw_inter,MemRead:std_logic;
signal lw_top,lw_bottom,lw_3:std_logic_vector(2 downto 0);
--end of signal for MemRead
signal start,shift_sel,clk_not:std_logic;
begin 
--IFU: entity work.Inst_Fetch
--port map(rset,);
--ze test
ze_out <= ze_inst;  
--ze selection
--bne for selector
bne_31_map     : not_gate port map (instruction(31),bne_top(2));
bne_30_map     : not_gate port map (instruction(30),bne_top(1));
bne_29_map     : not_gate port map (instruction(29),bne_top(0)); 
bne_27_map     : not_gate port map (instruction(27),bne_bottom(1));  
bne_bottom(2)<=instruction(28);
bne_bottom(0)<=instruction(26);
bne_3_map     : and_gate_n generic map (n=>3) port map (bne_top, bne_bottom,bne_3);
bne_inter_map : and_gate port map (bne_3(2),bne_3(1),bne_inter);
ze_selsection : and_gate port map (bne_3(0),bne_inter, bne_sel);
ze_neg_map    : not_gate port map (ze, ze_neg);
ze_mux_map    : mux      port map (bne_sel,ze, ze_neg,ze_inst);
--end of ze chose  

--MemeRead generate
lw_top(2)<=instruction(31);
lw_top1_map   :   not_gate port map (instruction(30),lw_top(1));
lw_top0_map   :   not_gate port map (instruction(29),lw_top(0)); 
lw_bottom2_map:   not_gate port map (instruction(28),lw_bottom(2));
lw_bottom(1)<=instruction(27);
lw_bottom(0)<=instruction(26);
lw_3_map      : and_gate_n generic map (n=>3) port map (lw_top, lw_bottom,lw_3);
lw_inter_map  : and_gate port map (lw_3(2),lw_3(1),  lw_inter);
MemRead_map   : and_gate port map(lw_3(0),lw_inter, MemRead);
--MemeRead
    
start_map: not_gate port map (rset,start);
Inst_f:  Inst_Fetch port map (rset,start,Branch,Jump,ze_inst,clk,PC,instruction);
Instruction_out <= instruction;
control_main: entity work.main_control
port map(instruction(31 downto 26),RegDst,ALUSrc,MemtoReg,RegWrite,MemWrite,Branch,Jump,ExtOp,ALU_op(3 downto 0));

control_alu: entity work.alu_control
port map(instruction(5 downto 0),ALU_op(3 downto 0),alu_ctr(3 downto 0));

mux1: entity work.mux_n
generic map(n => 5)
port map(RegDst, instruction(20 downto 16),instruction(15 downto 11),rw);

reg: entity work.reg_32bit
port map(clk,rset, RegWrite,rw,instruction(25 downto 21),instruction(20 downto 16),busW,busA,busB,out_reg5,out_reg6,out_reg7);

ext: entity work.extender_32bit
port map(ExtOp,instruction(15 downto 0),imm32);

mux2: entity work.mux_n
generic map (n => 32)
port map(ALUSrc,busB,imm32,aluB);
  
and1: entity work.and_gate
port map(alu_ctr(3),alu_ctr(2),shift_sel);


shiftamount(31 downto 5)<="000000000000000000000000000"; 
shiftamount(4 downto 0)<=instruction(10 downto 6);
mux324:entity work.mux_32
port map(shift_sel,busA,shiftamount,aluA);
  

alu1: alu_32 port map(alu_ctr,aluA,aluB,cout,overf,ze,alu_output);
  
not1:entity work.not_gate
port map(clk,clk_not);  

DM: entity work.syncram
    generic map (mem_file=>"F:\unsigned_sum.dat")  --give the directory of .dat file
    port map(clk_not,'1',MemRead,MemWrite,alu_output,busB,DataOut);
 mem_read <= MemRead;     

mux3: entity work.mux_n
generic map (n => 32)
port map(MemtoReg,alu_output,DataOut,busW);
  
RegDst1<=RegDst;
ALUSrc1<= ALUSrc;
MemtoReg1<=MemtoReg;
RegWrite1<=RegWrite;
MemWrite1<=MemWrite;
Branch1<=Branch;
Jump1<=Jump;
ExtOp1<=ExtOp;
ALU_op1<=ALU_op;
alu_ctr1<=alu_ctr;
busW1<=busW;
busA1<=busA;
busB1<=busB;
imm321<=imm32;
alu_output1<=alu_output;
DataOut1<=DataOut;

end struct;