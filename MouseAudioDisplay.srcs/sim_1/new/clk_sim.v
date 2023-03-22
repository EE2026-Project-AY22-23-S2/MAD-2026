`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/06/2023 01:06:29 PM
// Design Name: 
// Module Name: clk_sim
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


`timescale 1ns / 1ps
module clk_sim( );
 reg clock; wire LED; 
 
 clk dut (clock, 0, LED); 
 
 initial begin 
 clock = 0; 
 end 
 
always begin 
 #5 clock = ~clock; 
end
endmodule
