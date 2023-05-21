`timescale 1ns / 1ps
module nand_sl(va,vb,vout);
	input va,vb;
	output vout;
	
	supply1 vdc;
	supply0 gnd;
	
	wire w;
	
	pmos p1(vout,vdc,va);
	pmos p2(vout,vdc,vb);
	nmos n1(vout,w,va);
	nmos n2(w,gnd,vb);
endmodule
