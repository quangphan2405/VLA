Lab 23-1        Verifying a Serial Interface Receiver

Objective:      To test a serial interface receiver

The lab model is a serial interface receiver. The receiver interfaces between
a serial input stream and a parallel output stream. The receiver operates on 
the positive edge of the serial clock and has a synchronous active-high reset. 
A 24-bit packet represents the data. The packet consists of an 8-bit header 
with a value of 8'ha5 followed by two 8-bit data bytes. The receiver initially 
shifts input data left into the header register until it detects the header. 
For this reason, the header register must be initialized to a value opposite 
the leftmost header value bit. Upon detecting the packet header, the receiver 
clears the header register and shifts input data left into the body register 
while counting to 16. Upon the 16th count, the receiver moves the data to the 
output buffer, clears the counter, asserts the ready output, and again shifts 
input data left into the header register. The receiver can thus move a packet
 every 24 clocks. The test environment reads the leftmost byte first and provides an acknowledge upon each clock that it reads a byte. The receiver shifts the
 output buffer left by one byte upon each clock that it detects the acknowledge. 
The receiver counts the acknowledge clocks and drops the ready signal upon the
last acknowledge. The test environment can delay the last acknowledge up to and 
including the clock that loads the next data into the output buffer. Failure of 
the test environment to retrieve data within that interval results in lost data.



Generate a simple test of the receiver. Statically construct a 256-bit stream 
containing four valid packets surrounded by values that are something other 
than the header value. Randomize the packet data. Reset the receiver and present this stream to the inputs. 
While adhering to the output protocol, retrieve the parallel data and verify 
that it is received and is correct.
1.	Change to the lab23-rcvr directory and examine the files there: 
README.txt      Lab instructions
rcvr.v		  DUT
2.	Code the specified simple test. 
3.	Simulate the design and test by entering this command: 
	irun rcvr.v your_test_file_name 


