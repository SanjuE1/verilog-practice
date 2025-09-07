//****************************RTL****************************************//
module SISO_( input clk,rst ,input din,  output dout );
reg [2:0]count; reg [3:0]temp;

		always@(posedge clk)				
			begin
			
				if(rst)
					begin
						temp<=4'b0;
						count<=3'b0;
					end
					
				else if ( count<=3'd4)
						begin
							temp[0]<=din;
							temp[1]<=temp[0];
							temp[2]<=temp[1];
							temp[3]<=temp[2];
							count<=count+3'b1;
						end
						
				else 
						begin
							temp<=temp;
							count<=count+3'd1;

						end
							
				end
				assign dout=temp[3];
	endmodule
//******************************TB*********************************//


module tb;

	// Inputs
	reg clk;
	reg rst;
	reg din;

	// Outputs
	wire dout;

	// Instantiate the Unit Under Test (UUT)
	SISO_ uut (
		.clk(clk), 
		.rst(rst), 
		.din(din), 
		.dout(dout)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		din = 0;

		// Wait 100 ns for global reset to finish
		//#10;
        
		// Add stimulus here

	end
	always#5clk=~clk;
	
	task reset;
		begin
			@(negedge clk)
			rst=1'b1;
			@(negedge clk)
			rst=1'b0;
		end
	endtask
	
	task data(input in);
			begin
				@(negedge clk)
					din=in;
			end
	endtask
	initial begin
		reset;
		data(1);
		data(1);
		data(0);
		data(1);
//		data(1);
//		data(0);
		end
			
      
endmodule
