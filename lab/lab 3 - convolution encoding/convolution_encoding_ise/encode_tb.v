`timescale 1ns / 1ps

module encode_tb;

  reg [2:0] x;  // Input data
  wire [7:0] y;  // Encoded output data

  // Instantiate the module under test
  convolutional_encoder dut (
    .x(x),
    .y(y)
  );

  // Apply input stimulus
  initial begin
    // Test input pattern
    x = 3'b101;

    // Wait for a few simulation cycles
    #10;

    // Print the input and output values
    $display("Input x = %b", x);
    $display("Output y = %b", y);

    // Finish simulation
    $finish;
  end

endmodule