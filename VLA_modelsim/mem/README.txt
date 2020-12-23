Lab 9-1 A Single-Bidirectional-Port Memory 

Objective: Use continuous and procedural assignments while describing a memory. 

The VeriRISC CPU uses the same memory for instructions and for data. The memory
has a single bidirectional data port and separate write and read control inputs.
It cannot do simultaneous write and read operations. 

1. Change to the lab9-mem directory and examine the files provided therein: 

README.txt     Lab instructions
memory_test.v  Memory test

2. Create the memory.v file, and using your favorite editor, describe therein the memory module. Parameterize the address and data width width so that the instantiating module can specify the width and depth of each instance. Assign default values to the parameters. Write data on the active clock edge when the
readù input is true and drive data when the writeù input is true. Perform the write operation in a procedural block and perform the read operation as a continuous assignment. 

3. Using the provided test module, test your memory description; enter: 

irun memory.v memory_test.v 

You should see the below results:
At time 370 addr=11111 data=00000000
At time 380 addr=11110 data=00000001
At time 390 addr=11101 data=00000010
At time 400 addr=11100 data=00000011
At time 410 addr=11011 data=00000100
At time 420 addr=11010 data=00000101
At time 430 addr=11001 data=00000110
At time 440 addr=11000 data=00000111
At time 450 addr=10111 data=00001000
At time 460 addr=10110 data=00001001
At time 470 addr=10101 data=00001010
At time 480 addr=10100 data=00001011
At time 490 addr=10011 data=00001100
At time 500 addr=10010 data=00001101
At time 510 addr=10001 data=00001110
At time 520 addr=10000 data=00001111
At time 530 addr=01111 data=00010000
At time 540 addr=01110 data=00010001
At time 550 addr=01101 data=00010010
At time 560 addr=01100 data=00010011
At time 570 addr=01011 data=00010100
At time 580 addr=01010 data=00010101
At time 590 addr=01001 data=00010110
At time 600 addr=01000 data=00010111
At time 610 addr=00111 data=00011000
At time 620 addr=00110 data=00011001
At time 630 addr=00101 data=00011010
At time 640 addr=00100 data=00011011
At time 650 addr=00011 data=00011100
At time 660 addr=00010 data=00011101
At time 670 addr=00001 data=00011110
TEST PASSED

4. Correct your memory description as needed. 

