// pattern for 112233445566778899
module patttern112233(input clk,rst,output reg [3:0]out);
	reg [3:0] temp;
	always@(posedge clk)
		begin
				if(rst)
					begin 
						temp<=4'b0;
						out<=4'b1;
					end
      else if(temp==4'd10&&out==4'd10)  
						begin
						temp<=4'b1;
						out<=4'b1;
					end
				else if(out==temp)
						begin
							out <=out+1'b1;
							temp<=temp;
						end
					else
						temp<=temp+1'b1;
							
					end
endmodule

//************************************ test bench *********************************************//
module tb;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire [3:0] out;

	// Instantiate the Unit Under Test (UUT)
	patttern112233 uut (
		.clk(clk), 
		.rst(rst), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	always #10 clk=~clk;
		 task reset;
			begin
				@(negedge clk)
					rst=1'b1;
				@(negedge clk)
					rst=1'b0;
			end
			endtask
		initial begin
			reset;
			$monitor ("the values are:%d",out);
			end
endmodule

/*
 for 122333444455555

 whole code is same but small logic difference 
 if (rst)
   begin
       out<=4'b1;
       temp<=4'b1;
    end
    else if (out==4'd10&&temp==4'd10)
        begin
             out<=4'b1;
             temp<=4'b1;
        end
    else if (out==temp)
        begin
          out<=out+1'b1;
          temp<=1'b1;
        end
      else
        temp<=temp+1'b1;
      end
      

