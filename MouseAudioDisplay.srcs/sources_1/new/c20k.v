`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/06/2023 02:05:41 PM
// Design Name: 
// Module Name: c20k
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


module c20k (input CLOCK, output COUT);
    reg [30:0] COUNT = 0;
    reg C0 = 0;
    
    always @ (posedge CLOCK) begin
        COUNT <= (COUNT == 2499) ? 0 : COUNT + 1;
        C0 <= ( COUNT == 0 ) ? ~C0 : C0 ;
    end
    
    assign COUT = C0;
endmodule
