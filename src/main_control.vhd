-- This file is generated by automatic tools.
library ieee;
use ieee.std_logic_1164.all;


entity main_control is
  port (
    op : in std_logic_vector(5 downto 0);
    RegDst: out std_logic;
    ALUSrc: out std_logic;
    MemtoReg: out std_logic;
    RegWrite: out std_logic;
    MemWrite: out std_logic;
    Branch: out std_logic;
    Jump: out std_logic;
    ExtOp: out std_logic;

    ALU_op : out std_logic_vector(3 downto 0) -- result
  );
end main_control;

architecture struct of main_control is

component not_gate is port(   
    x   : in  std_logic;
    z   : out std_logic);
end component;

component or_gate is port(   
    x   : in  std_logic;
    y   : in  std_logic;
    z   : out std_logic);
end component;

component op_gate is port(
   op  : in  std_logic_vector(5 downto 0);
    sel:  in std_logic_vector(5 downto 0);
    z   : out std_logic);
end component;



signal ALUSrc_0,ALUSrc_1,ALUSrc_2,ALUSrc_3:std_logic;
signal RegWrite_0,RegWrite_1,RegWrite_2,RegWrite_3:std_logic;
signal Branch_0,Branch_1,op4_out: std_logic;
signal ExtOp_0,ExtOp_1,ExtOp_2,ExtOp_3:std_logic;

begin

    op0: op_gate port map (op,"000000",RegDst);
    
    op_gate_1: op_gate port map(op, "100011",ALUSrc_0);
    op_gate_2: op_gate port map(op, "101011",ALUSrc_1);
    op_gate_3: op_gate port map(op, "001000",ALUSrc_2);
    or_gate_0: or_gate port map(ALUSrc_0,ALUSrc_1,ALUSrc_3);
    or_gate_1: or_gate port map(ALUSrc_2,ALUSrc_3,ALUSrc);
    
    op_gate_4: op_gate port map(op, "100011",MemtoReg);
    
    op_gate_5: op_gate port map(op, "100011",RegWrite_0);
    op_gate_6: op_gate port map(op, "001000",RegWrite_1);
    op_gate_7: op_gate port map(op, "000000",RegWrite_2);
    or_2: or_gate port map(RegWrite_0,RegWrite_1,RegWrite_3);
    or_3: or_gate port map(RegWrite_2,RegWrite_3,RegWrite);
    
    op_gate_8: op_gate port map(op, "101011",MemWrite);
    
    op_gate_9: op_gate port map(op, "000100",Branch_0);
    op_gate_10: op_gate port map(op, "000101",Branch_1);
    or_4: or_gate port map(Branch_0,Branch_1,Branch);
    
    op_gate_11: op_gate port map(op, "100011",ExtOp_0);
    op_gate_12: op_gate port map(op, "101011",ExtOp_1);
    op_gate_13: op_gate port map(op, "001000",ExtOp_2);
    
    or_5: or_gate port map(ExtOp_0,ExtOp_1,ExtOp_3);
    or_6: or_gate port map(ExtOp_3,ExtOp_2,ExtOp);
    
    Jump<='0';
    not_0: not_gate port map(op(4),op4_out);
    op_gate_14: op_gate port map(op,"000000",ALU_op(3));
    
    ALU_op(2)<=op(4);
    ALU_op(1)<=op4_out;
    ALU_op(0)<=op(2);

end struct;



