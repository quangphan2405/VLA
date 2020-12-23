Lab 6-1 The Arithmetic/Logic Unit  

Objective: Use Verilog operators while describing a parameterized-width arithmetic/logic unit (ALU).  The arithmetic/logic unit, depending upon the operation encoded within the instruction, selects between the inputs or operates upon both inputs. It also outputs the truth state of the in_a input, that is, That is, a_is_zero is true when in_a is zero.

Further Information 

This table states the operation value, instruction, operation, and output: 

0	HLT	PASS A	in_a
1	SKZ	PASS A	in_a
2	ADD	ADD	in_a + in_b
3	AND	AND	in_a & in_b
4	XOR	XOR	in_a ^ in_b
5	LDA	PASS B	in_b
6	STO	PASS A	in_a
7	JMP	PASS A	in_a

1. Change to the lab6-alu directory and examine the files provided therein: 

README.txt  Lab instructions
alu_test.v  ALU test

2. Create the alu.v file, and using your favorite editor, describe therein the alu module. Parameterize the alu input and output width so that the instantiating module can specify the width of each instance. Assign a default value to the parameter. 

3. Using the provided test module, test your alu description; enter: 

irun alu.v alu_test.v 
irun alu.v alu_test.v 
	You should see the results as below:
At time 1 opcode=000 in_a=01000010 in_b=10000110 a_is_zero=0 alu_out=01000010
At time 2 opcode=001 in_a=01000010 in_b=10000110 a_is_zero=0 alu_out=01000010
At time 3 opcode=010 in_a=01000010 in_b=10000110 a_is_zero=0 alu_out=11001000
At time 4 opcode=011 in_a=01000010 in_b=10000110 a_is_zero=0 alu_out=00000010
At time 5 opcode=100 in_a=01000010 in_b=10000110 a_is_zero=0 alu_out=11000100
At time 6 opcode=101 in_a=01000010 in_b=10000110 a_is_zero=0 alu_out=10000110
At time 7 opcode=110 in_a=01000010 in_b=10000110 a_is_zero=0 alu_out=01000010
At time 8 opcode=111 in_a=01000010 in_b=10000110 a_is_zero=0 alu_out=01000010
At time 9 opcode=111 in_a=00000000 in_b=10000110 a_is_zero=1 alu_out=00000000
TEST PASSED


4. Correct your alu description as needed. 

