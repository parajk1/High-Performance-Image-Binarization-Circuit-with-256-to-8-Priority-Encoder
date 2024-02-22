module allthecounters(clk,clear,dataInput,counterI,counterCDFOut);
input clk;
input clear;
input [7:0] dataInput;
input [255:0]counterI;
wire [13:0] co[255:0];
output [255:0] counterCDFOut;


//generate 256 counters for saving CDF
generate
  genvar i;
  for (i=0; i<256; i=i+1) begin :counters
    counter d(
		 .clk(clk)
      ,.clear(clear)
      ,.enable(counterI[i])
      ,.q(co[i])
      );

      comparator_cdf cdf2(co[i],counterCDFOut[i]); //compare each counter to CDF
    
  end
endgenerate
endmodule