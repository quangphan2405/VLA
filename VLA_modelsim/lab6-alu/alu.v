module alu #(parameter integer WIDTH=8)
   (input wire [WIDTH-1:0] in_a, in_b,
    input wire [2:0] 	   opcode,
    output reg [WIDTH-1:0] alu_out,
    output wire		   a_is_zero);

   assign a_is_zero = !in_a;
   
   always @* begin
      case (opcode)
	3'b010: alu_out = in_a + in_b;
	3'b011: alu_out = in_a & in_b;
	3'b100: alu_out = in_a ^ in_b;
	3'b101: alu_out = in_b;	
	default: alu_out = in_a;
      endcase
   end
endmodule // alu

	
