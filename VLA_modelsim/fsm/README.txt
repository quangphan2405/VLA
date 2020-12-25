Lab 15-1         State Machines in Multiple Styles 

Objective: To code state machines in various styles for synthesis. 

For this lab, you code the serial-to-parallel interface receiver as an FSM in different styles. 

1. Change to the lab15-fsmù directory and examine the files provided therein: 

README.txt    Lab instructions
rcvr.v        Receiver model (incomplete)
rcvr_test.v   Receiver test
rc_shell.tcl  Synthesis script

Note: This receiver is modeled as a FSM. Instead of shifting the match
character, the FSM steps to the next state upon receiving a correct match bit
and returns to a previous state upon receiving an incorrect match bit. As some
subset of the previously matched bits may still match some valid subset of the
match character, the state it returns to is not necessarily the starting state.
For this reason the FSM must hard-code the match character, which now cannot be
a modifiable parameter. 

2. Repeat these instructions for these three FSM syles: 
 - A single sequential block (as the rcvr.vù file partially codes) 
 - Move the next stateù encoding to a separate combinational block 
 - Also move all non-FSM registers to a separate sequential block 

a. In your favorite editor modify the rcvr.vù file to comply with the coding style. 

b. Verify the RTL model by entering: 

irun rcvr.v rcvr_test.v 

You should see I Love Verilogù and TEST DONE. 

Correct your model until it passes the test. 

c. When all models pass their test, synthesize the RTL model by entering: 

rc -files rc_shell.tcl 

You should see Synthesis succeeded. 

Correct your model until it can synthesize. 
‚ÄÉ
d. Verify the gate-level model by entering: 

irun rcvr.vg rcvr_test.v -v ../sources/tutorial.v -vlogext vg 

You should see I Love Verilogù and TEST PASSED. 

If the model fails its test then you can ask the instructor for help or try
again after you study the lecture module Avoiding Simulation Mismatches.
 
