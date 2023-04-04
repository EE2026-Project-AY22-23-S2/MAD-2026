`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.03.2023 22:29:47
// Design Name: 
// Module Name: ZoomMode7Seg
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


module ZoomMode7Seg(input CLOCK, [2:0] zoom, output reg [6:0] seg, reg [3:0] an);
    always @ (posedge CLOCK) begin
        an <= 4'b1110;
        seg <= zoom == 1 ? 7'b1111001 : zoom == 2 ? 7'b0100100 : 7'b0011001;
    end
endmodule
