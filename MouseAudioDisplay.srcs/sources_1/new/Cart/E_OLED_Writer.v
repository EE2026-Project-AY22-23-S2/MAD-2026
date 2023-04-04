`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.03.2023 17:07:07
// Design Name: 
// Module Name: displayOLED
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


module displayOLED(
    input CLOCK,
    input [12:0] pixel_index,
    input [6:0] block_pos_x,
    input signed [7:0] block_pos_y,
    output reg [15:0] oled_data,
    input [6:0] car_x,
    input [6:0] car_y,
    input [6:0] coin_x,
    input [6:0] coin_y
    );
    wire signed [7:0] x; //from 0 to 95
    wire signed [6:0] y;   
    
    assign x = pixel_index%96;
    assign y = pixel_index/96;
    reg signed [7:0] second_y;
    reg signed [8:0] repeat_y;  

    always @(CLOCK) begin
        second_y = block_pos_y + 44;  //space between blocks = 44-16    
        if (( (x > 7 && x < 14) || (x > 82 && x < 89) )) begin //for the white road markings
            if (block_pos_y > 26) begin
                repeat_y = block_pos_y - 42; //sets starting point
                if(y > repeat_y && y < repeat_y + 16) begin
                    oled_data <= 16'b1111111111111111;
                end
                else begin
                    if ((y > block_pos_y && y < block_pos_y + 16) || (y > second_y && y < second_y + 16)) begin
                        oled_data <= 16'b1111111111111111;                
                    end
                    else begin
                        oled_data <= 16'h39e7;
                    end
                end
            end 
            else begin
                if ((y > block_pos_y && y < block_pos_y + 16) || (y > second_y && y < second_y + 16)) begin
                    oled_data <= 16'b1111111111111111;                
                end
                else begin
                    oled_data <= 16'h39e7;
                end 
            end
        end
        else if ((x >= car_x && x <= car_x+10) && (y >= car_y && y <= car_y + 10)) begin //car
            oled_data <= 16'hF800;
            if((( x >= car_x && x < car_x + 2) || (x > car_x + 8 && x <= car_x+10)) && ((y >= car_y + 1 && y <= car_y + 2) || (y >= car_y + 7 && y <= car_y + 8))) begin
                oled_data <= 16'h0000;
            end
            else if (( x >= car_x + 4 && x <= car_x + 6) && (y == car_y + 1 || y == car_y + 2)) begin
                oled_data <= 16'b00000000000011111;              
            end else begin
                oled_data <= 16'hF800;
            end
        end
        else if ((x >= 5 && x <= 7) || (x >= 89 && x <= 91)) begin //yellow road
            oled_data <= 16'hFFE0;
        end                  
        else if (x < 5 || x > 91) begin //grass
            oled_data <= 16'h07E0;
        end
        else if ((x >= coin_x && x <= coin_x + 5) && (y >= coin_y && y <= coin_y + 5)) begin //coins
            oled_data <= 16'hfea0; //gold
        end
        else begin                      
            oled_data <= 16'h39e7; //grey
        end     
    end
  
endmodule
