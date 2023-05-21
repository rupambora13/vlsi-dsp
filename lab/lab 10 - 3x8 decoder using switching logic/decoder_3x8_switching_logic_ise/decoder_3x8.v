`timescale 1ns / 1ps
module decoder_3x8(a,y);
	input [3:0] a;
	output [7:0] y;
	
	supply1 vdc;
	supply0 gnd;
	
	cmos c0(y[0]);
	cmos c1(y[1]);
	cmos c2(y[2]);
	cmos c3(y[3]);
	cmos c4(y[4]);
	cmos c5(y[5]);
	cmos c6(y[6]);
	cmos c7(y[7]);
endmodule
