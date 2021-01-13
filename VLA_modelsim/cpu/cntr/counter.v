module counter #(parameter integer WIDTH = 5)
   (input wire enab, load, clk, rst,
    input wire [WIDTH-1:0] cnt_in,
    output reg [WIDTH-1:0] cnt_out);

   always @(posedge clk)
     begin
	
	if (rst == 1)
	  cnt_out <= 'b0;
	else if (load == 1)
	  cnt_out <= cnt_in;
	else if (enab == 1)
	  cnt_out <= cnt_out + 1;

     end // always @ (posedge clk)

endmodule // counter

   
