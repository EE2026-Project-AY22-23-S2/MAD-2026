`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.03.2023 23:25:44
// Design Name: 
// Module Name: segment
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


module TeamTask(
    input CLOCK, [12:0] pixel_index,
    input [11:0] x_input,
    input [11:0] y_input,
    input leftClick, rightClick,
    input sw15,sw2, output LD15, //seg recog
    output reg [15:0] oled_data,
    output [7:0] seg, [3:0] an, [11:0] audio_out,
    input [3:0] indv_an, [7:0] indv_seg
    );
    
    wire [15:0] outlines;
    wire [15:0] blocks;
    wire clk_1hz;
    
    //Mouse stuff
    //wire [11:0] x_input;
    //wire [11:0] y_input;
    //wire click; //click input from mouse
    wire full_click; //debounced click input
    wire full_R_click;
    wire [6:0] x_val;
    wire [6:0] y_val;
    wire [6:0] conv_x;
    wire [5:0] conv_y;
    wire [15:0] mousePos;
    
    assign conv_x = x_input/10;
    assign conv_y = y_input/10;
    //clock wire for OLED usage
    wire oledClk;
    wire debounceClk;
    
    wire C20k, C50M, Cf, C2f, Cdb, NC;
    
    //Declare register to store current state of lit segments
    wire[12:0] segment_lit;
    
    //declare clocks
    clocks clock(.CLOCK(CLOCK),.clk_625mhz(oledClk),.clk_1hz(clk_1hz));
    ThousandHz debounce_clk(CLOCK, debounceClk);
    
    //Declare OLED
    
    //Connect Mouse inputs
    debouncer(leftClick, debounceClk, full_click);
    debouncer(rightClick, debounceClk, full_R_click);
    
    convertXY xy_conv(pixel_index, x_val, y_val); //obtain equivalent x-values and y_values of oled.
    handleClick clickHandler(debounceClk, full_click, full_R_click, conv_x, conv_y, sw15 ,segment_lit);
    
    //Initialize segment display
    segment_display sd(CLOCK,sw2,pixel_index,outlines);
    seg_blocks sb(.CLOCK(CLOCK),.pixel_index(pixel_index),.segment_status(segment_lit),.oled_data(blocks)); 
    mouseDisplay(CLOCK, x_val, y_val, conv_x, conv_y, mousePos);
    
    //Audio Output
    clk clk20k (CLOCK, 20000, C20k);
    clk clk50M (CLOCK, 50000000, C50M);
    
    //part c
    segment_recog sgr(sw15, CLOCK, segment_lit, LD15, audio_out, seg, an, indv_an, indv_seg);
    
    always @(posedge oledClk) begin
        oled_data <= outlines | blocks |mousePos ;
    end

endmodule

