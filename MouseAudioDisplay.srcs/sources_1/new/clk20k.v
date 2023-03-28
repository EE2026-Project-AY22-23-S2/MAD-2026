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


module clk20k (input CLOCK, output COUT);
    reg [14:0] COUNT = 0;
    reg C0 = 0;
    
    always @ (posedge CLOCK) begin
        COUNT <= (COUNT == 2499) ? 0 : COUNT + 1;
        C0 <= ( COUNT == 0 ) ? ~C0 : C0 ;
    end
    
    assign COUT = C0;

endmodule