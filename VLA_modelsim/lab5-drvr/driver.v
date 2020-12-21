module driver #(parameter integer WIDTH=8) 
	(input wire [WIDTH-1:0] data_in,
	 input wire 		data_en,
	 output reg [WIDTH-1:0] data_out);
	
	always @*
		if (data_en == 1)
			data_out = data_in;
		else
			data_out = WIDTH'('bz);

endmodule
