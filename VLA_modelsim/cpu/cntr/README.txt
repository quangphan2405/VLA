Lab 10-1 A Generic Counter 

Objective: Use blocking and nonblocking assignments while describing a counter. 

The VeriRISC CPU contains a program counter and a phase counter. One generic
counter definition can serve both purposes. On the active-high clock edge the
counter value becomes zero if the rst� input is true, otherwise becomes the
count input value if the load� input is true, and otherwise increments if the
enab� input is true. 

1. Change to the lab10-cntr directory and examine the files provided therein: 

README.txt      Lab instructions
counter_test.v  Counter test

2. Create the counter.v file, and using your favorite editor, describe therein
the counter module. Parameterize the counter data input and output width so
that the instantiating module can specify the width of each instance. Assign a
default value to the parameter. Describe the counter behavior in separate
combinational and sequential procedures. 

3. Using the provided test module, test your counter description; enter: 

irun counter.v counter_test.v 

	You should see below results:
At time 20 rst=0 load=1 enab=1 cnt_in=10101 cnt_out=10101
At time 30 rst=0 load=1 enab=1 cnt_in=01010 cnt_out=01010
At time 40 rst=0 load=1 enab=1 cnt_in=11111 cnt_out=11111
At time 50 rst=1 load=1 enab=1 cnt_in=11111 cnt_out=00000
At time 60 rst=0 load=1 enab=1 cnt_in=11111 cnt_out=11111
At time 70 rst=0 load=0 enab=1 cnt_in=11111 cnt_out=00000
TEST PASSED


4. Correct your counter description as needed. 

