`timescale 1ns / 1ps
module fir_filter(x, y, b, clk);
  parameter WIDTH = 8; // Input and output width
  
  input signed [WIDTH-1:0] x; // Input data
  output reg signed [WIDTH-1:0] y; // Output data
  input signed [2:0]b; // Filter coefficients
  input clk;
  
  reg signed [WIDTH-1:0] delay_line [2:0]; // Delay line storage
  reg signed [WIDTH-1:0] output_sum; // Sum of delayed samples
  
  always @(posedge clk) begin
    delay_line[2] <= delay_line[1];
    delay_line[1] <= delay_line[0];
    delay_line[0] <= x;
    
    output_sum <= (b[0] * delay_line[0]) + (b[1] * delay_line[1]) + (b[2] * delay_line[2]);
    y <= output_sum;
  end
endmodule
