module controller(clk,done,we,enable,reallydone);
input clk;
output reg enable;
input done;
output reg we;
input reallydone;

initial
begin
we<=0; //write enable
enable=0; //enable the mux2
end

always @(*)begin
	if(done==1)begin//finish the first reading,start writing to ouput 
	//$display("done == 1");
		we<=1;
		enable<=1;
	end
	else if(reallydone==1)begin//finish the second reading,stop all the operation
	//	$display("reallydone == 1");
		we<=0;
	end 
end
endmodule
