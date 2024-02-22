module testbench();

reg clk;
reg clear;
wire [7:0] datainput, dataoutput;
wire finallydone;
wire we;
wire [7:0] I;
reg [7:0] RAM[16383:0]; //modified
reg [7:0] temp; //modified
integer i, k, file_id;
integer j;

// instantiate device to be tested
p1 dut (.clk(clk),
        .ou(dataoutput),
        .finallydone(finallydone),
        .we(we),
        .dataEncoded(I));



// initialize test
initial
begin
  i=0;
  j=0;
end
// generate clock to sequence tests
always
begin
  clk <= 0;
    # 5; 
  clk <= 1;
    # 5; // clock duration
end

always @(negedge clk) begin
    #1
    if (we) begin
        i = 0;
        RAM[j] = I;
        j = j + 1;
    end

    if(finallydone==1)begin
            $writememh("output.dat",RAM);
            #1
            $write ("Simulation successfully");	
            $stop;
    end
end


endmodule
