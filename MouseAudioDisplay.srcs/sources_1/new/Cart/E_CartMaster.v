`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.03.2023 16:49:58
// Design Name: 
// Module Name: movingblocks
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


module CartMaster(
    input clock,
    output [3:0] an,
    output [6:0] seg,
    input sw0,
    input btnC,
    input btnL,
    input btnR,
    input btnU,
    input btnD,
    output cs,sdin,sclk,d_cn,resn,vccen,pmoden,
    input flag
    );
    wire enable;
    wire frame_begin,sending_pixels,sample_pixel;
    wire [12:0] pixel_index;
    reg [15:0] oled_data; 
    wire [15:0] draw_oled;
    wire oledClk;
    wire clk_1hz;
    wire [6:0] pos_x;
    wire signed [8:0] pos_y;   
    wire clk_1khz;    
    wire [6:0] car_x;
    wire [6:0] car_y;
    wire [6:0] coin_x;
    wire [6:0] coin_y;
    wire [13:0] points;
    wire [3:0] anode;
    wire [6:0] segment;
    wire [2:0] rand;
    reg [25:0] counter;
    wire [6:0] seg_init;

    clocks clk(.CLOCK(clock),.clk_625mhz(oledClk),.clk_1hz(clk_1hz),.counter(counter));
    Oled_Display od0 (oledClk, btnC ,frame_begin, 
                sending_pixels, sample_pixel, pixel_index, oled_data, 
                cs, sdin, sclk, d_cn, resn, vccen, pmoden);
    blocks_display blks(.CLOCK(clock),.clk_1hz(clk_1hz),.block_pos_x(pos_x),.block_pos_y(pos_y));
    displayOLED disp(.CLOCK(clock),.pixel_index(pixel_index),.block_pos_x(pos_x),.block_pos_y(pos_y),.oled_data(draw_oled),.car_x(car_x),.car_y(car_y),.coin_x(coin_x),.coin_y(coin_y));
    ThousandHz KHz(.CLOCK(clock),.new_clock(clk_1khz)); //for debouncer
    car_position car_pos (.ThousandHz(clk_1khz),.btnL(btnL),.btnR(btnR),.btnU(btnU),.btnD(btnD),.car_x(car_x),.car_y(car_y),.enable(enable));
    coins coin (.CLOCK(clock),.clk_1hz(clk_1hz),.rand(rand),.coin_pos_x(coin_x),.coin_pos_y(coin_y));
    digits_counter digit_count (.CLOCK(clock),.digits(points),.anode(anode),.segment(segment));
    points_counter pts_cnt (.CLOCK(clock),.clk_1hz(clk_1hz),.car_x(car_x),.car_y(car_y),.coin_x(coin_x),.coin_y(coin_y),.points(points));
    RNG rng (.points(points),.rand(rand));
    
    always @(posedge clock) begin
        oled_data <= draw_oled;
        if(sw0) begin
            counter = 499_999_9; //1hz
        end
        else begin
            counter = 24_999_99; //2hz
        end
    end
    assign seg = enable ? segment : 7'b1111111;
    assign an = enable ? anode : 4'b1111;
    
endmodule
