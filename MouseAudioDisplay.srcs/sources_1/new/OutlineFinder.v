`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/24/2023 03:54:51 PM
// Design Name: 
// Module Name: OutlineFinder
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


module OutlineFinder(input CLOCK, [1:0] in0, [1:0] in1, [1:0] in2, [1:0] in3, [1:0] in4,
                      [1:0] in5, [1:0] in6, [1:0] in7, output reg [15:0] disp);
    wire [12:0] ind [7:0];
    wire [15:0] rgb [7:0];
    wire [15:0] gry [7:0];
    reg [15:0] hor;
    reg [15:0] ver;
    reg [15:0] abs;
    wire [6:0] x;
    wire [6:0] y;
    reg [4:0] red;
    reg [5:0] green;
    reg [4:0] blue;
    
    assign rgb[0] = in0 == 2'b00 ? 16'hFFFF :
                    in0 == 2'b01 ? 16'b1111100000000000 :
                    in0 == 2'b10 ? 16'b0000011111100000 :
                    in0 == 2'b11 ? 16'b0000000000011111 : 16'hFFFF;
                
    assign rgb[1] = in1 == 2'b00 ? 16'hFFFF :
                    in1 == 2'b01 ? 16'b1111100000000000 :
                    in1 == 2'b10 ? 16'b0000011111100000 :
                    in1 == 2'b11 ? 16'b0000000000011111 : 16'hFFFF;
    
    assign rgb[2] = in2 == 2'b00 ? 16'hFFFF :
                    in2 == 2'b01 ? 16'b1111100000000000 :
                    in2 == 2'b10 ? 16'b0000011111100000 :
                    in2 == 2'b11 ? 16'b0000000000011111 : 16'hFFFF;
                    
    assign rgb[3] = in3 == 2'b00 ? 16'hFFFF :
                    in3 == 2'b01 ? 16'b1111100000000000 :
                    in3 == 2'b10 ? 16'b0000011111100000 :
                    in3 == 2'b11 ? 16'b0000000000011111 : 16'hFFFF;
                                        
    assign rgb[4] = in4 == 2'b00 ? 16'hFFFF :
                    in4 == 2'b01 ? 16'b1111100000000000 :
                    in4 == 2'b10 ? 16'b0000011111100000 :
                    in4 == 2'b11 ? 16'b0000000000011111 : 16'hFFFF;
                    
    assign rgb[5] = in5 == 2'b00 ? 16'hFFFF :
                    in5 == 2'b01 ? 16'b1111100000000000 :
                    in5 == 2'b10 ? 16'b0000011111100000 :
                    in5 == 2'b11 ? 16'b0000000000011111 : 16'hFFFF;
                            
    assign rgb[6] = in6 == 2'b00 ? 16'hFFFF :
                    in6 == 2'b01 ? 16'b1111100000000000 :
                    in6 == 2'b10 ? 16'b0000011111100000 :
                    in6 == 2'b11 ? 16'b0000000000011111 : 16'hFFFF;
    
    assign rgb[7] = in7 == 2'b00 ? 16'hFFFF :
                    in7 == 2'b01 ? 16'b1111100000000000 :
                    in7 == 2'b10 ? 16'b0000011111100000 :
                    in7 == 2'b11 ? 16'b0000000000011111 : 16'hFFFF;
                    
                    
    assign gry[0] = rgb[0][15:11] / 3 + rgb[0][10:5] / 2 + rgb[0][4:0] / 10;
    assign gry[1] = rgb[1][15:11] / 3 + rgb[1][10:5] / 2 + rgb[1][4:0] / 10;
    assign gry[2] = rgb[2][15:11] / 3 + rgb[2][10:5] / 2 + rgb[2][4:0] / 10;
    
    assign gry[3] = rgb[3][15:11] / 3 + rgb[3][10:5] / 2 + rgb[3][4:0] / 10;
    assign gry[4] = rgb[4][15:11] / 3 + rgb[4][10:5] / 2 + rgb[4][4:0] / 10;
    
    assign gry[5] = rgb[5][15:11] / 3 + rgb[5][10:5] / 2 + rgb[5][4:0] / 10;
    assign gry[6] = rgb[6][15:11] / 3 + rgb[6][10:5] / 2 + rgb[6][4:0] / 10;
    assign gry[7] = rgb[7][15:11] / 3 + rgb[7][10:5] / 2 + rgb[7][4:0] / 10;
    
    always @ (posedge CLOCK) begin
        hor <= (gry[2] + gry[4] + gry[7] - gry[0] - gry[3] - gry[5]) * (gry[2] + gry[4] + gry[7] - gry[0] - gry[3] - gry[5]);
        ver <= (gry[5] + gry[6] + gry[7] - gry[0] - gry[1] - gry[2]) * (gry[5] + gry[6] + gry[7] - gry[0] - gry[1] - gry[2]);
        abs <= hor + ver;
        red <= abs / 3;
        green <= abs;
        blue <= abs / 10;
        disp <= abs > 31 ? 16'h000 : (abs > 25 ? {red, green, blue} : 16'hFFF);
    end
endmodule
