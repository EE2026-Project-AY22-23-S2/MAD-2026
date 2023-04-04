`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.03.2023 19:41:29
// Design Name: 
// Module Name: binary_to_seg_converter
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


module binary_to_seg_converter(input CLOCK, input [3:0] value, output reg [7:0] seg_output);
always @ (posedge CLOCK) begin
    case (value)
    4'b0000: seg_output <= 8'b11000000;
    4'b0001: seg_output <= 8'b11111001;
    4'b0010: seg_output <= 8'b10100100;
    4'b0011: seg_output <= 8'b10110000;
    4'b0100: seg_output <= 8'b10011001;
    4'b0101: seg_output <= 8'b10010010;
    4'b0110: seg_output <= 8'b10000010;
    4'b0111: seg_output <= 8'b11111000;
    4'b1000: seg_output <= 8'b10000000;
    4'b1001: seg_output <= 8'b10010000;
    default: seg_output <= 8'b11001001;
    endcase
end

endmodule

