Lab 13-1         Exploring the Synthesis Process 

Objective: To briefly observe the synthesis process and examine the results. 

For this lab, you synthesize a small multiplexor model and examine the
synthesis results.

1. Change to the lab13-muxsynth directory and examine the files provided therein: 

README.txt    Lab instructions
mux.v         Multiplexor model
mux_test.v    Multiplexor test
rc_shell.tcl  Synthesis script

Note: The multiplexor model conditionally uses either a case statement or
a if statement. If you specify neither it uses a if statement. If you
inadvertently specify both it uses a case statement. 

2. Verify the RTL model by entering: 

irun mux.v mux_test.v 

	You should see the below results:
	
time=15 select=00 in1=0 in2=x in3=x mux_out=0
time=25 select=00 in1=1 in2=x in3=x mux_out=1
time=35 select=01 in1=1 in2=x in3=x mux_out=1
time=45 select=01 in1=0 in2=x in3=x mux_out=0
time=55 select=10 in1=x in2=0 in3=x mux_out=0
time=65 select=10 in1=x in2=1 in3=x mux_out=1
time=75 select=11 in1=x in2=x in3=1 mux_out=1
time=85 select=11 in1=x in2=x in3=0 mux_out=0
TEST PASSED


3. Synthesize the RTL model; enter: 

rc -files rc_shell.tcl 

You should see Synthesis succeeded. 

The script writes a pre-synthesis net list and a post-synthesis net list. 

4. In your favorite editor examine the mux.vsù pre-synthesis net list and
attempt to correlate its contents with the multiplexor behavioral description. 

How many multiplexors does it contain? _____ 

How many operators does it contain? _____ 

How many latches does it contain? _____ 

5. In your favorite editor examine the mux.vgù post-synthesis net list and
attempt to correlate its contents with the multiplexor behavioral description. 

How many multiplexors does it contain? _____ 

How many operators does it contain? _____ 

How many latches does it contain? _____ 

6. Verify the gate-level model; enter: 

irun mux.vg mux_test.v -v ../sources/tutorial.v -vlogext vg 

You should see TEST PASSED with similar results. 

7. Again verify the RTL model but this time enter:

irun mux.v mux_test.v -define USE_CASE 

You should see TEST PASSED with similar results. 

8. Modify the rc_shell.tclù synthesis script to change the read_hdl command to: 
read_hdl $mod.v -v2001 -define USE_CASE 

9. Again synthesize the design as before and again examine the pre-synthesis
and post-synthesis net lists. 

For this model does coding style significantly affect the pre-synthesis netlist? 
For this model does coding style significantly affect the post-synthesis netlist? 

10. Optionally again verify the gate-level model. 
