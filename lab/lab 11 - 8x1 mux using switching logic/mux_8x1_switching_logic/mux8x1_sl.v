`timescale 1ns / 1ps
module mux8x1_sl(x,s,sbar,y);
	input [7:0] x;
	input [2:0] s,sbar;
	output y;
	wire [5:0] w;
	
	cmos c0(w[0],x[0],sbar[0],s[0]);
	cmos c1(w[0],x[1],s[0],sbar[0]);
	cmos c2(w[1],x[2],sbar[0],s[0]);
	cmos c3(w[1],x[3],s[0],sbar[0]);
	cmos c4(w[2],x[4],sbar[0],s[0]);
	cmos c5(w[2],x[5],s[0],sbar[0]);
	cmos c6(w[3],x[6],sbar[0],s[0]);
	cmos c7(w[3],x[7],s[0],sbar[0]);
	
	cmos c8(w[4],w[0],sbar[1],s[1]);
	cmos c9(w[4],w[1],s[1],sbar[1]);
	cmos c10(w[5],w[2],sbar[1],s[1]);
	cmos c11(w[5],w[3],s[1],sbar[1]);
	
	cmos c12(y,w[4],s[2],sbar[2]);
	cmos c13(y,w[5],s[2],sbar[2]);
	
endmodule
