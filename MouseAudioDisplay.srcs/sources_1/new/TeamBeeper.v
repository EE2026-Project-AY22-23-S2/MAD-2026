`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2023 01:29:06 PM
// Design Name: 
// Module Name: TeamBeeper
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


module TeamBeeper(input clock, [4:0] timing, command, output state);
    reg [26:0] COUNT = 0;
    reg C0 = 0;
    wire [26:0] limit;
    wire tick;
    
    assign limit = timing == 0 ? 4999999 :
                   timing == 1 ? 9999999 :
                   timing == 2 ? 29999999 :
                   timing == 3 ? 39999999 :
                   timing == 4 ? 49999999 :
                   timing == 5 ? 59999999 :
                   timing == 6 ? 69999999 :
                   timing == 7 ? 79999999 :
                   timing == 8 ? 89999999 :
                   timing == 9 ? 99999999 : 0;
    
    
    always @ (posedge clock) begin
        if (command == 0) begin
            C0 <= COUNT == 0 ? 0 : 1;
            COUNT <= COUNT == 0 ? 0 : (COUNT == limit) ? 0 : COUNT + 1;
        end else begin
            C0 <= 1;
            COUNT <= 1;
        end
    end
    
    assign state = C0;
    
endmodule
