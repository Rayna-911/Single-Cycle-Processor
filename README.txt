Single Cycle Processor

1)
This processor can handle the following subset of the MIPS instruction set:
� arithmetic: add, addi, addu, sub, subu
� logical: and, or, sll
� data transfer: lw, sw
� conditional branch: beq, bne, slt, sltu

2)
Test Files 

The format of the input files is 
address / data_at_address; 
Thus, the input file has one address-data pair per line in hex. Comment lines are allowed, and must begin with a #. There are three test files attached 

to the assignment, so you don't need to write your own test files. Here are the test programs: 

� a sort program � sort_corrected_branch.dat 
� a summation program � unsigned_sum.dat 
� a simple transaction simulator � bills_branch.dat 

The test files are extracted from a MIPS simulator called SPIM. The simulator assumes that code begins at address 0x00400020, so make sure that 
the program counter is loaded with this initial value. 

3)
It is written by VHDL structural style. Only basic gates are allowed to use behavioral style

4)Control signals truth table
opcode		000100	000101	100011	101011	001000	000000
		beq	bne	lw	sw	addi	R-type
RegDst		x	x	0	x	0	1
ALUSrc		0	0	1	1	1	0
MemtoReg	x	x	1	x	0	0
RegWrite		0	0	1	0	1	1
MemWrite	0	0	0	1	0	0
Branch		1	1	0	0	0	0
Jump		0	0	0	0	0	0
ExtOp		x	x	1	1	1	x
ALUop()		0011	0011	0010	0010	0010	1000


ALUop	Func	ALUCtr
0011	xxxxxx	0011
0010	xxxxxx	0010
1010	100000	0010
1010	100001	0010
1010	100010	0011
1010	100011	0011
1010	100100	0000
1010	100101	0001
1010	000000	11XX
1010	101010	0111
1010	101011	1011

