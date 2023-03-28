`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/10/2023 09:34:09 AM
// Design Name: 
// Module Name: ringerModule
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


module ringerModule(input clock, input command, output state);
    reg [26:0] COUNT = 0;
    reg C0 = 0;
    
    always @ (posedge clock) begin
        if (command == 0) begin
            C0 <= COUNT == 0 ? 0 : 1;
            COUNT <= COUNT == 0 ? 0 : (COUNT == 99999999) ? 0 : COUNT + 1;
        end else begin
            C0 <= 1;
            COUNT <= 1;
        end
    end
    
    assign state = C0;
endmodule
