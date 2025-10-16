//======================================================================RTL============================================================================//
module Digital_Watch( input clk, rst_n,output reg [4:0]Hours,output reg [5:0]Minutes,Seconds);
	always@(posedge clk)
		begin
			if(!rst_n)    									// Active Low reset 
				begin
					Hours		<=5'b00000;
					Minutes	<=6'b000000;
					Seconds	<=6'b000000;	
				end

			else 
				begin
					if (Seconds==6'd59)
						begin
						Seconds	<= 6'b000000;
						
							if(Minutes==6'd59)
								begin
								Minutes<=6'b000000;
								
									if(Hours==5'd23) 
										Hours<=5'b00000;
								
									else 
											Hours<=Hours+5'b1;
											
									end
									
								else
											Minutes<=Minutes+6'b1;
							end
							
						else
										Seconds<=Seconds+6'b1;
						end
				end
endmodule

//====================================================================Test Bench=====================================================================//


module Digital_Watch_tb;
	reg clk;
	reg rst_n;
	wire [4:0] Hours;
	wire [5:0] Minutes;
	wire [5:0] Seconds;
	Digital_Watch uut (
		.clk(clk), 
		.rst_n(rst_n), 
		.Hours(Hours), 
		.Minutes(Minutes), 
		.Seconds(Seconds)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst_n = 1;

		// Wait 100 ns for global reset to finish
		#100;
  end
	always#10clk =~clk;
	
	task reset;
		begin
			@(negedge clk)
				rst_n=1'b0;
				@(negedge clk)
				rst_n=1'b1;
		end
	endtask
	initial begin
		reset;
	end
	
      
endmodule


