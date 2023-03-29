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
                    input sw, sw4, sw5, sw6, sw14, 
                    input btnL,btnR,btnD,btnU,
                    output cs, sdin, sclk, d_cn, resn, vccen, pmoden,
                    output cs1, sdin1, sclk1, d_cn1, resn1, vccen1, pmoden1,
                    inout PS2Clk,PS2Data);
                    
    reg [8:0] led_wire;
    reg [6:0] seg_wire;
    reg [3:0] an_wire;
    wire [3:0] state;
    wire [6:0] seg_wire_indv;
    wire [4:0] an_wire_indv;
    wire [8:0] led_wire_indv;
    wire oled_clock_out;
    wire frame_begin;
    wire sending_pixels;
    wire sample_pixel;
    wire [12:0] pixel_index;
    reg [15:0] oled_data;
    
    wire [6:0] seg_cart;
    wire [3:0] an_cart;
    wire [15:0] menu_oled_data;
    wire [15:0] cart_oled_data;
    wire [15:0] digits_oled_data;
    wire [15:0] mouse_oled_data;

    SixTwoFive_CLOCK Oled_clock (clock, oled_clock_out);
    Oled_Display OLED (oled_clock_out, ,frame_begin, sending_pixels, sample_pixel , pixel_index , oled_data, cs, sdin, sclk, d_cn, resn, vccen, pmoden);
    
    menu_display menu (clock,btnC,pixel_index,menu_oled_data,state);                    
    AudioOutModule aud_out_indv (clock, sw0, btnC, D1, D2, CLK_OUT, nSync);
    AudioInModule aud_in_indv (clock, J_MIC_Pin3, J_MIC_Pin1, J_MIC_Pin4, led_wire_indv, seg_wire_indv, an_wire_indv);
    OledDigitsModule oled_dig_indv (clock, btnC, sw, sw4, sw5, sw6, pixel_index,digits_oled_data);
    mouse_disp_indv(clock, pixel_index,mouse_oled_data, PS2Clk, PS2Data);
    CartMaster cartMaster(.clock(clock),.an(an_cart),.seg(seg_cart),.sw0(sw0),.btnC(btnC),.btnL(btnL),.btnR(btnR),.btnU(btnU),.btnD(btnD),
    .pixel_index(pixel_index),.oled_data(cart_oled_data),.flag(state));   
    
    assign led = led_wire;
    assign seg = seg_wire;
    assign an = an_wire;
    always @(posedge clock) begin
        if (!sw14) begin
            oled_data <= menu_oled_data;
        end
        else if (state == 1 && sw14) begin
            seg_wire <= 7'b1111111;
            an_wire <= 4'b1111;
            oled_data <= digits_oled_data;
            led_wire <= led_wire_indv;
       
        end
        else if (state == 2 && sw14) begin
            seg_wire <= 7'b1111111;
            an_wire <= 4'b1111;
            oled_data <= cart_oled_data;
            led_wire <= led_wire_indv;
       
        end
        else if(state == 3 && sw14) begin
            seg_wire <= seg_cart;
            an_wire <= an_cart;
            oled_data <= mouse_oled_data;
        end
            
            
    end
    
endmodule