`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.03.2023 12:56:49
// Design Name: 
// Module Name: clk_480hz
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


module clk_480hz (input CLOCK, output COUT);
    reg [14:0] COUNT = 0;
    reg C0 = 0;
    
    always @ (posedge CLOCK) begin
        COUNT <= (COUNT == 104_167) ? 0 : COUNT + 1;
        C0 <= ( COUNT == 0 ) ? ~C0 : C0 ;
    end
    
    assign COUT = C0;

endmodule
