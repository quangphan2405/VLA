`timescale 1ns / 1 ns

module rcvr_test;   

   localparam HEADER_SIZE  = 8;
   localparam HEADER_VALUE = 8'ha5;
   localparam BODY_SIZE    = 16;
   localparam NUM_PACKETS  = 4;
   localparam BITS_LENGTH  = 256;

   reg sclk, rst, sdata, ack, ready;
   reg [7:0] dout;
   reg [7:0] tdata [1:2*NUM_PACKETS];
   reg [7:0] rdata [1:2*NUM_PACKETS];
   reg [BITS_LENGTH-1:0] din;

   rcvr
     #(
       .HEADER_SIZE  ( HEADER_SIZE  ),
       .HEADER_VALUE ( HEADER_VALUE ),
       .BODY_SIZE    ( BODY_SIZE    )
       )
   rcvr_inst
     (
      .SCLK  ( sclk  ),
      .RST   ( rst   ),
      .SDATA ( sdata ),
      .ACK   ( ack   ),
      .READY ( ready ),
      .DOUT  ( dout  )
      );

   task generate_data
     (input integer seed);
      begin
	integer i,
	for (i=0; i<=2*NUM_PACKETS-1; i=i+1)
	   tdata[i] = $random(seed);
      end
   endtask // generate_data

   initial begin : CLK_GEN
      clk = 1;
      forever #5 clk = ~clk;
   end   

   initial begin : TRANSMIT
      reg [1:8] bits;
      integer idx, data_idx, i, j, seed;
      data_idx = 1;
      seed = 42;
      generate_data(seed);
      
      fork
	 for (idx=0; idx<=9; idx=idx+1)
	   if (idx % 64 == 24) begin
	      din[24*i+:24] = {HEADER_VALUE, tdata[data_idx], tdata[data_idx+1]};
	      data_idx = data_idx + 2;
	   end else
	     din[24*i+:24] = $random(seed);

	 din[241:BITS_LENGTH-1] = $random(seed);
      join

      @(negedge sclk) rst = 1;
      @(negedge sclk) rst = 0;
      for (i=0; i<=31; i=i+1) begin
	 bits = din[8*i+:8];
	 for (j=1; j<=8; j=j+1) @(negedge sclk) sdata = bits[j];
	 if ( bits == HEADER_VALUE )
	   $display("At time %0d header found!", $time);
      end
   end // block: TRANSMIT

   initial begin : RECEIVE
      integer i, seed;
      ack = 0;
      seed = 86;
      for (i=1; i<=8; i=i+1) begin
	 @(posedge ready);
	 repeat ($dist_uniform(seed,0,8)) @(negedge sclk);
	 rdata[i] = dout;
	 $display("At time %0d: Got data \"%b\""), $time, dout);
	 @(negedge sclk) ack = 1;
	 @(negedge sclk) ack = 0;
      end

      if ( rdata == tdata )
	$display("TRANSMIT SUCCESSFULLY");
      else
	$display("TRANSMIT FAILED");
      $finish;
   end // block: RECEIVE
   
	 
	 
	 
	
	
   
      
	   
	     
	   
	      
	   
      
	   
	 

   
   
   
   

  
