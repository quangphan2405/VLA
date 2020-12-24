task task09
  (input [32-1:0] addr);
   begin
      @(posedge clk)
	sel <= 1;
        abus <= addr;

      repeat (3)
	@(posedge clk)
	  abus <= abus + 1;

      sel <= 0;
   end
endtask // task09

      
