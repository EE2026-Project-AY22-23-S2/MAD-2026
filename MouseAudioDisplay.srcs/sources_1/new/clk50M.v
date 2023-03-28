`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/01/2023 03:04:11 PM
// Design Name: 
// Module Name: clk20k
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


module clk50M (input CLOCK, output COUT);
    reg C0 = 0;
    
    always @ (posedge CLOCK) begin
        C0 = ~C0;
    end
    
    assign COUT = C0;
endmodule