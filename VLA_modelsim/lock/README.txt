Lab 20-1         Resolving a Deadlocked System

Objective: To resolve a deadlock between two devices competing for two resources. 

You will frequently encounter the situation where the test environment waits 
an undetermined time for the system being tested to respond to some stimulus. 
The system may malfunction such that it does not ever respond. The test must 
anticipate this failure mode and report it. The lab model is an arbiter that arbitrates between two users of a resource. 
The arbiter prioritizes the requests for the resource. The lab does not model
 the resource. 

The test environment is two instances of the arbiter and two instance of the 
device making the requests. The device at random intervals requires one or both resources. It requests the first resource, and upon being granted the first 
resource, sometimes also requests a second resource. Due to the random nature 
of the requests, the simulation will invariably eventually come to a point at 
which both devices have one resource and cannot continue until they have the 
second resource - hence both become "deadlocked".

Your task is to modify the device so that after a reasonable amount of time 
waiting for the second resource, they cancel both current requests.

1.	Change to the lab20-lock directory and examine the files there:
		README.txt Lab instructions
           test.v 	Test case(incomplete)
2.	Simulate the test case by entering: 
	irun test.v 
	The simulation should finish with no error indication. 
3.	Examine the outfile.txt file: 
	You should expect the last line to indicate a deadlock situation with both requesters requesting both devices and both requesters having one of the devices as in this example: 
	time  r1 r2  g1 g2
...
  27  11 11  01 10 
Note:	The r column is the requester 1 and requester 2 requests and the g column is the requester 1 and requester 2 grants. The test is limited to 99 ns, which is probably sufficient to develop a deadlock. 
4.	Modify the test case requester definition in accordance with the commented instructions. 
a.	Define a watchdog task that after a reasonable amount of time (the solution uses 17 ns) drops both request signals and disables the request loop (the request loop will immediately automatically restart). 
b.	Each place where the requester waits for a request to be granted, replace the wait statement with a block that does two things in parallel: 
 	Enables the watchdog task 
 	Waits for the grant, and when the grant occurs, disables the watchdog task 
5.	Simulate the test case as before and correct any reported errors. 
6.	Examine the outfile.txt file as before. 
You are likely to see multiple deadlock situations occur and be resolved before the test runs out of time at 99 ns. 
	

