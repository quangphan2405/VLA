module controller
  (input wire [2:0] phase, opcode,
   input wire zero,
   output reg sel, rd, ld_ir, inc_pc, halt, ld_pc, data_e, ld_ac, wr);

   reg [4:0] terms; // HAZJS
   reg [8:0] flags; 
      
   always @*
     begin
        terms = 5'b0;
        flags = 9'b0;
	case (opcode)
	  0: terms[4] = 1'b1;
	  1: if (zero) terms[2] = 1'b1;
	  6: terms[0] = 1'b1;
	  7: terms[1] = 1'b1;
	  default terms[3] = 1'b1;
	endcase // case (opcode)

	case (phase)
	  0: flags[8] = 1'b1;
	  1: begin
	       flags[8] = 1'b1;
	       flags[7] = 1'b1;
	     end
	  2,3: begin
	     flags[8] = 1'b1;
	     flags[7] = 1'b1;
	     flags[6] = 1'b1;
	  end
	  4: begin
	     flags[5] = 1;
	     flags[4] = terms[4];
	  end
	  5: flags[7] = terms[3];
	  6: begin
	     flags[7] = terms[3];
	     flags[5] = terms[2];
	     flags[3] = terms[1];
	     flags[2] = terms[0];
	  end
	  7: begin
	     flags[7] = terms[3];
	     flags[3] = terms[1];
	     flags[2] = terms[0];
	     flags[1] = terms[3];
	     flags[0] = terms[0];
	  end
	endcase // case (phase)
	{sel, rd, ld_ir, inc_pc, halt, ld_pc, data_e, ld_ac, wr} = flags;
     end
endmodule	
