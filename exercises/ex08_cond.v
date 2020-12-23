module continuous_assign(input [3:0] a,b,
			 input [4:0]  c,
			 input 	      add,
			 output [4:0] y);

   assign y = (add == 1) ? (a + b) : c;

endmodule; // continuous_assign
