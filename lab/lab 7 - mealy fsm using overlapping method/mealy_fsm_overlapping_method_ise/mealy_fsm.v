`timescale 1ns / 1ps
module mealy_fsm (
  input wire clk,
  input wire reset,
  input wire start,
  output reg out
);
  reg [1:0] state;
  
  parameter S0 = 2'b00;
  parameter S1 = 2'b01;
  parameter S2 = 2'b10;
  parameter S3 = 2'b11;
  
  always @(posedge clk or posedge reset) begin
    if (reset) begin
      state <= S0;
      out <= 0;
    end else begin
      case (state)
        S0: begin
          if (start)
            state <= S1;
          else
            state <= S0;
        end
        S1: begin
          if (start)
            state <= S2;
          else
            state <= S3;
        end
        S2: begin
          state <= S3;
        end
        S3: begin
          if (start)
            state <= S0;
          else
            state <= S2;
        end
      endcase
    end
  end
  
  always @(state or start) begin
    case (state)
      S0: begin
        if (start)
          out <= 0;
      end
      S1: begin
        if (start)
          out <= 1;
      end
      S2: begin
        out <= 0;
      end
      S3: begin
        if (start)
          out <= 1;
      end
    endcase
  end
endmodule