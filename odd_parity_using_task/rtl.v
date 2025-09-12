module Odd_parity_detector(input [3:0]data,output reg parity);
task parity_detector();
			input [3:0]d;
			output reg p;
			begin
				p=^d;
			end
endtask
always@(*)
	begin
		parity_detector(data,parity);
end
endmodule
//*******************tb**********************//

module tb;

	// Inputs
	reg [3:0] data;

	// Outputs
	wire parity;

	// Instantiate the Unit Under Test (UUT)
	Odd_parity_detector uut (
		.data(data), 
		.parity(parity)
	);

	initial begin
		// Initialize Inputs
		data = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	task din(input [3:0]data_in);
		begin
			data=data_in;#10;
			end
     endtask
	  
	  initial begin
				din(4'b1010);
				din(4'b1000);
				din(4'b1110);
				din(4'b1110);
				din(4'b0010);
				din(4'b1111);
				din(4'b1100);
				din(4'b1010);
				din(4'b1001);
				din(4'b1000);
				din(4'b0000);
				din(4'b1100);
				din(4'b1110);
				din(4'b0000);
			end
endmodule

