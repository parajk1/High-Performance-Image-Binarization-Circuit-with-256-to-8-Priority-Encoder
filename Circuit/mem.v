module mem (clock, 
			rd,
			done,
			reallydone); 
			
input  clock;			
output reg[7:0] rd;	
output reg done;	
output reg reallydone;
		
reg [7:0] RAM[16383:0];
reg [15:0]i;
reg [4:0]j;
reg [7:0]temp;
reg [7:0] temp_8bit;

	initial
	begin
	$readmemh ("moon_128x128_hex.dat",RAM);
	i=0;
	j=0;
	temp<=RAM[i];
	done<=0;
	reallydone<=0;
	end
	
	always @(posedge clock) begin
		 if(j==1)begin
			j=0;
			
			if(i==16383)begin
				//$display("read 1 time");
				//$display("done1 = %b", done);
				i=0;
				done=~done;
				//$display("done2 = %b", done);
				if(done==0) begin
					reallydone<=1;
					//$display("temp_done = %b, reallydone = %b", temp_done, reallydone);
				end
			end
			else begin
				i=i+1;
				//$display("i = %d", i);
			end
			
			temp=RAM[i];
		end
	
	 rd = temp[7:0];
	 //temp=temp<<8;
	 j=j+1;
	 
	 //$display("rd = %d", rd);
	end
endmodule
