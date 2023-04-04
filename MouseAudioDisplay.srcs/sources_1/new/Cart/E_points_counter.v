`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.03.2023 15:41:13
// Design Name: 
// Module Name: points_counter
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


module points_counter(
    input CLOCK,
    input clk_1hz,
    input [6:0] car_x,
    input [6:0] car_y,
    input [6:0] coin_x,
    input [6:0] coin_y,
    output reg [13:0] points
    );
    
    always @(posedge clk_1hz) begin
        if (car_y == coin_y + 7) begin
            if (coin_x + 5 <= car_x + 10 && coin_x >= car_x ) begin
                points <= points + 1;
            end
        end
    end    
    
endmodule
