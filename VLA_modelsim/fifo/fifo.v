module fifo #(parameter AWIDTH = 5,
	      parameter DWIDTH = 8)
   (input wire clk, rst, wr_en, rd_en,
    input wire [DWIDTH-1:0] data_in,
    output wire 	    full, empty,
    output reg [DWIDTH-1:0] data_out);

   localparam DEPTH = 2**AWIDTH;
   reg [DWIDTH-1:0] 	    mem [0:DEPTH-1];

   reg [AWIDTH-1:0] 	    wptr;
   reg [AWIDTH-1:0] 	    rptr;
   reg 			    wrote; // Last operation

   // FIFO function
   always @(posedge clk or posedge rst)
     begin
	if ( rst )
	  begin
	     wptr <= 1'b0;
	     rptr <= 1'b0;
	     wrote <= 1'b0;
	  end
	else
	  begin
	     if ( wr_en && ~full )
	       begin
		  mem[wptr] <= data_in;
		  wptr <= wptr + 1;
		  wrote <= 1'b1;
	       end

	     if ( rd_en && ~empty )
	       begin
		  data_out <= mem[rptr];
		  rptr <= rptr + 1;
		  wrote <= 1'b0;
	       end
	  end // else: !if( rst )
     end // always @ (posedge clk or posedge rst)

   // full and empty states
   assign full  = ( wptr == rptr ) && wrote;
   assign empty = ( wptr == rptr ) && ~wrote;
   
endmodule
	     
   
