module memory #(parameter integer AWIDTH = 5, DWIDTH = 8)
   (input [AWIDTH-1:0] addr,
    input 	       clk, wr, rd,
    inout [DWIDTH-1:0] data);
   
   reg [DWIDTH-1:0]    array[0:2**AWIDTH-1];  
   
   always @(posedge clk)
     begin	
	if (wr == 1)
	  array[addr] <= data;			       
     end   
   
   assign data = (rd == 1) ? array[addr] : {DWIDTH{1'bz}};
   
endmodule // memory

	
		
 
	
