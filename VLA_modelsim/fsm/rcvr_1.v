module rcvr
(
  input  wire      clock   ,
  input  wire      reset   ,
  input  wire      data_in ,
  input  wire      reading ,
  output reg       ready   ,
  output reg       overrun ,
  output reg [7:0] data_out
);

  // For proper operation the FSM must hard-code the MATCH
  localparam [7:0] MATCH = 8'hA5 ; // 10100101

  reg [3:0] state ;

  // Opportunity for Gray encoding as path is mostly linear
  localparam [3:0] HEAD1=4'b0000, HEAD2=4'b0001, HEAD3=4'b0011, HEAD4=4'b0010,
                   HEAD5=4'b0110, HEAD6=4'b0111, HEAD7=4'b0101, HEAD8=4'b0100,
                   BODY1=4'b1100, BODY2=4'b1101, BODY3=4'b1111, BODY4=4'b1110,
                   BODY5=4'b1010, BODY6=4'b1011, BODY7=4'b1001, BODY8=4'b1000;

  reg [6:0] body_reg ;

  // FSM logic and control
  always @(posedge clock)

    if (reset) begin

       // CLEAR ALL CONTROL REGISTERS TO INACTIVE STATE (IGNORE DATA REGISTERS)
       ready <= 'b0;
       overrun <= 'b0;
       state <= HEAD1;
              
      end

    else begin

        // WHEN IN EACH STATE WHAT MOVES FSM TO WHAT NEXT STATE?
        case ( state )
	  HEAD1: state <=  data_in ? HEAD2 : HEAD1;
	  HEAD2: state <= !data_in ? HEAD3 : HEAD2;
	  HEAD3: state <=  data_in ? HEAD4 : HEAD1;
	  HEAD4: state <= !data_in ? HEAD5 : HEAD2;
	  HEAD5: state <= !data_in ? HEAD6 : HEAD4;
	  HEAD6: state <=  data_in ? HEAD7 : HEAD1;
	  HEAD7: state <= !data_in ? HEAD8 : HEAD2;
	  HEAD8: state <=  data_in ? BODY1 : HEAD1;
	  BODY1: begin 
	     state <= BODY2;
	     body_reg[6] <= data_in;
	  end
	  BODY2: begin
	     state <= BODY3;
	     body_reg[5] <= data_in;
	  end
	  BODY3: begin
	     state <= BODY4;
	     body_reg[4] <= data_in;
	  end	  
	  BODY4: begin 
	     state <= BODY5;
	     body_reg[3] <= data_in;
	  end
	  BODY5: begin
	     state <= BODY6;
	     body_reg[2] <= data_in;
	  end
	  BODY6: begin
	     state <= BODY7;
	     body_reg[1] <= data_in;
	  end
	  BODY7: begin
	     state <= BODY8;
	     body_reg[0] <= data_in;
	  end	  
	  BODY8: state <= HEAD1;
        endcase

       // IF STATE IS BODY8 THEN COPY CONCATENATION OF BODY REGISTER AND INPUT
       // DATA TO OUTPUT REGISTER AND SET READY ELSE IF READING THEN CLEAR READY
       if ( state == BODY8 )
	 begin
	    data_out <= {body_reg, data_in};
            ready <= 'b1;
	 end
       else if ( reading )
	 ready <= 'b0;

       // IF READING THEN CLEAR OVERRUN, ELSE
       // IF STATE IS BODY8 AND STILL READY THEN SET OVERRUN
       if ( reading )
	 overrun <= 'b0;
       else if ( state == BODY8 && ready )
	 overrun <= 'b1;
       
      end

endmodule
