`timescale 1ns / 1 ns

module rcvr_test;

   localparam HEADER = 8'hA5;

   reg  sclk, rst, sdata, ack;
   wire ready;
   wire [7:0] dout;

   reg [16:1] DATA [1:4];

   rcvr rcvr_inst
     (
      .SCLK  ( sclk  ),
      .RST   ( rst   ),
      .SDATA ( sdata ),
      .ACK   ( ack   ),
      .READY ( ready ),
      .DOUT  ( dout  )
      );

   // Clock generation
   initial begin : CLK_GEN
      sclk = 1;
      forever #1 sclk = ~sclk;
   end   

   // Stimulus process
   initial begin : TRANSMIT
      
      reg [1:256] bit_stream;
      integer 	  i;
      DATA[1] = $random;
      DATA[2] = $random;
      DATA[3] = $random;
      DATA[4] = $random;
      bit_stream = { 32'h0, HEADER, DATA[1], 32'h0, HEADER, DATA[2], 32'h0, 
		     HEADER, DATA[3], 32'h0, HEADER, DATA[4], 32'h0 };
      $timeformat (-9, 0, " ns", 6);
      @(negedge sclk) rst <= 1;
      @(negedge sclk) rst <= 0; sdata <= 0;
      for (i=1; i<=256; i=i+1)
	@(negedge sclk) sdata <= bit_stream[i];
      @(negedge sclk);
      $display("At time %t: Transmit complete", $time);
      $display("TEST DONE");
      $finish;      
      
   end // block: TRANSMIT

   // Response process
   initial begin : RECEIVE
      
      integer i;
      reg [16:1] received_data;
      @(negedge sclk); ack <= 0; 
    
      for (i=1; i<=4; i=i+1) begin
	 @(posedge ready);
	 @(negedge sclk) ack <= 1; received_data = dout;
	 @(negedge sclk) ack <= 1; received_data = received_data << 8 | dout;
	 @(negedge sclk) ack <= 0;
	 $display("At time %t: Got data %h", $time, received_data);

	 if (received_data !== DATA[i])
	   begin
	      $display("ERROR: Expect data %h", DATA[i]);
	      $finish;	      
	   end
      end
      $display("At time %t: Receive successfully", $time);      
            	 
   end // block: RECEIVE
   
endmodule  
	 

   
   
   
   

  
