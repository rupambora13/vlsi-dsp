`timescale 1ns / 1ps
module decoder3x8_sl(s, y);
  input [2:0] s;
  output [7:0] y;
  wire [7:0] w;
  wire sbar0, sbar1, sbar2;
  
  not n0(sbar0, s[0]);
  not n1(sbar1, s[1]);
  not n2(sbar2, s[2]);
  
  cmos c0(w[0], sbar0, sbar1, sbar2);
  cmos c1(w[1], sbar0, sbar1, s[2]);
  cmos c2(w[2], sbar0, s[1], sbar2);
  cmos c3(w[3], sbar0, s[1], s[2]);
  cmos c4(w[4], s[0], sbar1, sbar2);
  cmos c5(w[5], s[0], sbar1, s[2]);
  cmos c6(w[6], s[0], s[1], sbar2);
  cmos c7(w[7], s[0], s[1], s[2]);
  
  assign y = w;
  
endmodule