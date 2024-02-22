module counter (clk,clear, enable,q);
   input   clear, enable,clk;
   output reg [13:0] q;
	initial begin
		q=0;
	end
   // An enable counter
	always @ (posedge clk ) begin
		#1
      if (clear)
         q <= 0;
      else if (enable)
         q <= q+1;
   end
endmodule
