module ex07 (input wire a,b,c,sel,clk,
	     output reg op);
   reg 			tmp;

   always @(posedge clk)
     begin
        tmp <= sel ? c : b;
     end

   always @(posedge clk)
     begin
	op <= sel ? c : a & tmp;
     end

endmodule; // ex07

	
		
