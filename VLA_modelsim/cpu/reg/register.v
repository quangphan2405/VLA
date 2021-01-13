module register #(parameter WIDTH=8)
   (input wire [WIDTH-1:0] data_in,
    input wire 		   load,clk,rst,
    output reg [WIDTH-1:0] data_out);

   always @(posedge clk)
     begin
	if (rst == 1)
	  data_out <= {WIDTH{1'b0}};
	else
	  data_out <= load ? data_in : data_out;
     end

endmodule // register

 
