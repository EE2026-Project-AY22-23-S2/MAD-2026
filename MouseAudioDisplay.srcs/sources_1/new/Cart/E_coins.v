`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.03.2023 12:05:28
// Design Name: 
// Module Name: coins
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


module coins(
    input CLOCK,
    input clk_1hz,
    input [3:0] rand,
    output reg [6:0] coin_pos_x,
    output reg [6:0] coin_pos_y
    );
    reg [3:0] prev_rand;
    initial begin
        coin_pos_x = 45;
        coin_pos_y = 0;
    end
        
    always @ (posedge clk_1hz) begin
        if(prev_rand == rand) begin      
            coin_pos_x <= rand * 7 + 20; 
            if (coin_pos_y > 63) begin
                coin_pos_y <= 0;
            end
            else begin
                coin_pos_y <= coin_pos_y + 1;
            end             
        end
        else begin
            coin_pos_y = 0;
            prev_rand <= rand;
        end
    end
        
endmodule
