`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.03.2023 20:51:11
// Design Name: 
// Module Name: handleClick
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


module handleClick(
    input CLOCK,
    input left_click,
    input right_click,
    input [6:0] x,
    input [5:0] y,
    input sw15,
    output reg [12:0] seglit = 0
    );
    //reg change_flag = 1;
    reg p15 = 0;
    always @(posedge CLOCK) begin
        if (!sw15) begin
            if (p15 == 1) begin
                p15 <= 0;
                seglit = 0;
            end else begin
                if (left_click) begin
                    seglit[0] <= ((x > 15 && x < 30) && (y > 10 && y < 15) && ~seglit[0])? 1 : seglit[0];
                    seglit[1] <= ((x > 15 && x < 30) && (y > 30 && y < 35) && ~seglit[1])? 1 : seglit[1];
                    seglit[2] <= ((x > 15 && x < 30) && (y > 50 && y < 55) && ~seglit[2])? 1 : seglit[2];
                    seglit[3] <= ((x > 10 && x < 15) && (y > 15 && y < 30) && ~seglit[3])? 1 : seglit[3];
                    seglit[4] <= ((x > 30 && x < 35) && (y > 15 && y < 30) && ~seglit[4])? 1 : seglit[4];
                    seglit[5] <= ((x > 10 && x < 15) && (y > 35 && y < 50) && ~seglit[5])? 1 : seglit[5];
                    seglit[6] <= ((x > 30 && x < 35) && (y > 35 && y < 50) && ~seglit[6])? 1 : seglit[6];
                end else
                if (right_click) begin
                    seglit[0] <= ((x > 15 && x < 30) && (y > 10 && y < 15) && seglit[0])? 0 : seglit[0];
                    seglit[1] <= ((x > 15 && x < 30) && (y > 30 && y < 35) && seglit[1])? 0 : seglit[1];
                    seglit[2] <= ((x > 15 && x < 30) && (y > 50 && y < 55) && seglit[2])? 0 : seglit[2];
                    seglit[3] <= ((x > 10 && x < 15) && (y > 15 && y < 30) && seglit[3])? 0 : seglit[3];
                    seglit[4] <= ((x > 30 && x < 35) && (y > 15 && y < 30) && seglit[4])? 0 : seglit[4];
                    seglit[5] <= ((x > 10 && x < 15) && (y > 35 && y < 50) && seglit[5])? 0 : seglit[5];
                    seglit[6] <= ((x > 30 && x < 35) && (y > 35 && y < 50) && seglit[6])? 0 : seglit[6];
        
                end           
            end
        end else begin//sw15 on
            p15 <= 1;
        end
    end

endmodule
