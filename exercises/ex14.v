module FSM
  (input wire clk, rst, sig_in,
   output wire sig_out);
   
   localparam IDLE = 2'd0, FIRST = 2'd1, FOUND = 2'd2;
   reg [1:0]  state, nstate;

   always @*
     case ( state )
       IDLE:         nstate = sig_in? FIRST : IDLE;
       FIRST, FOUND: nstate = sig_in? FOUND : IDLE;
     endcase // case ( state )
      
   always @(posedge clk)
     begin
	if ( rst )
	  state <= IDLE;
	else
	  begin
	     state <= nstate;
	     case ( nstate)
	       IDLE, FIRST: sig_out <= 'b0;
	       FOUND:       sig_out <= 'b1;
	     endcase // case ( nstate)
	  end // else: !if( rst )
     end // always @ (posedge clk)
   
endmodule // FSM
