module comparator_cdf(I,O);
input [13:0] I; //modified to carry 16383
output reg O; 
genvar k; // Declare a generate variable

initial
begin
O=0; //initial output to 0
end
 

always @(*) begin
    if (I >= 14'd8192) begin
        O = 1'b1; //output 1 if greater than median
    end
    else begin
        O = 1'b0; //output 0 if less than median
    end
end


endmodule