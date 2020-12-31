Lab 24-1         testing a VeriRISC CPU Model

Objective: To interactively select and download test microcode and run it.

The lab model is a very RISC CPU. The CPU operates on the positive clock edge 
and has a synchronous high-active reset. The CPU utilizes a two-port memory 
so that it can fetch and execute an instruction on each clock cycle. The 8-bit 
CPU instruction consists of a 3-bit leftmost operation code encoding eight 
instructions, and a 5-bit rightmost operand addressing up to 32 words. The CPU 
has only the HALT output, thus the test environment can detect program failure 
only by detecting that the CPU halted at an incorrect address.

Generate a test that asks the user which program to run. Load that program into 
the CPU memory, reset the CPU, and let it run. Report the halt address and 
whether that address is correct. Correct halting address for the three programs 
are in order: (1) 0x17, (2) 0x10, (3) 0x0c 
The following interactive simulator commands may be used:

- Deposit a value onto a simulation object

-- deposit object_name value

- Schedule a Verilog task for immediate execution

-- task task_name

- Continue the simulation to the next break point, interrupt, or time point

-- run time_spec


You can make the test as complex as time allows. A simple solution will:
1. Change to lab24-cpu directory and examine the files there:
README.txt    Lab instructions
cpu.v         CPU module
PROG1.txt     Programs
PROG2.txt
PROG3.txt

2. Code the specified test. You can program well defined tasks for smoother execution of the programs.

a- Code a task displaying an initial message informing the user what commands to use to operate the test.

b- Code a task to run a program. The task can build a file name string by
 including in a concatenation the value of a register that the user sets
 by using the deposit command. For this purpose the programs are conveniently
 named PROGn.txt. NOTE THAT THE ASCII VALUE OF THE "0" CHARACTER IS 0x30. Load that program file into the CPU memory. Reset the CPU. To avoid clock/data race you can move the reset signal on the opposite clock edge that the CPU does not use. The CPU after reset starts executing at location 0.

c- Code a task displaying a final message informing the user of the program
 counter address that the CPU halted at and whether that is correct.

d- Code a procedural block generating a free-running clock.

e- Code a procedural block that upon every assertion of the halt signal displays the final and initial messages and pauses simulation ($stop).

f- Code a procedural block that upon start-up displays only the initial  message and pauses simulation.

3. Simulate the design and test by entering: 
	irun cpu.v your_test_file_name 
	Correct your test and repeat as needed. 

