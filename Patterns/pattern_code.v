//yaml triangle 54321
module pyramid();
	integer i,j;
	 initial begin
		for(i=5; i>=0; i=i-1)
			begin
				for(j=5;j>=i ;j=j-1)
					begin
						$write("",j);
					end
					$display();
				end
		end
	endmodule
	
	
	
	// triangle 123 increment changing sequence
	module pyramid();
	integer i,j;
	integer num=1;
	 initial begin
		for(i=1; i<=5; i=i+1)
			begin
				for(j=1;j<=i ;j=j+1)
					begin
						$write("%d",num);
						num=num+1'b1;
					end
					$display();
				end
				#10;
		end
	endmodule
	
// uppertriangle

	module pyramid();
	integer i,j;
	 initial begin
		for(i=1; i<=5; i=i+1)
			begin
				for(j=5;j>=i ;j=j-1)
					begin
						$write("",j);
					end
					$display();
				end
		end
	endmodule
	
	// hallow square 
	module pyramid();
	integer i,j;
	integer n=5;
	 initial begin
		for(i=1; i<=n; i=i+1)
			begin
				for(j=1;j<=n ;j=j+1)
					begin
					if(i==1 || i==n || j==1 || j==n)
						$write("*");
						else
              $write(" ");
					end
					$display();
				end
		end
	endmodule
	
	 




	 




