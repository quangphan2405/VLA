module cpu_test;

   reg CLK, RST;
   wire HALT;

   cpu cpu_inst
     (.CLK  ( CLK  ),
      .RST  ( RST  ),
      .HALT ( HALT )
      );

   // Display header
   task display_header;
      begin
	 $display("Input a value for testcase:");
      end
   endtask // deposit

   // Run the simulation with test file
   task run
     ( input [7:0] value,
       reg [9*8:1] testfile
       );
      begin
	 testfile = { "PROG", 8'h30+value, ".txt" };
	 $readmemb (testfile, top.cpu_inst.mem );
	 @(negedge CLK) RST = 1;
	 @(negedge CLK) RST = 0;
      end
   endtask // run

   // Display test result
   task display_result;
      reg [4:0] expected_pc;
      begin
	 case ( run.value )
	   1: expected_pc <= 5'h17;
	   2: expected_pc <= 5'h10;
	   3: expected_pc <= 5'h0C;
	 endcase // case ( run.value )
	 $display("Halted at address %h", cpu_inst.pc);
	 $display("Expected to halt at address %h", expected_pc);
	 $display("TEST %s", (cpu_inst.pc === expected_pc)?"PASSED":"FAILED");
      end
   endtask // display_result

   // Free-running clock
   always @*
     begin
	CLK = 1; #1;
	CLK = 0; #1;
     end

   // Dispaly header and wait for user input
   initial begin : STARTUP
      display_header;
      $stop;
   end

   // Upon HALT, display result, display header and wait for user input
   always @(posedge HALT)
     begin : REPEAT
      display_result;
      display_header;
      $stop;
   end

endmodule // cpu_test

   

   

	 
   
