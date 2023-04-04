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


module Lenzes (input CLOCK, [4:0] menu_state, input sw14, [7:0]sw, input bc, input bu, input bd, input bl, input br,
                    input [12:0] pixel_index, [11:0] x_input, [11:0] y_input, input leftClick,
                    output [6:0]seg, [3:0]an, [7:0] led, reg [15:0] oled_data);
    
    wire oled_clk;
    wire [6:0] seg_ers;
    wire [3:0] an_ers;
    wire [6:0] seg_red;
    wire [3:0] an_red;
    wire [6:0] seg_green;
    wire [3:0] an_green;
    wire [6:0] seg_blue;
    wire [3:0] an_blue;
    wire [6:0] seg_blur;
    wire [3:0] an_blur;
    wire [6:0] seg_zoom;
    wire [3:0] an_zoom;
    wire [6:0] seg_grey;
    wire [3:0] an_grey;
    wire [6:0] seg_outl;
    wire [3:0] an_outl;
    
    wire [15:0] oled;
    wire [15:0] blur;
    wire [15:0] zoom;
    wire [15:0] grey;
    wire [15:0] outl;
    
    reg [3:0] rand = 4'b001;
    wire [15:0] menu_screen;
    reg [6:0] segment_display;
    reg [3:0] anode_display;
    
    wire [6:0] x;
    wire [6:0] y;
    wire [6:0] mx;
    wire [5:0] my;
    wire [6:0] xarr;
    wire [6:0] yarr;
    reg [1:0] pen = 2'b00;
    
    wire [1:0] ind [23:0];
    reg [1:0] mem [23:0][15:0];
    
    reg [2:0] zoom_amt = 1;
    reg [5:0] x_offset = 0;
    reg [4:0] y_offset = 0;
    wire [6:0] xzoom;
    wire [6:0] yzoom;
    wire seg_clk, led_clk;

    clk oled_clock (CLOCK, 6666666, oled_clk);
    clk segment_clock (CLOCK, 20000, seg_clk);
    clk led_clock (CLOCK, 2, led_clk);
    
    BlurringModule img_blur (CLOCK, ind[0], ind[1], ind[2], ind[3], ind[4],
                            ind[5], ind[6], ind[7], ind[8], ind[9],
                            ind[10], ind[11], ind[12], ind[13],
                            ind[14], ind[15], ind[16], ind[17], ind[18],
                            ind[19], ind[20], ind[21], ind[22], ind[23], blur);
    OutlineFinder img_outline (CLOCK, ind[6], ind[7], ind[8], ind[11], ind[12], ind[15], ind[16], ind[17], outl);
    
    ErsMode7Seg (seg_clk, seg_ers, an_ers);
    RedMode7Seg (seg_clk, seg_red, an_red);
    GreenMode7Seg (seg_clk, seg_green, an_green);
    BlueMode7Seg (seg_clk, seg_blue, an_blue);
    BlurMode7Seg (seg_clk, seg_blur, an_blur);
    GreyMode7Seg (seg_clk, seg_grey, an_grey);
    ZoomMode7Seg (seg_clk, zoom_amt, seg_zoom, an_zoom);
    OutlMode7Seg (seg_clk, seg_outl, an_outl);
    
    assign an = sw[7] ? an_outl : sw[6] ? an_grey : sw[5] ? an_zoom : sw[4] ? an_blur : sw[3] ? an_red : sw[2] ? an_green : sw[1] ? an_blue : sw[0] ? an_ers : 4'b1111;
    assign seg = sw[7] ? seg_outl : sw[6] ? seg_grey : sw[5] ? seg_zoom : sw[4] ? seg_blur : sw[3] ? seg_red : sw[2] ? seg_green : sw[1] ? seg_blue : sw[0] ? seg_ers : 7'b1111111;
    assign led[7] = sw[7] ? led_clk : 1;
    assign led[6] = (sw[7] == 0 && sw[6]) ? led_clk : 1;
    assign led[5] = (sw[7:6] == 0 && sw[5]) ? led_clk : 1;
    assign led[4] = (sw[7:5] == 0 && sw[4]) ? led_clk : 1;
    assign led[3] = (sw[7:4] == 0 && sw[3]) ? led_clk : 1;
    assign led[2] = (sw[7:3] == 0 && sw[2]) ? led_clk : 1;
    assign led[1] = (sw[7:2] == 0 && sw[1]) ? led_clk : 1;
    assign led[0] = (sw[7:1] == 0 && sw[0]) ? led_clk : 1;
    
    assign x = pixel_index % 96;
    assign y = pixel_index / 96;
    assign mx = x_input / 10;
    assign my = y_input / 10;
    assign xarr = x / 4;
    assign yarr = y / 4;
    
    assign ind[0] = (x < 2 || y < 2) ? 0 : mem[(x - 2)/4][(y - 2)/4];
    assign ind[1] = (x < 1 || y < 2) ? 0 : mem[(x - 1)/4][(y - 2)/4];
    assign ind[2] = (y < 2) ? 0 : mem[(x)/4][(y - 2)/4];
    assign ind[3] = (x > 94 || y < 2) ? 0 : mem[(x + 1)/4][(y - 2)/4];
    assign ind[4] = (x > 93 ||y < 2) ? 0 :mem[(x + 2)/4][(y - 2)/4];
    
    assign ind[5] = (x < 2 || x > 93 || y < 1) ? 0 : mem[(x - 2)/4][(y - 1)/4];
    assign ind[6] = (x < 1 || x > 93 || y < 1) ? 0 : mem[(x - 1)/4][(y - 1)/4];
    assign ind[7] = (y < 1) ? 0 : mem[(x)/4][(y - 1)/4];
    assign ind[8] = (x > 94 || x > 93 || y < 1) ? 0 :mem[(x + 1)/4][(y - 1)/4];
    assign ind[9] = (x > 93 || x > 93 || y < 1) ? 0 : mem[(x + 2)/4][(y - 1)/4];
    
    assign ind[10] = (x < 2) ? 0 : mem[(x - 2)/4][(y)/4];
    assign ind[11] = (x < 1) ? 0 : mem[(x - 1)/4][(y)/4];
    assign ind[12] = (x > 94) ? 0 : mem[(x + 1)/4][(y)/4];
    assign ind[13] = (x > 93) ? 0 : mem[(x + 2)/4][(y)/4];
    
    assign ind[14] = (x < 2 || y > 62) ? 0 : mem[(x - 2)/4][(y + 1)/4];
    assign ind[15] = (x < 1 || y > 62) ? 0 : mem[(x - 1)/4][(y + 1)/4];
    assign ind[16] = (y > 62) ? 0 : mem[(x)/4][(y + 1)/4];
    assign ind[17] = (x > 94 || y > 62) ? 0 : mem[(x + 1)/4][(y + 1)/4];
    assign ind[18] = (x > 93 || y > 62) ? 0 : mem[(x + 2)/4][(y + 1)/4];
    
    assign ind[19] = (x < 2 || y > 61) ? 0 : mem[(x - 2)/4][(y + 2)/4];
    assign ind[20] = (x < 1 || y > 61) ? 0 : mem[(x - 1)/4][(y + 2)/4];
    assign ind[21] = (y < 2 || y > 61) ? 0 : mem[(x)/4][(y + 2)/4];
    assign ind[22] = (x > 94|| y > 61) ? 0 : mem[(x + 1)/4][(y + 2)/4];
    assign ind[23] = (x >93 || y > 61) ? 0 : mem[(x + 2)/4][(y + 2)/4];
    
    assign oled = (xarr == (mx / 4) && yarr == (my / 4) && sw[3:0] > 0 && sw[7] == 0) ? 16'h0000 :
                  mem[xarr][yarr] == 2'b00 ? 16'hFFFF : 
                  mem[xarr][yarr] == 2'b01 ? 16'b1111100000000000 :
                  mem[xarr][yarr] == 2'b10 ? 16'b0000011111100000 :
                  mem[xarr][yarr] == 2'b11 ? 16'b0000000000011111 : 16'hFFFF;
    
    assign xzoom = (x / (4 * zoom_amt)) + x_offset;
    assign yzoom = (y / (4 * zoom_amt)) + y_offset;
    assign zoom = mem[xzoom][yzoom] == 2'b00 ? 16'hFFFF : 
                  mem[xzoom][yzoom] == 2'b01 ? 16'b1111100000000000 :
                  mem[xzoom][yzoom] == 2'b10 ? 16'b0000011111100000 :
                  mem[xzoom][yzoom] == 2'b11 ? 16'b0000000000011111 : 16'hFFFF;
    
    assign grey =  mem[xarr][yarr] == 2'b00 ? 16'hFFFF : 
                   mem[xarr][yarr] == 2'b01 ? 16'b0010000100000100 :
                   mem[xarr][yarr] == 2'b10 ? 16'b0111001110001110 :
                   mem[xarr][yarr] == 2'b11 ? 16'b1010010100010100 : 16'hFFFF;
    
    always @ (posedge oled_clk) begin
        pen = sw[3] ? 2'b01 : sw[2] ? 2'b10 : sw[1] ? 2'b11 : 2'b00;
        if (menu_state == 4 && sw14) begin
            if (leftClick && xarr == (mx / 4) && yarr == (my / 4) && sw[7:4] == 0 && sw[3:0] > 0) begin
                mem[xarr][yarr] <= pen;
            end else begin   
                mem[xarr][yarr] <= mem[xarr][yarr] == 2'b01 ? 2'b01 :
                                   mem[xarr][yarr] == 2'b10 ? 2'b10 :
                                   mem[xarr][yarr] == 2'b11 ? 2'b11 : 2'b00;
            end
            
            if (bc) begin
                zoom_amt = zoom_amt == 1 ? 2 : zoom_amt == 2 ? 4 : 1;
                x_offset = zoom_amt == 1 ? 0 : x_offset;
                y_offset = zoom_amt == 1 ? 0 : y_offset;
            end else if (bl) begin
                if (zoom_amt == 1) begin
                    x_offset = 0;
                end else begin
                    x_offset = x_offset == 0 ? 0 : x_offset - 1;
                end
            end
            else if (br) begin
                if (zoom_amt == 1) begin
                    x_offset = 0;
                end else begin
                    x_offset = zoom_amt == 2 ? (x_offset == 12 ? 12 : x_offset + 1) : (x_offset == 18 ? 18 : x_offset + 1);
                end
            end
            else if (bu) begin
                if (zoom_amt == 1) begin
                    y_offset = 0;
                end else begin
                    y_offset = y_offset == 0 ? 0 : y_offset - 1;
                end
            end
            else if (bd) begin
                if (zoom_amt == 1) begin
                    y_offset = 0;
                end else begin
                    y_offset = zoom_amt == 2 ? (y_offset == 8 ? 8 : y_offset + 1) : (y_offset == 12 ? 12 : y_offset + 1);
                end
            end
        end else begin
            zoom_amt <= 1;
            x_offset <= 0;
            y_offset <= 0;
            mem[xarr][yarr] <= mem[xarr][yarr] == 2'b01 ? 2'b01 :
                               mem[xarr][yarr] == 2'b10 ? 2'b10 :
                               mem[xarr][yarr] == 2'b11 ? 2'b11 : 2'b00;
        end
        
        oled_data <= sw[7] ? (outl == 16'hFFF ? oled : outl) : sw[6] ? grey : sw[5] ? zoom : sw[4] ? blur : oled;
    end
endmodule
