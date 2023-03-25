`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
//
//  FILL IN THE FOLLOWING INFORMATION:
//  STUDENT A NAME: 
//  STUDENT B NAME:
//  STUDENT C NAME: 
//  STUDENT D NAME:  
//
//////////////////////////////////////////////////////////////////////////////////

//                    output cs1, sdin1, sclk1, d_cn1, resn1, vccen1, pmoden1,

module Top_Student (input clock, sw0, btnC, output D1, D2, CLK_OUT, nSync,
                    input J_MIC_Pin3, output J_MIC_Pin1, J_MIC_Pin4, [8:0] led, [6:0] seg, [3:0] an,
                    input reset, sw, sw4, sw5, sw6, 
                    output cs, sdin, sclk, d_cn, resn, vccen, pmoden,
                    output cs1, sdin1, sclk1, d_cn1, resn1, vccen1, pmoden1,
                    inout PS2Clk,PS2Data);
                    
    wire [8:0] led_wire;
    wire [6:0] seg_wire;
    wire [3:0] an_wire;
                    
    AudioOutModule aud_out_indv (clock, sw0, btnC, D1, D2, CLK_OUT, nSync);
    AudioInModule aud_in_indv (clock, J_MIC_Pin3, J_MIC_Pin1, J_MIC_Pin4, led_wire, seg_wire, an_wire);
    OledDigitsModule oled_dig_indv (clock, reset, sw, sw4, sw5, sw6, cs, sdin, sclk, d_cn, resn, vccen, pmoden);
    mouse_disp_indv(clock, cs1, sdin1, sclk1, d_cn1, resn1, vccen1, pmoden1, PS2Clk, PS2Data);
    
    assign led = led_wire;
    assign seg = seg_wire;
    assign an = an_wire;
    
endmodule