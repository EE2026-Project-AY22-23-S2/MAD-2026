`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2023 12:40:11 AM
// Design Name: 
// Module Name: ButtonC
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


module ButtonC(input clock, input btn, output Button);
    wire dbState;
    reg dbCommand = 0;
    reg btnState = 0;
    
    always @ (posedge clock) begin
        if (btnState == 0) begin
            if (btn == 0) begin
                btnState <= 0;
            end else begin//btn == 0
                dbCommand <= dbState ? 0 : 1;
                btnState <= dbState ? 0 : 1;
            end
        end else begin//btnState == 1
            if (btn == 0) begin
                dbCommand <= dbState ? 0 : 1;
                btnState <= dbState ? 1 : 0;
            end else //btn == 1
                btnState <= 1;
        end
    end
    
    dbModule debouncer (clock, dbCommand, dbState);
    
    assign Button = btnState;
    
endmodule
