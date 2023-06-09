`timescale 1ns / 1ps
module convolution(x,y,C);
	input[3:0]x;
	input[3:0]y;
	output reg[6:0]C;
	
	integer n,k;
	
	wire [6:0]a;
	wire [6:0]b;
	
	assign a[3:0]=x[3:0];
	assign b[3:0]=y[3:0];
	assign a[6:4]=3'b000;
	assign b[6:4]=3'b000;
	
	always@(a or b)
	begin
		C=0;
		for (n=0;n<=6;n=n+1)
			for (k=0;k<=n;k=k+1)begin
				C[n]=C[n]+(a[k]*b[n-k]);
			end
		end
endmodule
