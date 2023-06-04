`timescale 1ns / 1ps
module moore_fsm (
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
          state <= S2;
        end
        S2: begin
          if (start)
            state <= S3;
          else
            state <= S0;
        end
        S3: begin
          state <= S0;
        end
      endcase
    end
  end
  
  always @(state) begin
    case (state)
      S0: begin
        out <= 0;
      end
      S1: begin
        out <= 1;
      end
      S2: begin
        out <= 0;
      end
      S3: begin
        out <= 1;
      end
    endcase
  end
endmodule