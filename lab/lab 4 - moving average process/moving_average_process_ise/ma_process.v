`timescale 1ns / 1ps
module ma_process(x, y, b, clk);
  parameter WIDTH = 4; // Input and output width
  
  input signed [WIDTH-1:0] x; // Input data
  output reg signed [WIDTH-1:0] y; // Output data
  input [2:0] b; // Filter coefficient
  input clk;
  
  reg signed [WIDTH-1:0] delay_line [2:0]; // Delay line storage
  reg signed [WIDTH-1:0] sum; // Sum of delayed samples
  
  always @(posedge clk) begin
    delay_line[2] <= delay_line[1];
    delay_line[1] <= delay_line[0];
    delay_line[0] <= x;
    
    sum <= (b[0] * delay_line[0]) + (b[1] * delay_line[1]) + (b[2] * delay_line[2]);
    y <= sum;
  end
endmodule
