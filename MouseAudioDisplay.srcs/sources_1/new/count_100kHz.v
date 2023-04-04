`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.03.2023 19:33:42
// Design Name: 
// Module Name: count_100kHz
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


module count_100kHz(input CLOCK, output reg [1:0] my_counter = 0);
wire clk100k;
clk clock_100k(CLOCK, 100_000, clk100k);
    
    always @ (posedge clk100k) 
        begin
        // Reset counting after 2
        //NEED TO START FROM 0
        my_counter <= (my_counter == 2'b11)? 4'b00 : my_counter + 1;
        end
endmodule