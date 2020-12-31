Lab 22-1         Adding system tasks and functions to Beverage dispenser design 

Objective: To add system tasks and system functions to support debugging efforts.

The lab model is a beverage dispenser (drink machine). The drink machine 
operates on the positive clock edge and has a synchronous high-active reset.
 After resetting the machine, you load it with coins and cans. Then as you 
insert nickels, dimes, and quarters, at 50 cents or above it dispenses a can
 and attempts to issue your change (if any). This drink machine has no coin 
return feature and inserted coins are not available later as change.  If the 
EMPTY signal is true than you lose any coins you insert. If the USE_EXACT 
signal is true then you may find yourself short-changed. As the machine is 
currently defined, it does not attempt to issue lower-denomination coins if 
higher-denomination coins are not available. 

The lab provides a rudimentary test that leaves much room for improvement. 
Note that the the test developer developed the test in a top-down manner - 
determining and coding top-level tasks first and then sub-tasks and further 
sub-tasks. Only the lowest-level tasks actually interact with the machine. 
For this lab, add system tasks and system functions to improve the test.
1.	Change to the lab22-dkm directory and examine the files provided there. 

README.txt		Lab Instructions
dkm.v           DUT
test.v          Test(incomplete)

Note that the test developer developed the test in a top-down manner, determining and coding top-level tasks first, then subtasks, and then more subtasks. Only the lowest-level tasks actually interact with the machine. You can also adopt this approach to test development. 
2.	Simulate the design and test by entering this command: 
	irun dkm.v test.v 
	Verify that the simulation finishes with no error indication. 
3.	Make these improvements (you might want to incrementally make and simulate the improvements): 


- Improve the expect() task so that it displays an error message, displays
  each machine output that is erroneous and what its expected and actual
  values are, displays the simulation time, and terminates the simulation.

- Add a monitor procedure that:

-- Monitors drink machine inputs and outputs to a disk file. The monitor
 should print the simulation time of each signal change and should use the
 %t formatter so that the printed time value takes a fixed number of columns.

-- Dumps all top-level drink machine nets and variables to a VCD file.

-- Dumps all drink machine ports to an extended VCD file.

- Improve the test procedure so that at its end it displays a happy message
  and terminates the simulation.

- If you have sufficient remaining lab time, add an interactive test. The user activates the interactive test by adding the invocation option

+INTERACTIVE=1

The interactive test should add some cans and coins and in a loop repeatedly
  request the user to insert a coin. Your code can read an input character,
 discard the remainder of the input line, and depending upon the character
, insert a nickel, dime, or quarter. Your code should check and report the
 machine outputs after each can is dispensed. Following information is useful:

--- stdin  is file descriptor 32'h8000_0000

--- stdout is file descriptor 32'h8000_0001

--- reg_8_bit = $fgetc ( file_descriptor ); // gets one next 8-bit character

--- error_integer = $fgets ( reg_vector, file_descriptor ); // gets a line

      Ensure that reg_vector is sufficiently wide to get the entire line

4.	Simulate the design and test and correct the test as needed. 
5.	Load the VCD file into a graphical simulation analysis environment by entering:
	simvision your_dumpfile_name 
6.	Verify that the drink machine operates correctly. 

