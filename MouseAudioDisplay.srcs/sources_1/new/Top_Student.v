`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
//
//  FILL IN THE FOLLOWING INFORMATION:
//  STUDENT A NAME: KISHORE S/O ASOKAN
//  STUDENT B NAME: KOH CHEE HENG
//  STUDENT C NAME: MATHEW LIU ZHEN JIE
//  STUDENT D NAME: EUGENE ANG JIA SHING
//
//////////////////////////////////////////////////////////////////////////////////


module Top_Student (
        input CLOCK, [15:0] sw, 
        input btnC, btnU, btnD, btnL, btnR, J_MIC_Pin3,
        output cs, sdin, sclk, d_cn, resn, vccen, pmoden,reg [15:0] led,
        output cs1, sdin1, sclk1, d_cn1, resn1, vccen1, pmoden1,
        output D1, D2, CLK_OUT, nSync, reg [7:0] seg, reg [3:0] an, 
        output J_MIC_Pin1, J_MIC_Pin4,
        inout PS2Clk,PS2Data
    );
    
    // Audio Wires/Regs
    wire [11:0] MIC_in;
    reg [11:0] audio_out;
    wire NC;
    
    // Mouse Wires/Regs
    wire [11:0] x_input;
    wire [11:0] y_input;
    wire leftClick, middleClick, rightClick;
    
    // OLED Wires/Regs
    wire frame_begin, sending_pixels, sample_pixel;
    wire frame_begin1, sending_pixels1, sample_pixel1;
    wire [12:0] pixel_index;
    wire [12:0] pixel_index1;
    reg [15:0] oled_data;
    reg [15:0] oled_data1;
    
    // Clock Declarations
    wire clk20k, clk50M, oledClk, clk1k;
    clk clock_20kHz (CLOCK, 20000, clk20k);
    clk clock_50MHz (CLOCK, 50000000, clk50M);
    clk clock_oled666 (CLOCK, 6666666, oledClk);
    clk clock_1kHz (CLOCK, 1000, clk1k);
    
    // Buttons
    wire btnCdb, btnDdb;
    debouncer_button dbM_btnC (btnC, clk1k, btnCdb);
    
    // Menu Items
    reg [3:0] menu_state = 0;
    reg [15:0] menu0 [0:6143];
    reg [15:0] menu1 [0:6143];
    reg [15:0] menu2 [0:6143];
    reg [15:0] menu3 [0:6143];
    reg [15:0] menu4 [0:6143];
    reg [15:0] menu5 [0:6143];
    reg [15:0] lockscreen [0:6143];
    reg [15:0] unlock0 [0:6143];
    reg [15:0] unlock1 [0:6143];
    reg [15:0] unlock2 [0:6143];
    
    initial begin
        $readmemh("menu0.mem",menu0);
        $readmemh("menu1.mem",menu1);
        $readmemh("menu2.mem",menu2);
        $readmemh("menu3.mem",menu3);
        $readmemh("menu4.mem",menu4);
        $readmemh("menu5.mem",menu5);
        $readmemh("lockscreen.mem",lockscreen);
        $readmemh("unlock0.mem",unlock0);
        $readmemh("unlock1.mem",unlock1);
        $readmemh("unlock2.mem",unlock2);
        menu_state <= 0;
    end
    
    // Feature Module Declarations
    Audio_Output aud (.CLK(clk50M), .START(clk20k), .DATA1(audio_out), .DATA2(NC), .RST(1'b0), .D1(D1), .D2(D2), .CLK_OUT(CLK_OUT), .nSync(nSync), .DONE(NC));
    Audio_Input my_audio_unit(CLOCK, clk20k, J_MIC_Pin3, J_MIC_Pin1, J_MIC_Pin4, MIC_in);
    MouseCtl Mouse (CLOCK,, x_input, y_input,, leftClick, middleClick, rightClick,,,,,,, PS2Clk, PS2Data);
    Oled_Display od0 (oledClk,, frame_begin, sending_pixels, sample_pixel, pixel_index, oled_data, cs, sdin, sclk, d_cn, resn, vccen, pmoden);
    Oled_Display od1 (oledClk,, frame_begin1, sending_pixels1, sample_pixel1, pixel_index1, oled_data1, cs1, sdin1, sclk1, d_cn1, resn1, vccen1, pmoden1);


    // Task Output Modules
    
    wire [15:0] indv_oled;
    wire [15:0] indv_oled1;
    wire [3:0] indv_an;
    wire [8:0] indv_led;
    wire [7:0] indv_seg;
    wire [11:0] indv_audio;
    IndividualTasks indv (CLOCK, sw, middleClick, btnC, indv_audio, MIC_in, pixel_index, indv_oled, pixel_index1, indv_oled1, x_input, y_input, indv_led, indv_seg, indv_an);
    
    wire [15:0] team_oled;
    wire team_led15;
    wire [7:0] team_seg;
    wire [3:0] team_an;
    wire [11:0] team_audio;
    TeamTask team (CLOCK, pixel_index, x_input, y_input, leftClick, rightClick, sw[15],sw[1], team_led15, team_oled, team_seg, team_an, team_audio, indv_an, indv_seg);
    
    // Euegene Module
    wire [3:0] an_cart;
    wire [6:0] seg_cart;
    wire [15:0] cart_oled_data;
    
    
    CartMaster cartMaster(.clock(CLOCK),.an(an_cart),.seg(seg_cart),.sw0(sw[0]),.btnC(btnC),.btnL(btnL),.btnR(btnR),.btnU(btnU),.btnD(btnD),
        .pixel_index(pixel_index),.oled_data(cart_oled_data),.flag(menu_state));   
    
    // Matthew Module
    wire [15:0] paint_oled_data;
    VHpaint(CLOCK, oledClk, x_input, y_input, leftClick, pixel_index, menu_state, paint_oled_data); 
    
    // CheeHeng Module
    wire [6:0] seg_lenz;
    wire [3:0] an_lenz;
    wire [7:0] led_lenz;
    wire [15:0] oled_lenz;
    wire bc, bu, bd, bl, br;
    debouncer_button db_btnC (btnC, oledClk, bc);
    debouncer_button db_btnU (btnU, oledClk, bu);
    debouncer_button db_btnD (btnD, oledClk, bd);
    debouncer_button db_btnR (btnR, oledClk, br);
    debouncer_button db_btnL (btnL, oledClk, bl);
    Lenzes (CLOCK, menu_state, sw[14], sw[7:0], bc, bu, bd, bl, br, pixel_index, x_input, y_input, leftClick, seg_lenz, an_lenz, led_lenz, oled_lenz);
    
    // Kishore Module
    wire [7:0] seg_kishore;
    wire [3:0] an_kishore;
    wire [8:0] led_kishore;
    wire [15:0] oled_data_kishore;
    view_wvfrm d(CLOCK, MIC_in, led_kishore, seg_kishore, an_kishore, sw[0], sw[1], sw[2], sw[3], sw[4], sw[5], sw[6], pixel_index, oled_data_kishore);
    
    // Clap Locker Module
    wire [3:0] claps;
    reg [1:0] locked = 2; // 2 for locked. 1 for unlocking and 0 for unlocked
    ClapCounter clapper (CLOCK, MIC_in, btnCdb, claps);
    
    // Unlocking Module
    wire un0, un1, un2;
    reg [31:0] unlock_counter = 0;
    reg [1:0] unlock_stage = 0;
    clk unc0 (CLOCK, 2000, un0);
    clk unc1 (CLOCK, 900, un1);
    clk unc2 (CLOCK, 1600, un2);
    
    // Operations
    always @ (posedge btnCdb) begin
        menu_state <= locked ? 0 : sw[14] ? menu_state : menu_state == 5 ? 0 : menu_state + 1;
    end
    
    always @ (posedge CLOCK) begin
        if (locked == 2) begin
            oled_data1 <= 0;
            oled_data <= lockscreen[pixel_index];
            led[15] <= 0;
            led[14:0] <= claps > 1 ? (1 << (claps - 1)) : claps;
            an <= 4'b1111;
            if (btnCdb) begin
                if (claps == 5 || sw[8] == 1) begin
                    locked <= 1; // unlock here
                end else
                    led[15] <= 1;
            end
        end else if (locked == 1) begin
            if (unlock_stage == 0) begin
                oled_data <= unlock0[pixel_index];
                audio_out <= un0 ? 12'h800 : 0;
                unlock_counter <= unlock_counter == 69999999 ? 0 : unlock_counter + 1;
                unlock_stage <= unlock_counter == 69999999 ? 1 : 0;
            end else if (unlock_stage == 1) begin
                oled_data <= unlock1[pixel_index];
                audio_out <= un1 ? 12'h800 : 0;
                unlock_counter <= unlock_counter == 99999999 ? 0 : unlock_counter + 1;
                unlock_stage <= unlock_counter == 99999999 ? 2 : 1;
            end else begin
                oled_data <= unlock2[pixel_index];
                audio_out <= un2 ? 12'h800 : 0;
                unlock_counter <= unlock_counter == 89999999 ? 0 : unlock_counter + 1;
                locked <= unlock_counter == 89999999 ? 0 : 1;
            end
        end else begin
            if (sw[14] == 0) begin
                oled_data1 <= 0;
                led <= 0;
                an <= 4'b1111;
                case (menu_state)
                    0: begin
                        oled_data <= menu0[pixel_index];
                    end
                    1: begin
                        oled_data <= menu1[pixel_index];
                    end
                    2: begin
                        oled_data <= menu2[pixel_index];
                    end
                    3: begin
                        oled_data <= menu3[pixel_index];
                    end
                    4: begin
                        oled_data <= menu4[pixel_index];
                    end
                    5: begin
                        oled_data <= menu5[pixel_index];
                    end
                    default: begin
                        oled_data <= 16'hF000;
                    end
                endcase
            end else begin
                case (menu_state)
                    0: begin
                        oled_data = indv_oled;
                        oled_data1 = indv_oled1;
                        an = indv_an;
                        seg = indv_seg;
                        audio_out = indv_audio;
                        led = indv_led;
                    end //indv
                    1: begin
                        oled_data1 = 0;
                        oled_data = team_oled;
                        an = team_an;
                        seg = team_seg;
                        audio_out = team_audio;
                        led[15] = team_led15;
                        led[14:0] = indv_led;
                    end //team
                    2: begin
                        an = an_cart;
                        seg = seg_cart;
                        oled_data = cart_oled_data;                                 
                        oled_data1 = 0;
                    end //eugene
                    3: begin
                        oled_data = paint_oled_data;
                        oled_data1 = 0;
                    end // matthew
                    4: begin
                        oled_data1 = 0;
                        oled_data = oled_lenz;
                        seg = seg_lenz;
                        an = an_lenz;
                        led = led_lenz;
                    end // cheeheng
                    5: begin
                        oled_data1 = 0;
                        oled_data = oled_data_kishore;
                        seg = seg_kishore;
                        an = an_kishore;
                        led = led_kishore;
                    end //kishore
                    default: begin
                        oled_data1 = 0;
                    end //default
                endcase
            end
        end
    end
    
    
endmodule