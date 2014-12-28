library ieee;
use ieee.std_logic_1164.all;

entity final_demo is 
port (
--clk,rset: in std_logic;
PC:out std_logic_vector(31 downto 0);
Instruction_out:out std_logic_vector(31 downto 0);
RegDst1,ALUSrc1,MemtoReg1,RegWrite1,MemWrite1,Branch1,Jump1,ExtOp1,ze, mem_read: out std_logic;
ALU_op1, alu_ctr1: out std_logic_vector(3 downto 0);
busW1,busA1,busB1,imm321,alu_output1,DataOut1,out_reg5,out_reg6,out_reg7 : out std_logic_vector(31 downto 0)
);
end final_demo;

architecture structural of final_demo is
component final is


port (
clk,rset: in std_logic;
PC:out std_logic_vector(31 downto 0);
Instruction_out:out std_logic_vector(31 downto 0);
RegDst1,ALUSrc1,MemtoReg1,RegWrite1,MemWrite1,Branch1,Jump1,ExtOp1,ze_out, mem_read: out std_logic;
ALU_op1, alu_ctr1: out std_logic_vector(3 downto 0);
busW1,busA1,busB1,imm321,alu_output1,DataOut1,out_reg5,out_reg6,out_reg7: out std_logic_vector(31 downto 0)
);

end component final;


signal clk,rset:  std_logic;   

begin
  final_map: final port map (clk,rset,PC,Instruction_out,RegDst1,ALUSrc1,MemtoReg1,RegWrite1,MemWrite1,Branch1,Jump1,ExtOp1,ze, mem_read,ALU_op1, alu_ctr1,busW1,busA1,busB1,imm321,alu_output1,DataOut1,out_reg5,out_reg6,out_reg7);
  test_proc : process
  begin
   
    clk <= '0';
    rset <='1';--inintial
    wait for 50 ns;
     clk <= '1';
    rset <='0';--inintial
    wait for 50 ns;
    
   -- cylce1
     clk <= '0';
    rset <='0';
    wait for 50 ns;
     clk <= '1';
    rset <='0';
    wait for 50 ns;
    
    for i in 0 to 800 loop
      
     clk <= '0';
    wait for 50 ns;
     clk <= '1';
    
    wait for 50 ns;
    
    -- 
    end loop;
        
    wait;
  end process;
end architecture structural;

