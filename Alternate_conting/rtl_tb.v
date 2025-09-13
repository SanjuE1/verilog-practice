//***********************RTL***********************//
module alternate_counting(input clk,rst,output reg [3:0]out);
	reg count;
		always@(posedge clk)
			begin
					if(rst) begin
						out<=4'b0;
						count<=1'b0; end
					else if (count) begin
							out<=out+1'b1;
							count<=1'b0; end
						else begin
						out<=out;
						count<=count+1'b1;end
						
			end
endmodule

//***************************TB***********************************//
module tb;
	reg clk;
	reg rst;
	wire [3:0] out;
	
	alternate_counting uut (
		.clk(clk), 
		.rst(rst), 
		.out(out)
							);

	initial begin
		clk = 0;
		rst = 1; @(negedge clk) rst=0;

	end
	always#10clk=~clk; 
		initial begin
      $monitor("Time:%0t | reset :%b | count value:%d | ",$time,rst,out);
			end
endmodule


