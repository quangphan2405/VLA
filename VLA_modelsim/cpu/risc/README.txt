Lab 12-1 The VeriRISC CPU Test 

Objective: To test the VeriRISC CPU. 

At the behavioralù level of abstraction, you code behavior with no regard for
an actual hardware implementation, so can utilize any Verilog construct. The
behavioral level of abstraction is useful for exploring design architecture,
and especially useful for developing testbenches. As both uses are beyond the
scope of this training module, it only briefly introduces testbench concepts.

1. Change to the lab12-risc directory and examine the files provided therein: 

README.txt        Lab instructions
risc.v            RISC model
risc_test.v       RISC test (incomplete)
files.txt         List of RISC sources
CPUtest1.txt      Test programs
CPUtest2.txt
CPUtest3.txt
restore.tcl       Simulation setup files


1. Using your favorite editor, modify the risc_test.v file to complete the tests
for the JMPù and SKZù instructions. Use the tests for other instructions as a
template. 

The haltù signal is the only output from the VeriRISC CPU, so all tests count
the clocks to the haltù occurrence to determine whether the program executed
correctly. Each test builds upon previously verified functionality. For example,
test of the HLTù instruction relies upon the system reset working, and your
test of the JMPù instruction will rely upon the HLT instruction working. 

2. Using the RISC system, test your RISC test modification; enter: 

irun -f files.txt 

You should see TEST PASSED. 

3. Correct your RISC test modifications as needed. 

