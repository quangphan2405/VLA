Lab 11-2 The Memory Test Revisited 

Objective: To encapsulate memory test procedural behaviors in tasks. 

You typically use a task to encapsulate a procedure executed multiple times, potentially with multiple different sets of inputs. Encapsulating procedure reduces code bloat to make it more understandable and thus more reusable. Almost every test utilizes tasks for this purpose. To practice using this
construct, you will modify the memory test to encapsulate yet more procedure in tasks. 

1. Change to the lab11-task directory and examine the file provided therein: 

README.txt  	Lab instructions
memory.v	 	Memory module
memory_test.v   Memory test(incomplete)

2. From the memory lab copy the memory design and test. If you have not
completed the memory lab then copy the memory design from the solutions
directory. 

3. Using your favorite editor, modify the memory_test.v file to replace the write procedure and the read procedure with tasks. In the test block, instead directly executing write and read procedure, call the appropriate tasks to execute the procedure. 

Note: The statement sets that you will replace with task calls are these:
For write: wr=1; rd=0; memory_test.addr=addr; rdata=data; @(negedge clk); 
For read:  wr=0; rd=1; memory_test.addr=addr; rdata='bz; @(negedge clk) expect(data);

4. Using the memory module, test your memory test modification; enter: 

irun memory.v memory _test.v 

You should see below results:
	         330 addr=11111, exp_data= 00000000, data=00000000
                 340 addr=11110, exp_data= 00000001, data=00000001
                 350 addr=11101, exp_data= 00000010, data=00000010
                 360 addr=11100, exp_data= 00000011, data=00000011
                 370 addr=11011, exp_data= 00000100, data=00000100
                 380 addr=11010, exp_data= 00000101, data=00000101
                 390 addr=11001, exp_data= 00000110, data=00000110
                 400 addr=11000, exp_data= 00000111, data=00000111
                 410 addr=10111, exp_data= 00001000, data=00001000
                 420 addr=10110, exp_data= 00001001, data=00001001
                 430 addr=10101, exp_data= 00001010, data=00001010
                 440 addr=10100, exp_data= 00001011, data=00001011
                 450 addr=10011, exp_data= 00001100, data=00001100
                 460 addr=10010, exp_data= 00001101, data=00001101
                 470 addr=10001, exp_data= 00001110, data=00001110
                 480 addr=10000, exp_data= 00001111, data=00001111
                 490 addr=01111, exp_data= 00010000, data=00010000
                 500 addr=01110, exp_data= 00010001, data=00010001
                 510 addr=01101, exp_data= 00010010, data=00010010
                 520 addr=01100, exp_data= 00010011, data=00010011
                 530 addr=01011, exp_data= 00010100, data=00010100
                 540 addr=01010, exp_data= 00010101, data=00010101
                 550 addr=01001, exp_data= 00010110, data=00010110
                 560 addr=01000, exp_data= 00010111, data=00010111
                 570 addr=00111, exp_data= 00011000, data=00011000
                 580 addr=00110, exp_data= 00011001, data=00011001
                 590 addr=00101, exp_data= 00011010, data=00011010
                 600 addr=00100, exp_data= 00011011, data=00011011
                 610 addr=00011, exp_data= 00011100, data=00011100
                 620 addr=00010, exp_data= 00011101, data=00011101
                 630 addr=00001, exp_data= 00011110, data=00011110
                 TEST PASSED

5. Correct your memory test as needed. 

