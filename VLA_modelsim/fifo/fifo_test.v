module fifo_test;

   // Local constants
   localparam AWIDTH = 5;
   localparam DWIDTH = 8;
   localparam DEPTH = 2**AWIDTH;

   // Variable for FIFO inputs
   reg 	 	     clk, rst, wr, rd;
   reg  [DWIDTH-1:0] wdata;

   // Nets for FIFO outputs
   wire 	     full, empty;
   wire [DWIDTH-1:0] rdata;

   // FIFO instantiation
   fifo
     #(
       .AWIDTH(AWIDTH),
       .DWIDTH(DWIDTH)
       )
   fifo_inst
     (
      .clk(clk),
      .rst(rst),
      .wr_en(wr),
      .rd_en(rd),
      .data_in(wdata),
      .full(full),
      .empty(empty),
      .data_out(rdata)
      );

   // Testbench stimulus
   initial
     begin : stimulus
	$monitorb("%d",$time,,clk,,rst,,wr,,rd,,
		  wdata,,full,,empty,rdata);

	// Initialize
	clk = 0; rst = 0; wr = 0; rd = 0; wdata = -1;

	// Toggle and detoggle reset
	@(negedge clk) rst = 1;
	@(negedge clk) rst = 0;

	// Write data to FIFO
	@(negedge clk) wr = 1;

	// Read previously writen data
	@(negedge clk) begin
	  wr = 0;
	  rd = 1;
	end

	// Write data to FIFO for (2**AWIDTH-1) times,
	// full signal can be seen high at the last pulses
	@(negedge clk) begin
	   wr = 1;
	   rd = 0;
	end
	repeat (DEPTH-1) @(negedge clk) wdata = wdata -1;

	// Read data from FIFO for (2**AWIDTH+1) times,
	// empty signal can be seen high at the last pulse
	@(negedge clk) begin
	   wr = 0;
	   rd = 1;
	end
	repeat (DEPTH+1) @(negedge clk);

	// Stop the stimulus
	$stop;

     end // block: stimulus

   // Clock generation
   always #10 clk = ~clk;

endmodule // fifo_test


   
	
	
	
	
	
	 
       
   
