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


module mouse_disp_indv (
    // Delete this comment and include Basys3 inputs and outputs here
    input clock,
    input [12:0] pixel_index,
    output reg [15:0] oled_data,
    inout PS2Clk,PS2Data
    );
    /*
        OLED is 96 wide x 64 tall. 
        rightmost pixel on row 1 is 95.
        Total pixel count is 6143.
        x-coord = ... % 96;
        y-coord = ... / 64;
        
    */
    initial begin
        oled_data <= 16'hFFFF;
    end
    wire [6:0] x_val;
    wire [6:0] y_val;
    wire [11:0] x_input;
    wire [11:0] y_input;
    wire [6:0] conv_x;
    wire [5:0] conv_y;
    wire oled_clock_out;
    SixTwoFive_CLOCK Oled_clock (clock, oled_clock_out);
    MouseCtl Mouse (clock,,x_input,y_input,,,,,,,,,,,PS2Clk, PS2Data);
    
    
    
    
    convertXY xy_conv(pixel_index, x_val, y_val);
    assign conv_x = x_input/10;
    assign conv_y = y_input/10;
    always @(posedge oled_clock_out) begin
        if (((x_val >= (conv_x - 1)) && (x_val <= (conv_x + 1)))  && ((y_val >= (conv_y-1)) && (y_val <= (conv_y + 1)))) begin
            oled_data <= 16'h0;
        end
        oled_data = 16'hFFFF;
    end
    
endmodule