Lab 5-1 The Data Driver 

Objective: Use a Verilog literal value while describing a parameterized-width bus driver. 

The bus driver drives the ALU output onto the data bus during memory write operations. The driver output is the input value while enabled (data_en is true) and is high-impedance while not enabled. 

1. Change to the lab5-drvr directory and examine the files provided therein: 

README.txt     Lab instructions
driver_test.v  Driver test

2. Create the driver.v file, and using your favorite editor, describe therein the driver module. Parameterize the driver input and output width so that the instantiating module can specify the width of each instance. Assign a default value to the parameter. 

3. Using the provided test module, test your driver description; enter: 
irun driver.v driver_test.v 
	You should see below results:
	At time 1 data_en=0 data_in=xxxxxxxx data_out=zzzzzzzz
        At time 2 data_en=1 data_in=01010101 data_out=01010101
        At time 3 data_en=1 data_in=10101010 data_out=10101010
        TEST PASSED

4. Correct your driver description as needed. 

