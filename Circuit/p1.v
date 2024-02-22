module p1(clk,ou,finallydone,we,dataEncoded);
input clk;
output [7:0] ou;
wire [7:0] dataInput;
wire [255:0]counterI,muxout;
wire enable;
wire done;
wire done2;
wire [14:0] aluin;

output wire we;
output wire finallydone;
wire [7:0] thresh_enabler;

wire [7:0] encoded_result;
wire [255:0] counterData;
output wire [7:0] dataEncoded;


//memory module that outputting one pixel per cycle
mem m(clk,dataInput,done,finallydone);

//Comparator
comparator comp(dataInput,counterI);

//control input of all the counters
mux2 #(256) m2(counterI,256'b0,enable,muxout);


//CDF calculator portion
allthecounters counters(clk,clear,dataInput,muxout,counterData);

//read the memory again, and compare every pixel with the median
priority_encoder_256to8 pe(clk, done, counterData, enable, encoded_result, done2);

//Comparator
comparator_8bit b(encoded_result,dataInput,thresh_enabler);

//mux Thresholding
mux2 #(8) m2t(8'd255,8'd0,thresh_enabler[0], dataEncoded);

//control write enable and signal out if finish equalization
controller c(clk,done,we,enable,finallydone);

//$display statements for debugging
    always @(posedge clk) begin
        //$display("median = %b, aluin = %b", median, aluin);
		//$display("muxout = %b, counterData = %b", muxout, counterData);
		//$display("ou = %b", ou);
		//$display("aluin = %b, counterData = %b", aluin, counterData);
		//$display("counterI = %b", counterI);
		//$display("dataInput = %b", dataInput);
		//$display("median = %b, encodedresult = %b", median, encoded_result);
		//$display("enable = %b, finallydone = %b", enable, finallydone);
    end

endmodule
