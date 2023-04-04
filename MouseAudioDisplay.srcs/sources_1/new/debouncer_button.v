`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2023 02:36:28 PM
// Design Name: 
// Module Name: debouncer_button
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


module debouncer_button(
    input raw_button,
    input clk_1000hz,
    output button    
    );
    wire Q0,Q1,Q2,Q3;
    DFF D0 (clk_1000hz,raw_button,Q0);
    DFF D1 (clk_1000hz,Q0,Q1);
    DFF D2 (clk_1000hz,Q1,Q2);
    assign button = Q1 & (~Q2);
endmodule