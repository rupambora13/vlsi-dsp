`timescale 1ns / 1ps
module convolutional_encoder(
  input [2:0] x,  // 3-bit input data
  output reg [7:0] y  // 8-bit encoded output data
);
  
  reg [2:0] shift_reg;  // Shift register to store previous input bits

  always @(x)
  begin
    // Shift input data into shift register
    shift_reg[2:1] <= shift_reg[1:0];
    shift_reg[0] <= x;

    // Convolutional encoding logic
    y = {shift_reg[2], shift_reg[2] ^ shift_reg[1], shift_reg[2] ^ shift_reg[1] ^ shift_reg[0]};
  end
endmodule