// implement a circuit that has to convert binary to grey with genrate block
module bin(input [3:0]in,output [3:0]out);
		
		genvar i;
		assign out[3]=in[3];
		generate 	
			for(i=0;i<=2;i=i+1)
				begin :a
					assign out[i]=in[i]^in[i+1];
				end 
		endgenerate
endmodule


// 
module binary_conversion(in,out);
		input [3:0]in;
		output reg [3:0]out ;
		integer i;
		always@(*)
			begin
					for(i=0;i<=2;i=i+1)
						begin
							out[i]<=in[i]^in[i+1];
						end
						out[3]<=in[3];
			end
			
			 
endmodule

// test bench 

module tb;

	// Inputs
	reg [3:0] in;

	// Outputs
	wire [3:0] out;

	// Instantiate the Unit Under Test (UUT)
	binary_conversion uut (
		.in(in), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		in = 0;

		// Wait 100 ns for global reset to finish
		#10;
	end
	task data(input [3:0]a);
		begin
			in=a;
			#5;
		end
	endtask
	
	initial begin
		data(4'b1010);
		data(4'b0010);
		data(4'b1011);
		data(4'b0001);
	end
	
      
endmodule


