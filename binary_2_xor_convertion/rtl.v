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
