`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.03.2023 12:43:12
// Design Name: 
// Module Name: segment_counter
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


module segment_counter(
    input [3:0] number,
    output reg [6:0] seg
    );
    always @(number)begin
        case (number)
        0: begin
            seg <= 7'b1000000;
            end
        1: begin
            seg <= 7'b1111001;
           end
        2: begin
            seg <= 7'b0100100;
           end
        3: begin
            seg <= 7'b0110000;
           end
        4: begin
            seg <= 7'b0011001;
           end
        5: begin
            seg <= 7'b0010010;
           end
        6: begin
            seg <= 7'b0000010;
           end
        7: begin
            seg <= 7'b1111000;
           end
        8: begin
            seg <= 7'b0000000;
           end
        9: begin
            seg <= 7'b0011000;
           end
        endcase
    end
endmodule
