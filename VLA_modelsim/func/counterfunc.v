module counterfunc
#(
  parameter integer WIDTH=5
 )
 (
  input  wire clk  ,
  input  wire rst  ,
  input  wire load ,
  input  wire enab ,
  input  wire [WIDTH-1:0] cnt_in ,
  output reg  [WIDTH-1:0] cnt_out 
 );

  
//////////////////////////////////////////////////////////////////////////////
//TO DO: DEFINE THE COUNTER COMBINATIONAL LOGIC using FUNCTION AS INSTRUCTED//
//////////////////////////////////////////////////////////////////////////////

function [WIDTH-1:0] cnt_func
  (input rst, load, enab,
   input [WIDTH-1:0] in_bus, out_bus);

   begin
      if (rst)
	cnt_func = 'b0;
      else if (load)
	cnt_func = in_bus;
      else if (enab)
	cnt_func = cnt_func + 1;
   end
endfunction // cnt_func   

   
  always @(posedge clk)
     cnt_out <= cnt_func (rst, load, enab ,cnt_in, cnt_out); //function call

endmodule
