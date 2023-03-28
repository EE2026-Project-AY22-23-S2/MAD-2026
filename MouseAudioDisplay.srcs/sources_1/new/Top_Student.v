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
                    output reg cs, sdin, sclk, d_cn, resn, vccen, pmoden,
                    output reg cs1, sdin1, sclk1, d_cn1, resn1, vccen1, pmoden1,
                    inout PS2Clk,PS2Data);
                    
    reg [8:0] led_wire;
    reg [6:0] seg_wire;
    reg [3:0] an_wire;
    wire [3:0] state;
    wire [6:0] seg_wire_indv;
    wire [4:0] an_wire_indv;
    wire [8:0] led_wire_indv;
    
    wire [6:0] seg_cart;
    wire [3:0] an_cart;
    wire cs_cart,sdin_cart,sclk_cart,d_cn_cart,resn_cart,vccen_cart,pmoden_cart;
    wire cs_oled,sdin_oled,sclk_oled,d_cn_oled,resn_oled,vccen_oled,pmoden_oled;
    wire cs_mouse,sdin_mouse,sclk_mouse,d_cn_mouse,resn_mouse,vccen_mouse,pmoden_mouse;
    wire cs_menu,sdin_menu,sclk_menu,d_cn_menu,resn_menu,vccen_menu,pmoden_menu;
    menu_display menu (clock,btnC,cs_menu, sdin_menu, sclk_menu, d_cn_menu, resn_menu, vccen_menu, pmoden_menu ,state);                    
    AudioOutModule aud_out_indv (clock, sw0, btnC, D1, D2, CLK_OUT, nSync);
    AudioInModule aud_in_indv (clock, J_MIC_Pin3, J_MIC_Pin1, J_MIC_Pin4, led_wire_indv, seg_wire_indv, an_wire_indv);
    OledDigitsModule oled_dig_indv (clock, btnC, sw, sw4, sw5, sw6, cs_oled, sdin_oled, sclk_oled, d_cn_oled, resn_oled, vccen_oled, pmoden_oled);
    mouse_disp_indv(clock, cs_mouse, sdin_mouse, sclk_mouse, d_cn_mouse, resn_mouse, vccen_mouse, pmoden_mouse, PS2Clk, PS2Data);
    CartMaster cartMaster(.clock(clock),.an(an_cart),.seg(seg_cart),.sw0(sw0),.btnC(btnC),.btnL(btnL),.btnR(btnR),.btnU(btnU),.btnD(btnD),
     .cs(cs_cart),.sdin(sdin_cart),.sclk(sclk_cart),.d_cn(d_cn_cart),.resn(resn_cart),.vccen(vccen_cart),.pmoden(pmoden_cart),.flag(state));   
    
    assign led = led_wire;
    assign seg = seg_wire;
    assign an = an_wire;
    always @(posedge clock) begin
        if (state == 1 && sw14) begin
            seg_wire <= 7'b1111111;
            an_wire <= 4'b1111;
            cs <= cs_mouse;
            sdin <= sdin_mouse;
            sclk <= sclk_mouse;
            d_cn <= d_cn_mouse;
            resn <= resn_mouse;
            vccen <= vccen_mouse;
            pmoden <= pmoden_mouse;
            led_wire <= led_wire_indv;
       
        end
        if (state == 2 && sw14) begin
            seg_wire <= 7'b1111111;
            an_wire <= 4'b1111;
            cs <= cs_oled;
            sdin <= sdin_oled;
            sclk <= sclk_oled;
            d_cn <= d_cn_oled;
            resn <= resn_oled;
            vccen <= vccen_oled;
            pmoden <= pmoden_oled;
            led_wire <= led_wire_indv;
       
        end
        else if(state == 3 && sw14) begin
            seg_wire <= seg_cart;
            an_wire <= an_cart;
            cs <= cs_cart;
            sdin <= sdin_cart;
            sclk <= sclk_cart;
            d_cn <= d_cn_cart;
            resn <= resn_cart;
            vccen <= vccen_cart;
            pmoden <= pmoden_cart;
        end
            
            
    end
    
endmodule