`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/01/2023 03:11:59 PM
// Design Name: 
// Module Name: clk
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


module dbManager (input CLOCK, btnC, output pressed);
    wire C100;
    reg newPress = 0;
    reg canUpdate = 1;
    
    clk clk100 (CLOCK, 100, C100);
    
    always @ (posedge C100) begin
        canUpdate <= btnC ? canUpdate : 1;
        newPress <= btnC ? (newPress ? 0 : 1) : 0;
    end
    
    assign pressed = newPress;
    
endmodule
