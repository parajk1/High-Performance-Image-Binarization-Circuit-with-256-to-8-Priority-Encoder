module comparator(I,O);
input [7:0] I;
output reg [255:0] O;
genvar k; // Declare a generate variable

initial
begin
O=0; //initial output to 0
end

generate
    for (k = 0; k <= 255; k = k + 1) begin : comparison_loop
        always @(*) begin
            if (I <= k) begin
                O[k] = 1'b1;
            end
            else begin
                O[k] = 1'b0;
            end
        end
    end
endgenerate

endmodule



