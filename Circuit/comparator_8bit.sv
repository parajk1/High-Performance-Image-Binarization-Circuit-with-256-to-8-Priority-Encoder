module comparator_8bit(A,B,O);
input [7:0] A;
input [7:0] B;
output reg [7:0] O;


	always @(*) begin
            if (A >= B) begin
                O = 1'b1;
            end
            else begin
                O = 1'b0;
            end
    end

endmodule



