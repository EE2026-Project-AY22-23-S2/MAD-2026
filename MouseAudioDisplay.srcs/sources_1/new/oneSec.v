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


module oneSec (input CLOCK, press, output COUT);
    reg [26:0] COUNT = 0;
    reg C0 = 1;
    reg withinOneSec = 0;
    
    
    always @ (posedge CLOCK) begin
        withinOneSec <= press ? 1 : (withinOneSec ? (COUNT == 0 ? 0 : 1): 0);
        COUNT <= withinOneSec ? (COUNT == 99999999 ? 0 : COUNT + 1) : 0;
        C0 <= ( COUNT == 0 ) ? ~C0 : C0 ;
    end
    
    assign COUT = withinOneSec ? C0 : 0;
endmodule
