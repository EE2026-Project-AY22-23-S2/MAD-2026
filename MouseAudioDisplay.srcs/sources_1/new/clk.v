`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2023 02:23:52 PM
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


module clk (input CLOCK, input[26:0] m, output COUT);
    reg [26:0] COUNT = 0;
    reg C0 = 0;
    wire [26:0] n = (100000000 / (2 * m)) - 1;
    
    always @ (posedge CLOCK) begin
        COUNT <= (COUNT == n) ? 0 : COUNT + 1;
        C0 <= ( COUNT == 0 ) ? ~C0 : C0 ;
    end
    
    assign COUT = C0;
endmodule