`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.03.2023 00:15:13
// Design Name: 
// Module Name: view_wvfrm
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


module view_wvfrm(    
    input CLOCK,
    input [11:0] MIC_in, output reg [8:0] led,
    output [7:0] seg, output [3:0] an,
    input sw0, input sw1, input sw2, input sw3, input sw4, input sw5, input sw6,
    input [12:0] pixel_index, output reg [15:0] oled_data);
    
    wire oledClk;
    clk clk6p25m(CLOCK, 6_250_000, oledClk);

    wire clkp2;
    clk clock_10(CLOCK, 10, clkp2);
    
    wire frame_begin,sending_pixels,sample_pixel;
    wire [15:0] wre;
    
    reg [5:0] samp;
    wire [5:0] normal_samp;
    wire [5:0] loud_samp;
    wire [5:0] soft_samp;
    
    wire [8:0] led_normal;
    wire [8:0] led_loud;
    wire [8:0] led_soft;
    
    reg [15:0] display_vol;
    wire [15:0] normal_display_vol;
    wire [15:0] loud_display_vol;
    wire [15:0] soft_display_vol;
    
    reg [5:0] vol_level9;
    reg [5:0] vol_level8;
    reg [5:0] vol_level7;
    reg [5:0] vol_level6;
    reg [5:0] vol_level5;
    reg [5:0] vol_level4;
    reg [5:0] vol_level3;
    reg [5:0] vol_level2;
    reg [5:0] vol_level1;
    reg [5:0] vol_level0;


extract_exact_vol v(CLOCK, MIC_in, normal_samp, normal_display_vol, led_normal); 
loud_range l(CLOCK, MIC_in, loud_samp, loud_display_vol, led_loud);
soft_range s(CLOCK, MIC_in, soft_samp, soft_display_vol, led_soft);

   
oled_bar d(CLOCK, pixel_index, wre, vol_level9,
            vol_level8, vol_level7, vol_level6, vol_level5, vol_level4, vol_level3, 
            vol_level2, vol_level1, vol_level0, sw0, sw1, sw2, sw3, sw4, sw5, sw6);    
                
always @ (CLOCK) begin
    if (sw0) begin //soft
        samp <= soft_samp;
        display_vol <= soft_display_vol;
        led <= led_soft;
    end
    
    else if (sw1) begin //loud
        samp <= loud_samp;
        display_vol <= loud_display_vol;
        led <= led_loud;
    end
    
    else begin //normal mode
        samp <= normal_samp;
        display_vol <= normal_display_vol;
        led <= led_normal;
    end
    
    oled_data <= wre;
end

// Remove the segment an anode part from sec 4a and replace it with segd_display
// replace with reg

wire [15:0] mod_display_vol;
assign mod_display_vol = display_vol - 2040;
seg_display_mod_k sg_display(CLOCK, mod_display_vol, seg, an);


// MIC sample updates every 0.1s
// Used fixed peak instead

always @ (posedge clkp2) begin
//    vol_level0 <= (mod_display_vol / 33); //1st D FF
    vol_level0 <= samp; //1st D FF
    vol_level1 <= vol_level0; //2nd D FF
    vol_level2 <= vol_level1; //3rd D FF
    vol_level3 <= vol_level2; //4th D FF
    vol_level4 <= vol_level3; //5th D FF
    vol_level5 <= vol_level4; //6th D FF
    vol_level6 <= vol_level5; //6th D FF
    vol_level7 <= vol_level6; //6th D FF
    vol_level8 <= vol_level7; //6th D FF
    vol_level9 <= vol_level8; //6th D FF

end 
endmodule

