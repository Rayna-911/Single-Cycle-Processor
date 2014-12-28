library ieee;
use ieee.std_logic_1164.all;
use  work.eecs361_gates.all;
use  work.eecs361.mux_n;

entity Inst_Fetch is
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
end Inst_Fetch;

architecture structural of Inst_Fetch is

component PC_30bit is

  port (
	clk	   : in  std_logic;
	--arst   : in  std_logic; --for reset all bits 0
	aload  : in  std_logic; --for initialize with the address of first instruction in program 
  --adata  : in  std_logic; --initialization value with address of first instruction in program,default in side
  d	     : in  std_logic_vector(29 downto 0);
  start  : in  std_logic; --start runing the program
  q	     : out std_logic_vector(29 downto 0)
  );

end component PC_30bit;

component Adder_30bit is

  port (
    x   : in  std_logic_vector(29  downto 0);
    y   : in  std_logic_vector(29  downto 0);
    cin : in  std_logic;
    sum : out std_logic_vector(29  downto 0);
    cout: out std_logic 
  );

end component Adder_30bit;

component SignExt_30bit is

   port (
    imm   : in  std_logic_vector(15 downto 0);
    Ext   : out std_logic_vector(29 downto 0) 
  );

end component SignExt_30bit;

component sram is
  generic (
	mem_file : string
  );
  port (
	cs	  : in	std_logic;
	oe	  :	in	std_logic;
	we	  :	in	std_logic;
	addr  : in	std_logic_vector(31 downto 0);
	din	  :	in	std_logic_vector(31 downto 0);
	dout  :	out std_logic_vector(31 downto 0)
  );
end component sram;
  
signal  PC_Out : std_logic_vector(29  downto  0);--directly output of pc
signal  PC_4   : std_logic_vector(29  downto  0);--pc+4
signal  mem_in: std_logic_vector(31 downto 0);--for din of sram
signal  sign_ext: std_logic_vector(29 downto  0);--sign extended immediate16
signal  PC_imm : std_logic_vector(29  downto  0);--pc+4+imm16
signal  imm_4_out: std_logic_vector(29 downto 0);--mux 1 out put for branch, chose from pc+4 or pc+4+16
signal  mux1_sel: std_logic;--selector for mux1, branch and zero
signal  dir_add : std_logic_vector(29  downto 0);--direct address from instruction pc[31:28]+inst[25:0]
signal  mux2_sel: std_logic;--selector of mux2 ,jump
signal  mux2_out: std_logic_vector(29  downto 0);--output of mux2
signal  inst_inter: std_logic_vector(31 downto 0);--instruction from inst memory
--fillup
signal  cout0,cout1: std_logic;
--signal for inst memory
signal addr   :std_logic_vector(31 downto 0);--address to fetch instruction, directly pc output+"00"
signal cs:std_logic;--chip select==1
signal we:std_logic;--write enable==0
signal oe:std_logic;--output enable==1

begin


pc_map      :  PC_30bit port map (clk,aload, mux2_out,start, PC_out);
 
Adder1_map  :  Adder_30bit port map (PC_out, "000000000000000000000000000001",'0', PC_4 , cout0);  
 
SignExt_map :  SignExt_30bit port map (inst_inter(15 downto  0), sign_ext);
 

Adder2_map  :  Adder_30bit port map (PC_4, sign_ext,'0', PC_imm , cout1);  
 

mux1_sel_map:  and_gate  port map (Branch, zero, mux1_sel);
 
mux1_map    :  mux_n  generic map (n => 30) port map (mux1_sel,PC_4,PC_imm,imm_4_out);
 
dir_add(29 downto 26) <= PC_out(29 downto 26);
dir_add(25 downto 0)  <=  inst_inter(25 downto 0);
 

mux2_map    :  mux_n  generic map (n => 30) port map (Jump,imm_4_out,dir_add,mux2_out);
--mux2_out <= "000011110000111100001111000011";
--signal addr_30:std_logic_vector(29 downto 0);

--inst  memory


--oe_map: not_gate port map (clk,oe);
--rising edge,'1'for oe,oe=clk
oe<='1';
cs <='1';
we <='0';
addr(31 downto 2) <= PC_out;
addr(1  downto 0) <= "00";
pc<=addr;
sram_map    :  sram   generic map (mem_file=>"F:\unsigned_sum.dat") port map(cs,oe,	we,addr,mem_in,inst_inter);
Instruction <= inst_inter; 
     
end structural;


