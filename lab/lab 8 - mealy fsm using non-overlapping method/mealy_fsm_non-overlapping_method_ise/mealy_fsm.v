`timescale 1ns / 1ps
module mealy_fsm (
  input wire clk,
  input wire reset,
  input wire start,
  output reg out
);
  reg [1:0] state;
  reg prev_start;
  reg [1:0] next_state; // Declaration of next_state variable
  
  parameter S0 = 2'b00;
  parameter S1 = 2'b01;
  parameter S2 = 2'b10;
  parameter S3 = 2'b11;
  
  always @(posedge clk or posedge reset) begin
    if (reset) begin
      state <= S0;
      out <= 0;
      prev_start <= 0;
    end else begin
      state <= next_state;
      prev_start <= start;
    end
  end
  
  always @(*) begin
    case (state)
      S0: begin
        if (start && ~prev_start)
          next_state = S1;
        else
          next_state = S0;
      end
      S1: begin
        if (start && ~prev_start)
          next_state = S2;
        else
          next_state = S3;
      end
      S2: begin
        next_state = S3;
      end
      S3: begin
        if (start && ~prev_start)
          next_state = S0;
        else
          next_state = S2;
      end
    endcase
  end
  
  always @(state or start) begin
    case (state)
      S0: begin
        if (start && ~prev_start)
          out <= 0;
      end
      S1: begin
        if (start && ~prev_start)
          out <= 1;
      end
      S2: begin
        out <= 0;
      end
      S3: begin
        if (start && ~prev_start)
          out <= 1;
      end
    endcase
  end
endmodule