`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.03.2023 15:47:20
// Design Name: 
// Module Name: menu_display
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


module menu_display(
    input clock,
    input btnC,
    output cs, sdin, sclk, d_cn, resn, vccen, pmoden,
    output reg [3:0] state

    );
    
    reg [15:0] menu0 [0:6143];
    reg [15:0] menu1 [0:6143];
    reg [15:0] menu2 [0:6143];
    reg [15:0] menu3 [0:6143];
    reg [15:0] menu4 [0:6143];
    reg [15:0] menu5 [0:6143];
    initial begin
        $readmemh("Menu 0.mem",menu0);
        $readmemh("Menu 1.mem",menu1);
        $readmemh("Menu 2.mem",menu2);
        $readmemh("Menu 3.mem",menu3);
        $readmemh("Menu 4.mem",menu4);
        $readmemh("Menu 5.mem",menu5);
        state <= 0;
    end
    wire frame_begin,sending_pixels,sample_pixel;
    wire [12:0] pixel_index;
    reg [15:0] oled_data; 
    wire oledClk;
    wire clk_1hz;
 
    clocks clk(.CLOCK(clock),.clk_625mhz(oledClk));
    Oled_Display od0 (oledClk, btnC ,frame_begin, 
                    sending_pixels, sample_pixel, pixel_index, oled_data, 
                    cs, sdin, sclk, d_cn, resn, vccen, pmoden);
    
    reg [15:0] img [0:6143];
    
    always @(posedge clock) begin
        if (state == 0) begin    
            oled_data <= menu0[pixel_index];
        end
        else if(state == 1) begin
            oled_data <= menu1[pixel_index];
        end
    end
endmodule
