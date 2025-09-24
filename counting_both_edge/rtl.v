//=============================================RTL============================================================//
module rtl(input clk,rst,output [3:0]count);
	reg [3:0]count1,count2;

always@(posedge clk)
	begin
		if(rst)
			count1<=4'b0;
			else
			count1<=count1+4'b1;
	end
	
always@(negedge clk)
	begin
	if(rst)
		count2<=4'b0;
	else
	count2<=count2+4'b1;
	end
	assign count=count1+count2;
endmodule

//=============================================Test Bench====================================================//
module tb;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire [3:0] count;

	// Instantiate the Unit Under Test (UUT)
	rtl uut (.clk(clk),.rst(rst),.count(count));

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	
	always#10 clk=~clk;
	
	initial begin
		@(negedge clk)
		rst=1'b1;
		@(negedge clk)
		rst=1'b0;
		$monitor("Time=%t | reset=%d | clock =%d | Count =%d",$time,rst,clk,count);
	end
      
endmodule


