`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.03.2023 23:15:26
// Design Name: 
// Module Name: OutlMode7Seg
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


module OutlMode7Seg(input CLOCK, output reg [6:0] seg, reg [3:0] an);
    reg [1:0] stg = 2'b00;
    always @ (posedge CLOCK) begin
        if (stg == 2'b00) begin
            seg <= 7'b1000000;
            an <= 4'b0111;
            stg <= 2'b01;
        end else if (stg == 2'b01) begin
            seg <= 7'b1100011;
            an <= 4'b1011;
            stg <= 2'b10;
        end else if (stg == 2'b10) begin
            seg <= 7'b0000111;
            an <= 4'b1101;
            stg <= 2'b11;
        end else begin
            seg <= 7'b1001111;
            an <= 4'b1110;
            stg <= 2'b00;
        end
    end
endmodule