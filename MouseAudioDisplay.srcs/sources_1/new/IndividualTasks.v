`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2023 03:13:39 PM
// Design Name: 
// Module Name: IndividualTasks
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


module IndividualTasks (input clock, [15:0] sw, 
                        input middleClick, btnC,
                        output [11:0] audio_out,
                        input [11:0] MIC_in,
                        input [12:0] pixel_index,
                        output [15:0] oled_data,
                        input [12:0] pixel_index1,
                        output [15:0] oled_data1,
                        input [11:0] x_input,
                        input [11:0] y_input,
                        output [8:0] led, [7:0] seg, [3:0] an );

//(input clock, sw0, btnC, output D1, D2, CLK_OUT, nSync,
//                    input J_MIC_Pin3, output J_MIC_Pin1, J_MIC_Pin4, [8:0] led, [6:0] seg, [3:0] an,
//                    input sw, sw4, sw5, sw6, 
//                    output cs, sdin, sclk, d_cn, resn, vccen, pmoden,
//                    output cs1, sdin1, sclk1, d_cn1, resn1, vccen1, pmoden1,
//                    inout PS2Clk,PS2Data);
                    
    wire [8:0] led_wire;
    wire [7:0] seg_wire;
    wire [3:0] an_wire;
    wire debounce_middleClk;
    wire debounce_btnc;
    wire debounce_clk;
    
    ThousandHz mouseClk (clock,debounce_clk); 

    debouncer(middleClick, debounce_clk, debounce_middleClk);
    debouncer(btnC, debounce_clk, debounce_btnc);
    AudioOutModule aud_out_indv (clock, sw[1], debounce_btnc, audio_out);
    AudioInModule aud_in_indv (clock, MIC_in, led_wire, seg_wire, an_wire);
    OledDigitsModule oled_dig_indv (clock,,pixel_index,sw[0], sw[4], sw[5], sw[6],oled_data);
    mouse_disp_indv(clock,pixel_index1, x_input, y_input, debounce_middleClk, oled_data1);
    
    assign led = led_wire;
    assign seg = seg_wire;
    assign an = an_wire;
    
endmodule
