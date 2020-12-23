Lab 7-1 The Controller 

Objective: Use the Verilog case statement while describing a controller. 

The controller generates all control signals for the VeriRISC CPU. The operation code, fetch-and-execute phase, and whether the accumulator is zero,determine the control signal levels. 

Further Information 

This table states for each instruction what the outputs are during each phase: 

phase	sel rd ld_ir inc_pc halt ld_pc data_e ld_ac wr
0	1	0	0	0	0	0	0	0	 0
1	1	1	0	0	0	0	0	0	 0
2	1	1	1	0	0	0	0	0	 0
3	1	1	1	0	0	0	0	0	 0
4	0	0	0	1	H	0	0	0	 0
5	0	A	0	0	0	0	0	0	 0
6	0	A	0	Z	0	J	S	0	 0
7	0	A	0	0	0	J	S	A	 S

H: High if instruction is HALT.
A: High if instruction involves accumulator, i.e. ADD, AND, XOR, LDA.
Z: High if instruction is SKZ and zero is true.
J: High if instruction is JMP.
S: High if instruction is STO. 

Hint: Declare a reg for each of these intermediate terms and establish their
value immediately before entering the case statement. 

1. Change to the lab7-ctlr directory and examine the files provided therein: 

README.txt         Lab instructions
controller_test.v  Controller test

2. Create the controller.v file, and using your favorite editor, describe therein the controller module. 

3. Using the provided test module, test your controller description, enter: 

irun controller.v controller_test.v 
You should see the results as below:
	Testing opcode HLT phase 0 1 2 3 4 5 6 7
	Testing opcode SKZ phase 0 1 2 3 4 5 6 7
	Testing opcode ADD phase 0 1 2 3 4 5 6 7
	Testing opcode AND phase 0 1 2 3 4 5 6 7
	Testing opcode XOR phase 0 1 2 3 4 5 6 7
	Testing opcode LDA phase 0 1 2 3 4 5 6 7
	Testing opcode STO phase 0 1 2 3 4 5 6 7
	Testing opcode JMP phase 0 1 2 3 4 5 6 7
	TEST PASSED. 

4. Correct your controller description as needed. 

