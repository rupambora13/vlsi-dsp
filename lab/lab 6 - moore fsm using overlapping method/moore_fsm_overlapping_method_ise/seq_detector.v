`timescale 1ns / 1ps
module seq_detector(
input x,clk,reset,
output reg z
);

parameter S0 = 0 , S1 = 1 , S2 = 2 , S3 = 3 , S4 = 4;
reg [1:0] PS,NS ;

    always@(posedge clk or posedge reset)
        begin
            if(reset)
                PS <= S0;   
            else    
                PS <= NS ;
        end             

    always@(PS or x)
        begin 
            
            case(PS)
                S0 : begin 
                            z <= 0 ;
                            NS <= x ? S1 : S0 ;
                            $display(PS);
                        end
                S1 : begin 
                            z <= 0 ;
                            NS <= x ? S1 : S2 ;
                            $display(PS);
                        end
                S2 : begin 
                            z <= 0 ;
                            NS <= x ? S3 : S0 ;
                            $display(PS);
                        end 
                S3 : begin 
                            z <= 0;
                            NS <= x ? S4 : S2 ;
                            $display(PS);
                        end
                S4 : begin 
                            z <= 1; 
                            NS <= x ? S1 : S2 ;
                            $display(PS);
                        end

            endcase
        end
endmodule