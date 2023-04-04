`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/24/2023 02:50:47 PM
// Design Name: 
// Module Name: BlurringModule
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


module BlurringModule(input CLOCK, [1:0] in0, [1:0] in1, [1:0] in2, [1:0] in3, [1:0] in4,
                      [1:0] in5, [1:0] in6, [1:0] in7, [1:0] in8, [1:0] in9,
                      [1:0] in10, [1:0] in11, [1:0] in12, [1:0] in13,
                      [1:0] in14, [1:0] in15, [1:0] in16, [1:0] in17, [1:0] in18,
                      [1:0] in19, [1:0] in20, [1:0] in21, [1:0] in22, [1:0] in23, output reg [15:0] disp);
    
    wire [15:0] rgb [23:0];
    reg [7:0] red;
    reg [8:0] green;
    reg [7:0] blue;
    reg [4:0] final_red;
    reg [5:0] final_green;
    reg [4:0] final_blue;
    
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
                    
    assign rgb[8] = in8 == 2'b00 ? 16'hFFFF :
                    in8 == 2'b01 ? 16'b1111100000000000 :
                    in8 == 2'b10 ? 16'b0000011111100000 :
                    in8 == 2'b11 ? 16'b0000000000011111 : 16'hFFFF;
                                        
    assign rgb[9] = in9 == 2'b00 ? 16'hFFFF :
                    in9 == 2'b01 ? 16'b1111100000000000 :
                    in9 == 2'b10 ? 16'b0000011111100000 :
                    in9 == 2'b11 ? 16'b0000000000011111 : 16'hFFFF;
                    
    assign rgb[10] = in10 == 2'b00 ? 16'hFFFF :
                    in10 == 2'b01 ? 16'b1111100000000000 :
                    in10 == 2'b10 ? 16'b0000011111100000 :
                    in10 == 2'b11 ? 16'b0000000000011111 : 16'hFFFF;
                            
    assign rgb[11] = in11 == 2'b00 ? 16'hFFFF :
                    in11 == 2'b01 ? 16'b1111100000000000 :
                    in11 == 2'b10 ? 16'b0000011111100000 :
                    in11 == 2'b11 ? 16'b0000000000011111 : 16'hFFFF;
    
    assign rgb[12] = in12 == 2'b00 ? 16'hFFFF :
                    in12 == 2'b01 ? 16'b1111100000000000 :
                    in12 == 2'b10 ? 16'b0000011111100000 :
                    in12 == 2'b11 ? 16'b0000000000011111 : 16'hFFFF;
                    
    assign rgb[13] = in13 == 2'b00 ? 16'hFFFF :
                    in13 == 2'b01 ? 16'b1111100000000000 :
                    in13 == 2'b10 ? 16'b0000011111100000 :
                    in13 == 2'b11 ? 16'b0000000000011111 : 16'hFFFF;
                                        
    assign rgb[14] = in14 == 2'b00 ? 16'hFFFF :
                    in14 == 2'b01 ? 16'b1111100000000000 :
                    in14 == 2'b10 ? 16'b0000011111100000 :
                    in14 == 2'b11 ? 16'b0000000000011111 : 16'hFFFF;
                    
    assign rgb[15] = in15 == 2'b00 ? 16'hFFFF :
                     in15 == 2'b01 ? 16'b1111100000000000 :
                     in15 == 2'b10 ? 16'b0000011111100000 :
                     in15 == 2'b11 ? 16'b0000000000011111 : 16'hFFFF;
    
    assign rgb[16] = in16 == 2'b00 ? 16'hFFFF :
                     in16 == 2'b01 ? 16'b1111100000000000 :
                     in16 == 2'b10 ? 16'b0000011111100000 :
                     in16 == 2'b11 ? 16'b0000000000011111 : 16'hFFFF;
                    
    assign rgb[17] = in17 == 2'b00 ? 16'hFFFF :
                     in17 == 2'b01 ? 16'b1111100000000000 :
                     in17 == 2'b10 ? 16'b0000011111100000 :
                     in17 == 2'b11 ? 16'b0000000000011111 : 16'hFFFF;
                                        
    assign rgb[18] = in18 == 2'b00 ? 16'hFFFF :
                     in18 == 2'b01 ? 16'b1111100000000000 :
                     in18 == 2'b10 ? 16'b0000011111100000 :
                     in18 == 2'b11 ? 16'b0000000000011111 : 16'hFFFF;
                 
    assign rgb[19] = in19 == 2'b00 ? 16'hFFFF :
                     in19 == 2'b01 ? 16'b1111100000000000 :
                     in19 == 2'b10 ? 16'b0000011111100000 :
                     in19 == 2'b11 ? 16'b0000000000011111 : 16'hFFFF;
                     
     assign rgb[20] = in20 == 2'b00 ? 16'hFFFF :
                      in20 == 2'b01 ? 16'b1111100000000000 :
                      in20 == 2'b10 ? 16'b0000011111100000 :
                      in20 == 2'b11 ? 16'b0000000000011111 : 16'hFFFF;
     
     assign rgb[21] = in21 == 2'b00 ? 16'hFFFF :
                      in21 == 2'b01 ? 16'b1111100000000000 :
                      in21 == 2'b10 ? 16'b0000011111100000 :
                      in21 == 2'b11 ? 16'b0000000000011111 : 16'hFFFF;
                     
     assign rgb[22] = in22 == 2'b00 ? 16'hFFFF :
                      in22 == 2'b01 ? 16'b1111100000000000 :
                      in22 == 2'b10 ? 16'b0000011111100000 :
                      in22 == 2'b11 ? 16'b0000000000011111 : 16'hFFFF;
                                         
     assign rgb[23] = in23 == 2'b00 ? 16'hFFFF :
                      in23 == 2'b01 ? 16'b1111100000000000 :
                      in23 == 2'b10 ? 16'b0000011111100000 :
                      in23 == 2'b11 ? 16'b0000000000011111 : 16'hFFFF;
    
    always @ (posedge CLOCK) begin
        red <= (rgb[0][15:11] / 5 + rgb[1][15:11] / 5 + rgb[2][15:11] / 5 + rgb[3][15:11] / 5 + rgb[4][15:11] / 5 + 
               rgb[5][15:11] / 5 + rgb[6][15:11] / 5 + rgb[7][15:11] / 5 + rgb[8][15:11] / 5 + rgb[9][15:11] / 5 + 
               rgb[10][15:11] / 4 + rgb[11][15:11] / 4 + rgb[12][15:11] / 4 + rgb[13][15:11] / 4 + 
               rgb[14][15:11] / 5 + rgb[15][15:11] / 5 + rgb[16][15:11] / 5 + rgb[17][15:11] / 5 + rgb[18][15:11] / 5 + 
               rgb[19][15:11] / 5 + rgb[20][15:11] / 5 + rgb[21][15:11] / 5 + rgb[22][15:11] / 5 + rgb[23][15:11] / 5) / 4;
        
        green <= (rgb[0][10:5] / 5 + rgb[1][10:5] / 5 + rgb[2][10:5] / 5 + rgb[3][10:5] / 5 + rgb[4][10:5] / 5 + 
                 rgb[5][10:5] / 5 + rgb[6][10:5] / 5 + rgb[7][10:5] / 5 + rgb[8][10:5] / 5 + rgb[9][10:5] / 5 + 
                 rgb[10][10:5] / 4 + rgb[11][10:5] / 4 + rgb[12][10:5] / 4 + rgb[13][10:5] / 4 + 
                 rgb[14][10:5] / 5 + rgb[15][10:5] / 5 + rgb[16][10:5] / 5 + rgb[17][10:5] / 5 + rgb[18][10:5] / 5 + 
                 rgb[19][10:5] / 5 + rgb[20][10:5] / 5 + rgb[21][10:5] / 5 + rgb[22][10:5] / 5 + rgb[23][10:5] / 5) / 4;
                
        blue <= (rgb[0][4:0] / 5 + rgb[1][4:0] / 5 + rgb[2][4:0] / 5 + rgb[3][4:0] / 5 + rgb[4][4:0] / 5 + 
                 rgb[5][4:0] / 5 + rgb[6][4:0] / 5 + rgb[7][4:0] / 5 + rgb[8][4:0] / 5 + rgb[9][4:0] / 5 + 
                 rgb[10][4:0] / 4 + rgb[11][4:0] / 4 + rgb[12][4:0] / 4 + rgb[13][4:0] / 4 + 
                 rgb[14][4:0] / 5 + rgb[15][4:0] / 5 + rgb[16][4:0] / 5 + rgb[17][4:0] / 5 + rgb[18][4:0] / 5 + 
                 rgb[19][4:0] / 5 + rgb[20][4:0] / 5 + rgb[21][4:0] / 5 + rgb[22][4:0] / 5 + rgb[23][4:0] / 5) / 4;
                
        final_red <= red > 5'b11111 ? 5'b11111 : red;
        final_green <= green > 6'b111111 ? 6'b111111 : green;
        final_blue <= blue > 5'b11111 ? 5'b11111 : blue;
        disp <= {final_red, final_green, final_blue};
    end
endmodule