module multiplexor #(parameter WIDTH=5) (sel, in0, in1, mux_out);
	input  wire				sel;
	input  wire [WIDTH-1:0]	in0, in1;
	output reg	[WIDTH-1:0]	mux_out;
	
	always @(in0, in1, sel)
		if (sel == 1)
			mux_out = in1;
		else
			mux_out = in0;
endmodule