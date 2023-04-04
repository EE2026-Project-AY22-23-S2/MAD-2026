`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.03.2023 12:25:16
// Design Name: 
// Module Name: VHpaint
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


module VHpaint(
    input clock,
    input oledClk,
    input [11:0] x_input,
    input [11:0] y_input,
    input leftClick,
    input [15:0] pixel_index,
    input [2:0] curr_state,
    output reg [15:0] oled_data
    );
    wire [15:0] outlines;
    wire [15:0] blocks;
    wire clk_1hz;
    
    //wire oledClk;
    wire debounceClk;
    //96*64 display
    
    //Mouse stuff
    wire full_click;
    
    //Oled stuff
    wire [6:0] x_val;
    wire [6:0] y_val;
    
    //mouse values
    wire [6:0] conv_x;
    wire [5:0] conv_y;
    
    wire [15:0] palette;
    wire [15:0] cursor;
    wire [15:0] painting;
    wire [2:0] colour;
    //declare clocks
    ThousandHz debounce_clk(clock, debounceClk);
    debouncer(leftClick, debounceClk, full_click);
    convertXY xy_conv(pixel_index, x_val, y_val);

    
    
    //States: 00 black 01 red 10 green 11 blue 1xx white
    assign conv_x = x_input/10;
    assign conv_y = y_input/10;
    
    SelectColor(oledClk, x_val, y_val, conv_x, conv_y, full_click, colour, palette);
    Draw(oledClk, x_val, y_val, conv_x, conv_y, full_click, colour, painting);
    altMouseDisplay(clock, x_val, y_val, conv_x, conv_y, cursor);

    always @(posedge oledClk) begin
        oled_data <= palette & cursor & painting & 16'hFFFF;
    end
endmodule
