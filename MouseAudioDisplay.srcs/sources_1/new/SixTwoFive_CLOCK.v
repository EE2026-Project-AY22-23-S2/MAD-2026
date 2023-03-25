`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.03.2023 15:59:43
// Design Name: 
// Module Name: SixTwoFive_CLOCK
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


module SixTwoFive_CLOCK(
    input clock,
    output out
    );
    reg [4:0] count = 0; //6.25MHz
    reg C0 = 0;

     
    always @ (posedge clock) begin  
        count <= (count == 15) ? 0 : count + 1;
        C0 <= (count == 0) ? ~C0 : C0;
    end
    assign out = C0;
endmodule
