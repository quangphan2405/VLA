module memory #(parameter integer AWIDTH = 5, DWIDTH = 8)
   (input [AWIDTH-1:0] addr,
    input 	       clk, wr, rd,
    inout [DWIDTH-1:0] data);

   localparam MAXSIZE = {AWIDTH{1'b1}};
   
   reg [DWIDTH-1:0]    mem[MAXSIZE:0];  
   
   always @(posedge clk)
     begin	
	if (wr == 1)
	  mem[addr] <= data;			       
     end   
   
   assign data = (rd == 1) ? mem[addr] : {DWIDTH{1'bz}};
   
endmodule // memory

	
		
 
	
