`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.03.2023 12:52:45
// Design Name: 
// Module Name: digits_counter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module digits_counter(
    input CLOCK,
    input [13:0] digits,
    output reg [3:0] anode,
    output reg [6:0] segment        
);
    wire [6:0] seg;
    reg [3:0] disp_digit;
    reg [2:0] seg_counter;
    wire clk480Hz;

    clk_480hz clk(CLOCK,clk480Hz);   
    segment_counter cnt (.number(disp_digit),.seg(seg));
  
    always @(posedge clk480Hz) begin
        seg_counter = seg_counter + 1;
        case (seg_counter)
        1: begin
            anode = 4'b1110; //ones digit 
            disp_digit <= digits % 10;           
        end
        2: begin
            anode = 4'b1101; //tens digit 
            disp_digit <= (digits / 10) % 10;      
        end 
        3: begin
            anode = 4'b1011; //hundreds digit
            disp_digit <= (digits / 100) % 10;
        end
        4: begin
            anode = 4'b0111; //thousands
            disp_digit <= (digits / 1000);   
        end
        default: begin
            seg_counter <= 0;
        end               
        endcase  
                                    
    end 
    always @(posedge CLOCK) begin
        segment <= seg;
    end

endmodule
