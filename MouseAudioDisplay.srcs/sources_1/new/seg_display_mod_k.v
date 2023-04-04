`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.03.2023 18:37:33
// Design Name: 
// Module Name: seg_display_mod_k
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


module seg_display_mod_k(input CLOCK, input [15:0] final_freq,
                         output reg [7:0] seg,
                         output reg [3:0] an);
                         
wire [1:0] count_100k;
count_100kHz count100k(CLOCK, count_100k);

//Store num 1

wire [3:0] num_seg0;
assign num_seg0 = final_freq % 10;
//Remove rightmost digit
wire [11:0] left_three_digits;
assign left_three_digits = final_freq / 10;
//Store num 2
wire [3:0] num_seg1;
assign num_seg1 = left_three_digits % 10;
//Remove rightmost digit
wire [7:0] left_two_digits;
assign left_two_digits = left_three_digits / 10;
//Store num 3
wire [3:0] num_seg2;
assign num_seg2 = left_two_digits % 10;
//Remove rightmost digit
wire [3:0] left_one_digits;
assign left_one_digits = left_two_digits / 10;

//Create wires to pass these values to seven segment display
wire [7:0] seg3;
wire [7:0] seg2;
wire [7:0] seg1;
wire [7:0] seg0;
binary_to_seg_converter b0(CLOCK, num_seg0, seg0);
binary_to_seg_converter b1(CLOCK, num_seg1, seg1);
binary_to_seg_converter b2(CLOCK, num_seg2, seg2);
binary_to_seg_converter b3(CLOCK, left_one_digits, seg3);

//Assign wires to output from 
always @ (posedge CLOCK)
    case(count_100k)
        2'b00: begin
            seg <= seg0;
            an <= 4'b1110;
        end
        2'b01: begin
            seg <= seg1;
            an <= 4'b1101;
        end
        2'b10: begin
            seg <= seg2;
            an <= 4'b1011;
        end
        2'b11: begin
            seg <= seg3;
            an <= 4'b0111;
        end
    endcase
endmodule
