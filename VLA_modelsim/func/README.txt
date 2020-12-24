Lab 11-1 Modeling the Counter using Functions

Objective: To encapsulate counter design combinational behaviors in a function. 

You typically use a function to encapsulate an operation performed multiple times with multiple different sets of operands. Encapsulating functionality reduces code bloatù to make it more understandable and thus more reusable.
The VeriRISC CPU has no component that benefits from such encapsulation. To practice using the construct, here you introduce it to the counter design. 

1. Change to the lab11-func directory and examine the file provided therein: 

README.txt        Lab instructions
counter_test.v    Counter test
counter.v         Counter module(incomplete)

2. From the counter lab copy the counter design and test. If you have not completed the counter lab then copy the counter design from the solutions directory. 

3. Using your favorite editor, modify the counter.v file to replace the combinational block with a function. In the sequential block, instead of loading the value produced by the combinational block, load the value produced by a call to the function. 

4. Using the test module, test your counter description; enter: 

irun counter.v counter_test.v 

You should see the below results:
   20ns rst=0 load=1 enab=1 cnt_in=10101 exp_out=10101 cnt_out=10101
	30ns rst=0 load=1 enab=1 cnt_in=01010 exp_out=01010 cnt_out=01010
	40ns rst=0 load=1 enab=1 cnt_in=11111 exp_out=11111 cnt_out=11111
	50ns rst=1 load=1 enab=1 cnt_in=11111 exp_out=00000 cnt_out=00000
	60ns rst=0 load=1 enab=1 cnt_in=11111 exp_out=11111 cnt_out=11111
	70ns rst=0 load=0 enab=1 cnt_in=11111 exp_out=00000 cnt_out=00000
	TEST PASSED

5. Correct your counter description as needed. 

