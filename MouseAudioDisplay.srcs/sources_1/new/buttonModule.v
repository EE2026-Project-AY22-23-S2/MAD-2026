`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2023 12:57:55 AM
// Design Name: 
// Module Name: buttonModule
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


module buttonModule(input clk, input btn, output Button);
    wire Q0,Q1,Q2,Q3;
    DFF D0 (clk,btn,Q0);
    DFF D1 (clk,Q0,Q1);
    DFF D2 (clk,Q1,Q2);
    assign Button = Q1 & (~Q2);
endmodule
