`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.03.2023 00:30:25
// Design Name: 
// Module Name: oled_bar
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


module oled_bar(input CLOCK,
                input [12:0] pixel_index,
                output reg [15:0] oled_data,
                input [5:0] y9, y8, y7, y6, y5, y4, y3, y2, y1, y0,
                input sw0, sw1, sw2, sw3, sw4, sw5, sw6);
                
wire [6:0] x;
wire [5:0] y;
assign x = pixel_index%96;
assign y = pixel_index/96;

wire [4:0] inp;
assign inp = {sw6, sw5, sw4, sw3, sw2};


always @ (posedge CLOCK) begin
    if (sw0) begin //soft
    case(inp) 
        5'b00001: begin
            if ((x >= 4) && (x <= 10) && (y <= 64) && (y >= 64 - y9*6) &&  (y9 >= 3)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 4) && (x <= 10) && (y <= 64) && (y >= 64 - y9*6) &&  (y9 < 3)) begin
                oled_data <= 16'h07FF;
            end
            
            else if ((x >= 13) && (x <= 19) && (y <= 64) && (y >= 64 - y8*6) &&  (y8 >= 3)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 13) && (x <= 19) && (y <= 64) && (y >= 64 - y8*6) &&  (y8 < 3)) begin
                oled_data <= 16'h07FF;
            end
    
            else if ((x >= 22) && (x <= 28) && (y <= 64) && (y >= 64 - y7*6) &&  (y7 >= 3)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 22) && (x <= 28) && (y <= 64) && (y >= 64 - y7*6) &&  (y7 < 3)) begin
                oled_data <= 16'h07FF;
            end
    
            else if ((x >= 31) && (x <= 37) && (y <= 64) && (y >= 64 - y6*6) && (y6 >= 3)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 31) && (x <= 37) && (y <= 64) && (y >= 64 - y6*6) && (y6 < 3)) begin
                oled_data <= 16'h07FF;
            end
    
            else if ((x >= 40) && (x <= 46) && (y <= 64) && (y >= 64 - y5*6) && (y5 >= 3)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 40) && (x <= 46) && (y <= 64) && (y >= 64 - y5*6) && (y5 < 3)) begin
                oled_data <= 16'h07FF;
            end
            
            else if ((x >= 49) && (x <= 55) && (y <= 64) && (y >= 64 - y4*6) &&  (y4 >= 3)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 49) && (x <= 55) && (y <= 64) && (y >= 64 - y4*6) &&  (y4 < 3)) begin
                oled_data <= 16'h07FF;
            end
            
            else if ((x >= 58) && (x <= 64) && (y <= 64) && (y >= 64 - y3*6) &&  (y3 >= 3)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 58) && (x <= 64) && (y <= 64) && (y >= 64 - y3*6) &&  (y3 < 3)) begin
                oled_data <= 16'h07FF;
            end
            
            else if ((x >= 67) && (x <= 73) && (y <= 64) && (y >= 64 - y2*6) &&  (y2 >= 3)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 67) && (x <= 73) && (y <= 64) && (y >= 64 - y2*6) &&  (y2 < 3)) begin
                oled_data <= 16'h07FF;
            end
            
            else if ((x >= 76) && (x <= 82) && (y <= 64) && (y >= 64 - y1*6) && (y1 >= 3)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 76) && (x <= 82) && (y <= 64) && (y >= 64 - y1*6) && (y1 < 3)) begin
                oled_data <= 16'h07FF;
            end
     
            else if ((x >= 85) && (x <= 91) && (y <= 64) && (y >= 64 - y0*6) && (y0 >= 3)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 85) && (x <= 91) && (y <= 64) && (y >= 64 - y0*6) && (y0 < 3)) begin
                oled_data <= 16'h07E0;
            end
            
             else begin
                oled_data <= 16'h0000;
            end
        end
        
        
        5'b00010: begin
            if ((x >= 4) && (x <= 10) && (y <= 64) && (y >= 64 - y9*6) &&  (y9 >= 4)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 4) && (x <= 10) && (y <= 64) && (y >= 64 - y9*6) &&  (y9 < 4)) begin
                oled_data <= 16'h07FF;
            end
            
            else if ((x >= 13) && (x <= 19) && (y <= 64) && (y >= 64 - y8*6) &&  (y8 >= 4)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 13) && (x <= 19) && (y <= 64) && (y >= 64 - y8*6) &&  (y8 < 4)) begin
                oled_data <= 16'h07FF;
            end
        
            else if ((x >= 22) && (x <= 28) && (y <= 64) && (y >= 64 - y7*6) &&  (y7 >= 4)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 22) && (x <= 28) && (y <= 64) && (y >= 64 - y7*6) &&  (y7 < 4)) begin
                oled_data <= 16'h07FF;
            end
        
            else if ((x >= 31) && (x <= 37) && (y <= 64) && (y >= 64 - y6*6) && (y6 >= 4)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 31) && (x <= 37) && (y <= 64) && (y >= 64 - y6*6) && (y6 < 4)) begin
                oled_data <= 16'h07FF;
            end
        
            else if ((x >= 40) && (x <= 46) && (y <= 64) && (y >= 64 - y5*6) && (y5 >= 4)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 40) && (x <= 46) && (y <= 64) && (y >= 64 - y5*6) && (y5 < 4)) begin
                oled_data <= 16'h07FF;
            end
            
            else if ((x >= 49) && (x <= 55) && (y <= 64) && (y >= 64 - y4*6) &&  (y4 >= 4)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 49) && (x <= 55) && (y <= 64) && (y >= 64 - y4*6) &&  (y4 < 4)) begin
                oled_data <= 16'h07FF;
            end
            
            else if ((x >= 58) && (x <= 64) && (y <= 64) && (y >= 64 - y3*6) &&  (y3 >= 4)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 58) && (x <= 64) && (y <= 64) && (y >= 64 - y3*6) &&  (y3 < 4)) begin
                oled_data <= 16'h07FF;
            end
            
            else if ((x >= 67) && (x <= 73) && (y <= 64) && (y >= 64 - y2*6) &&  (y2 >= 4)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 67) && (x <= 73) && (y <= 64) && (y >= 64 - y2*6) &&  (y2 < 4)) begin
                oled_data <= 16'h07FF;
            end
            
            else if ((x >= 76) && (x <= 82) && (y <= 64) && (y >= 64 - y1*6) && (y1 >= 4)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 76) && (x <= 82) && (y <= 64) && (y >= 64 - y1*6) && (y1 < 4)) begin
                oled_data <= 16'h07FF;
            end
        
            else if ((x >= 85) && (x <= 91) && (y <= 64) && (y >= 64 - y0*6) && (y0 >= 4)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 85) && (x <= 91) && (y <= 64) && (y >= 64 - y0*6) && (y0 < 4)) begin
                oled_data <= 16'h07E0;
            end
            
             else begin
                oled_data <= 16'h0000;
            end
        end
        
        
        5'b00100: begin
            if ((x >= 4) && (x <= 10) && (y <= 64) && (y >= 64 - y9*6) &&  (y9 >= 5)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 4) && (x <= 10) && (y <= 64) && (y >= 64 - y9*6) &&  (y9 < 5)) begin
                oled_data <= 16'h07FF;
            end
            
            else if ((x >= 13) && (x <= 19) && (y <= 64) && (y >= 64 - y8*6) &&  (y8 >= 5)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 13) && (x <= 19) && (y <= 64) && (y >= 64 - y8*6) &&  (y8 < 5)) begin
                oled_data <= 16'h07FF;
            end
        
            else if ((x >= 22) && (x <= 28) && (y <= 64) && (y >= 64 - y7*6) &&  (y7 >= 5)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 22) && (x <= 28) && (y <= 64) && (y >= 64 - y7*6) &&  (y7 < 5)) begin
                oled_data <= 16'h07FF;
            end
        
            else if ((x >= 31) && (x <= 37) && (y <= 64) && (y >= 64 - y6*6) && (y6 >= 5)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 31) && (x <= 37) && (y <= 64) && (y >= 64 - y6*6) && (y6 < 5)) begin
                oled_data <= 16'h07FF;
            end
        
            else if ((x >= 40) && (x <= 46) && (y <= 64) && (y >= 64 - y5*6) && (y5 >= 5)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 40) && (x <= 46) && (y <= 64) && (y >= 64 - y5*6) && (y5 < 5)) begin
                oled_data <= 16'h07FF;
            end
            
            else if ((x >= 49) && (x <= 55) && (y <= 64) && (y >= 64 - y4*6) &&  (y4 >= 5)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 49) && (x <= 55) && (y <= 64) && (y >= 64 - y4*6) &&  (y4 < 5)) begin
                oled_data <= 16'h07FF;
            end
            
            else if ((x >= 58) && (x <= 64) && (y <= 64) && (y >= 64 - y3*6) &&  (y3 >= 5)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 58) && (x <= 64) && (y <= 64) && (y >= 64 - y3*6) &&  (y3 < 5)) begin
                oled_data <= 16'h07FF;
            end
            
            else if ((x >= 67) && (x <= 73) && (y <= 64) && (y >= 64 - y2*6) &&  (y2 >= 5)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 67) && (x <= 73) && (y <= 64) && (y >= 64 - y2*6) &&  (y2 < 5)) begin
                oled_data <= 16'h07FF;
            end
            
            else if ((x >= 76) && (x <= 82) && (y <= 64) && (y >= 64 - y1*6) && (y1 >= 5)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 76) && (x <= 82) && (y <= 64) && (y >= 64 - y1*6) && (y1 < 5)) begin
                oled_data <= 16'h07FF;
            end
        
            else if ((x >= 85) && (x <= 91) && (y <= 64) && (y >= 64 - y0*6) && (y0 >= 5)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 85) && (x <= 91) && (y <= 64) && (y >= 64 - y0*6) && (y0 < 5)) begin
                oled_data <= 16'h07E0;
            end
            
             else begin
                oled_data <= 16'h0000;
            end
        end
        
        5'b01000: begin
            if ((x >= 4) && (x <= 10) && (y <= 64) && (y >= 64 - y9*6) &&  (y9 >= 6)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 4) && (x <= 10) && (y <= 64) && (y >= 64 - y9*6) &&  (y9 < 6)) begin
                oled_data <= 16'h07FF;
            end
            
            else if ((x >= 13) && (x <= 19) && (y <= 64) && (y >= 64 - y8*6) &&  (y8 >= 6)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 13) && (x <= 19) && (y <= 64) && (y >= 64 - y8*6) &&  (y8 < 6)) begin
                oled_data <= 16'h07FF;
            end
        
            else if ((x >= 22) && (x <= 28) && (y <= 64) && (y >= 64 - y7*6) &&  (y7 >= 6)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 22) && (x <= 28) && (y <= 64) && (y >= 64 - y7*6) &&  (y7 < 6)) begin
                oled_data <= 16'h07FF;
            end
        
            else if ((x >= 31) && (x <= 37) && (y <= 64) && (y >= 64 - y6*6) && (y6 >= 6)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 31) && (x <= 37) && (y <= 64) && (y >= 64 - y6*6) && (y6 < 6)) begin
                oled_data <= 16'h07FF;
            end
        
            else if ((x >= 40) && (x <= 46) && (y <= 64) && (y >= 64 - y5*6) && (y5 >= 6)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 40) && (x <= 46) && (y <= 64) && (y >= 64 - y5*6) && (y5 < 6)) begin
                oled_data <= 16'h07FF;
            end
            
            else if ((x >= 49) && (x <= 55) && (y <= 64) && (y >= 64 - y4*6) &&  (y4 >= 6)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 49) && (x <= 55) && (y <= 64) && (y >= 64 - y4*6) &&  (y4 < 6)) begin
                oled_data <= 16'h07FF;
            end
            
            else if ((x >= 58) && (x <= 64) && (y <= 64) && (y >= 64 - y3*6) &&  (y3 >= 6)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 58) && (x <= 64) && (y <= 64) && (y >= 64 - y3*6) &&  (y3 < 6)) begin
                oled_data <= 16'h07FF;
            end
            
            else if ((x >= 67) && (x <= 73) && (y <= 64) && (y >= 64 - y2*6) &&  (y2 >= 6)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 67) && (x <= 73) && (y <= 64) && (y >= 64 - y2*6) &&  (y2 < 6)) begin
                oled_data <= 16'h07FF;
            end
            
            else if ((x >= 76) && (x <= 82) && (y <= 64) && (y >= 64 - y1*6) && (y1 >= 6)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 76) && (x <= 82) && (y <= 64) && (y >= 64 - y1*6) && (y1 < 6)) begin
                oled_data <= 16'h07FF;
            end
        
            else if ((x >= 85) && (x <= 91) && (y <= 64) && (y >= 64 - y0*6) && (y0 >= 6)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 85) && (x <= 91) && (y <= 64) && (y >= 64 - y0*6) && (y0 < 6)) begin
                oled_data <= 16'h07E0;
            end
            
             else begin
                oled_data <= 16'h0000;
            end
        end
        
        5'b10000: begin
            if ((x >= 4) && (x <= 10) && (y <= 64) && (y >= 64 - y9*6) &&  (y9 >= 7)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 4) && (x <= 10) && (y <= 64) && (y >= 64 - y9*6) &&  (y9 < 7)) begin
                oled_data <= 16'h07FF;
            end
            
            else if ((x >= 13) && (x <= 19) && (y <= 64) && (y >= 64 - y8*6) &&  (y8 >= 7)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 13) && (x <= 19) && (y <= 64) && (y >= 64 - y8*6) &&  (y8 < 7)) begin
                oled_data <= 16'h07FF;
            end
        
            else if ((x >= 22) && (x <= 28) && (y <= 64) && (y >= 64 - y7*6) &&  (y7 >= 7)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 22) && (x <= 28) && (y <= 64) && (y >= 64 - y7*6) &&  (y7 < 7)) begin
                oled_data <= 16'h07FF;
            end
        
            else if ((x >= 31) && (x <= 37) && (y <= 64) && (y >= 64 - y6*6) && (y6 >= 7)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 31) && (x <= 37) && (y <= 64) && (y >= 64 - y6*6) && (y6 < 7)) begin
                oled_data <= 16'h07FF;
            end
        
            else if ((x >= 40) && (x <= 46) && (y <= 64) && (y >= 64 - y5*6) && (y5 >= 7)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 40) && (x <= 46) && (y <= 64) && (y >= 64 - y5*6) && (y5 < 7)) begin
                oled_data <= 16'h07FF;
            end
            
            else if ((x >= 49) && (x <= 55) && (y <= 64) && (y >= 64 - y4*6) &&  (y4 >= 7)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 49) && (x <= 55) && (y <= 64) && (y >= 64 - y4*6) &&  (y4 < 7)) begin
                oled_data <= 16'h07FF;
            end
            
            else if ((x >= 58) && (x <= 64) && (y <= 64) && (y >= 64 - y3*6) &&  (y3 >= 7)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 58) && (x <= 64) && (y <= 64) && (y >= 64 - y3*6) &&  (y3 < 7)) begin
                oled_data <= 16'h07FF;
            end
            
            else if ((x >= 67) && (x <= 73) && (y <= 64) && (y >= 64 - y2*6) &&  (y2 >= 7)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 67) && (x <= 73) && (y <= 64) && (y >= 64 - y2*6) &&  (y2 < 7)) begin
                oled_data <= 16'h07FF;
            end
            
            else if ((x >= 76) && (x <= 82) && (y <= 64) && (y >= 64 - y1*6) && (y1 >= 7)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 76) && (x <= 82) && (y <= 64) && (y >= 64 - y1*6) && (y1 < 7)) begin
                oled_data <= 16'h07FF;
            end
        
            else if ((x >= 85) && (x <= 91) && (y <= 64) && (y >= 64 - y0*6) && (y0 >= 7)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 85) && (x <= 91) && (y <= 64) && (y >= 64 - y0*6) && (y0 < 7)) begin
                oled_data <= 16'h07E0;
            end
            
             else begin
                oled_data <= 16'h0000;
            end
        end

    default: begin
        if ((x >= 4) && (x <= 10) && (y <= 64) && (y >= 64 - y9*6)) begin
            oled_data <= 16'h07FF;
        end
        else if ((x >= 13) && (x <= 19) && (y <= 64) && (y >= 64 - y8*6)) begin
            oled_data <= 16'h07FF;
        end
        else if ((x >= 22) && (x <= 28) && (y <= 64) && (y >= 64 - y7*6)) begin
            oled_data <= 16'h07FF;
        end
        else if ((x >= 31) && (x <= 37) && (y <= 64) && (y >= 64 - y6*6)) begin
            oled_data <= 16'h07FF;
        end
        else if ((x >= 40) && (x <= 46) && (y <= 64) && (y >= 64 - y5*6)) begin
            oled_data <= 16'h07FF;
        end
        else if ((x >= 49) && (x <= 55) && (y <= 64) && (y >= 64 - y4*6) ) begin
            oled_data <= 16'h07FF;
        end
        else if ((x >= 58) && (x <= 64) && (y <= 64) && (y >= 64 - y3*6) ) begin
            oled_data <= 16'h07FF;
        end
        else if ((x >= 67) && (x <= 73) && (y <= 64) && (y >= 64 - y2*6) ) begin
            oled_data <= 16'h07FF;
        end
        else if ((x >= 76) && (x <= 82) && (y <= 64) && (y >= 64 - y1*6) ) begin
            oled_data <= 16'h07FF;
        end
        else if ((x >= 85) && (x <= 91) && (y <= 64) && (y >= 64 - y0*6) ) begin
            oled_data <= 16'h07E0;
        end
         else begin
            oled_data <= 16'h0000;
        end
    end //for default begin
    endcase //for case block
    end //for if statement
    
    else if (sw1) begin //loud
    case(inp) 
        5'b00001: begin
            if ((x >= 4) && (x <= 10) && (y <= 64) && (y >= 64 - y9*6) &&  (y9 >= 3)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 4) && (x <= 10) && (y <= 64) && (y >= 64 - y9*6) &&  (y9 < 3)) begin
                oled_data <= 16'hF81F;
            end
            
            else if ((x >= 13) && (x <= 19) && (y <= 64) && (y >= 64 - y8*6) &&  (y8 >= 3)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 13) && (x <= 19) && (y <= 64) && (y >= 64 - y8*6) &&  (y8 < 3)) begin
                oled_data <= 16'hF81F;
            end
    
            else if ((x >= 22) && (x <= 28) && (y <= 64) && (y >= 64 - y7*6) &&  (y7 >= 3)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 22) && (x <= 28) && (y <= 64) && (y >= 64 - y7*6) &&  (y7 < 3)) begin
                oled_data <= 16'hF81F;
            end
    
            else if ((x >= 31) && (x <= 37) && (y <= 64) && (y >= 64 - y6*6) && (y6 >= 3)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 31) && (x <= 37) && (y <= 64) && (y >= 64 - y6*6) && (y6 < 3)) begin
                oled_data <= 16'hF81F;
            end
    
            else if ((x >= 40) && (x <= 46) && (y <= 64) && (y >= 64 - y5*6) && (y5 >= 3)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 40) && (x <= 46) && (y <= 64) && (y >= 64 - y5*6) && (y5 < 3)) begin
                oled_data <= 16'hF81F;
            end
            
            else if ((x >= 49) && (x <= 55) && (y <= 64) && (y >= 64 - y4*6) &&  (y4 >= 3)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 49) && (x <= 55) && (y <= 64) && (y >= 64 - y4*6) &&  (y4 < 3)) begin
                oled_data <= 16'hF81F;
            end
            
            else if ((x >= 58) && (x <= 64) && (y <= 64) && (y >= 64 - y3*6) &&  (y3 >= 3)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 58) && (x <= 64) && (y <= 64) && (y >= 64 - y3*6) &&  (y3 < 3)) begin
                oled_data <= 16'hF81F;
            end
            
            else if ((x >= 67) && (x <= 73) && (y <= 64) && (y >= 64 - y2*6) &&  (y2 >= 3)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 67) && (x <= 73) && (y <= 64) && (y >= 64 - y2*6) &&  (y2 < 3)) begin
                oled_data <= 16'hF81F;
            end
            
            else if ((x >= 76) && (x <= 82) && (y <= 64) && (y >= 64 - y1*6) && (y1 >= 3)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 76) && (x <= 82) && (y <= 64) && (y >= 64 - y1*6) && (y1 < 3)) begin
                oled_data <= 16'hF81F;
            end
     
            else if ((x >= 85) && (x <= 91) && (y <= 64) && (y >= 64 - y0*6) && (y0 >= 3)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 85) && (x <= 91) && (y <= 64) && (y >= 64 - y0*6) && (y0 < 3)) begin
                oled_data <= 16'h07E0;
            end
            
             else begin
                oled_data <= 16'h0000;
            end
        end
        
        
        5'b00010: begin
            if ((x >= 4) && (x <= 10) && (y <= 64) && (y >= 64 - y9*6) &&  (y9 >= 4)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 4) && (x <= 10) && (y <= 64) && (y >= 64 - y9*6) &&  (y9 < 4)) begin
                oled_data <= 16'hF81F;
            end
            
            else if ((x >= 13) && (x <= 19) && (y <= 64) && (y >= 64 - y8*6) &&  (y8 >= 4)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 13) && (x <= 19) && (y <= 64) && (y >= 64 - y8*6) &&  (y8 < 4)) begin
                oled_data <= 16'hF81F;
            end
        
            else if ((x >= 22) && (x <= 28) && (y <= 64) && (y >= 64 - y7*6) &&  (y7 >= 4)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 22) && (x <= 28) && (y <= 64) && (y >= 64 - y7*6) &&  (y7 < 4)) begin
                oled_data <= 16'hF81F;
            end
        
            else if ((x >= 31) && (x <= 37) && (y <= 64) && (y >= 64 - y6*6) && (y6 >= 4)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 31) && (x <= 37) && (y <= 64) && (y >= 64 - y6*6) && (y6 < 4)) begin
                oled_data <= 16'hF81F;
            end
        
            else if ((x >= 40) && (x <= 46) && (y <= 64) && (y >= 64 - y5*6) && (y5 >= 4)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 40) && (x <= 46) && (y <= 64) && (y >= 64 - y5*6) && (y5 < 4)) begin
                oled_data <= 16'hF81F;
            end
            
            else if ((x >= 49) && (x <= 55) && (y <= 64) && (y >= 64 - y4*6) &&  (y4 >= 4)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 49) && (x <= 55) && (y <= 64) && (y >= 64 - y4*6) &&  (y4 < 4)) begin
                oled_data <= 16'hF81F;
            end
            
            else if ((x >= 58) && (x <= 64) && (y <= 64) && (y >= 64 - y3*6) &&  (y3 >= 4)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 58) && (x <= 64) && (y <= 64) && (y >= 64 - y3*6) &&  (y3 < 4)) begin
                oled_data <= 16'hF81F;
            end
            
            else if ((x >= 67) && (x <= 73) && (y <= 64) && (y >= 64 - y2*6) &&  (y2 >= 4)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 67) && (x <= 73) && (y <= 64) && (y >= 64 - y2*6) &&  (y2 < 4)) begin
                oled_data <= 16'hF81F;
            end
            
            else if ((x >= 76) && (x <= 82) && (y <= 64) && (y >= 64 - y1*6) && (y1 >= 4)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 76) && (x <= 82) && (y <= 64) && (y >= 64 - y1*6) && (y1 < 4)) begin
                oled_data <= 16'hF81F;
            end
        
            else if ((x >= 85) && (x <= 91) && (y <= 64) && (y >= 64 - y0*6) && (y0 >= 4)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 85) && (x <= 91) && (y <= 64) && (y >= 64 - y0*6) && (y0 < 4)) begin
                oled_data <= 16'h07E0;
            end
            
             else begin
                oled_data <= 16'h0000;
            end
        end
        
        
        5'b00100: begin
            if ((x >= 4) && (x <= 10) && (y <= 64) && (y >= 64 - y9*6) &&  (y9 >= 5)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 4) && (x <= 10) && (y <= 64) && (y >= 64 - y9*6) &&  (y9 < 5)) begin
                oled_data <= 16'hF81F;
            end
            
            else if ((x >= 13) && (x <= 19) && (y <= 64) && (y >= 64 - y8*6) &&  (y8 >= 5)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 13) && (x <= 19) && (y <= 64) && (y >= 64 - y8*6) &&  (y8 < 5)) begin
                oled_data <= 16'hF81F;
            end
        
            else if ((x >= 22) && (x <= 28) && (y <= 64) && (y >= 64 - y7*6) &&  (y7 >= 5)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 22) && (x <= 28) && (y <= 64) && (y >= 64 - y7*6) &&  (y7 < 5)) begin
                oled_data <= 16'hF81F;
            end
        
            else if ((x >= 31) && (x <= 37) && (y <= 64) && (y >= 64 - y6*6) && (y6 >= 5)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 31) && (x <= 37) && (y <= 64) && (y >= 64 - y6*6) && (y6 < 5)) begin
                oled_data <= 16'hF81F;
            end
        
            else if ((x >= 40) && (x <= 46) && (y <= 64) && (y >= 64 - y5*6) && (y5 >= 5)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 40) && (x <= 46) && (y <= 64) && (y >= 64 - y5*6) && (y5 < 5)) begin
                oled_data <= 16'hF81F;
            end
            
            else if ((x >= 49) && (x <= 55) && (y <= 64) && (y >= 64 - y4*6) &&  (y4 >= 5)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 49) && (x <= 55) && (y <= 64) && (y >= 64 - y4*6) &&  (y4 < 5)) begin
                oled_data <= 16'hF81F;
            end
            
            else if ((x >= 58) && (x <= 64) && (y <= 64) && (y >= 64 - y3*6) &&  (y3 >= 5)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 58) && (x <= 64) && (y <= 64) && (y >= 64 - y3*6) &&  (y3 < 5)) begin
                oled_data <= 16'hF81F;
            end
            
            else if ((x >= 67) && (x <= 73) && (y <= 64) && (y >= 64 - y2*6) &&  (y2 >= 5)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 67) && (x <= 73) && (y <= 64) && (y >= 64 - y2*6) &&  (y2 < 5)) begin
                oled_data <= 16'hF81F;
            end
            
            else if ((x >= 76) && (x <= 82) && (y <= 64) && (y >= 64 - y1*6) && (y1 >= 5)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 76) && (x <= 82) && (y <= 64) && (y >= 64 - y1*6) && (y1 < 5)) begin
                oled_data <= 16'hF81F;
            end
        
            else if ((x >= 85) && (x <= 91) && (y <= 64) && (y >= 64 - y0*6) && (y0 >= 5)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 85) && (x <= 91) && (y <= 64) && (y >= 64 - y0*6) && (y0 < 5)) begin
                oled_data <= 16'h07E0;
            end
            
             else begin
                oled_data <= 16'h0000;
            end
        end
        
        5'b01000: begin
            if ((x >= 4) && (x <= 10) && (y <= 64) && (y >= 64 - y9*6) &&  (y9 >= 6)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 4) && (x <= 10) && (y <= 64) && (y >= 64 - y9*6) &&  (y9 < 6)) begin
                oled_data <= 16'hF81F;
            end
            
            else if ((x >= 13) && (x <= 19) && (y <= 64) && (y >= 64 - y8*6) &&  (y8 >= 6)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 13) && (x <= 19) && (y <= 64) && (y >= 64 - y8*6) &&  (y8 < 6)) begin
                oled_data <= 16'hF81F;
            end
        
            else if ((x >= 22) && (x <= 28) && (y <= 64) && (y >= 64 - y7*6) &&  (y7 >= 6)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 22) && (x <= 28) && (y <= 64) && (y >= 64 - y7*6) &&  (y7 < 6)) begin
                oled_data <= 16'hF81F;
            end
        
            else if ((x >= 31) && (x <= 37) && (y <= 64) && (y >= 64 - y6*6) && (y6 >= 6)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 31) && (x <= 37) && (y <= 64) && (y >= 64 - y6*6) && (y6 < 6)) begin
                oled_data <= 16'hF81F;
            end
        
            else if ((x >= 40) && (x <= 46) && (y <= 64) && (y >= 64 - y5*6) && (y5 >= 6)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 40) && (x <= 46) && (y <= 64) && (y >= 64 - y5*6) && (y5 < 6)) begin
                oled_data <= 16'hF81F;
            end
            
            else if ((x >= 49) && (x <= 55) && (y <= 64) && (y >= 64 - y4*6) &&  (y4 >= 6)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 49) && (x <= 55) && (y <= 64) && (y >= 64 - y4*6) &&  (y4 < 6)) begin
                oled_data <= 16'hF81F;
            end
            
            else if ((x >= 58) && (x <= 64) && (y <= 64) && (y >= 64 - y3*6) &&  (y3 >= 6)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 58) && (x <= 64) && (y <= 64) && (y >= 64 - y3*6) &&  (y3 < 6)) begin
                oled_data <= 16'hF81F;
            end
            
            else if ((x >= 67) && (x <= 73) && (y <= 64) && (y >= 64 - y2*6) &&  (y2 >= 6)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 67) && (x <= 73) && (y <= 64) && (y >= 64 - y2*6) &&  (y2 < 6)) begin
                oled_data <= 16'hF81F;
            end
            
            else if ((x >= 76) && (x <= 82) && (y <= 64) && (y >= 64 - y1*6) && (y1 >= 6)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 76) && (x <= 82) && (y <= 64) && (y >= 64 - y1*6) && (y1 < 6)) begin
                oled_data <= 16'hF81F;
            end
        
            else if ((x >= 85) && (x <= 91) && (y <= 64) && (y >= 64 - y0*6) && (y0 >= 6)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 85) && (x <= 91) && (y <= 64) && (y >= 64 - y0*6) && (y0 < 6)) begin
                oled_data <= 16'h07E0;
            end
            
             else begin
                oled_data <= 16'h0000;
            end
        end
        
        5'b10000: begin
            if ((x >= 4) && (x <= 10) && (y <= 64) && (y >= 64 - y9*6) &&  (y9 >= 7)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 4) && (x <= 10) && (y <= 64) && (y >= 64 - y9*6) &&  (y9 < 7)) begin
                oled_data <= 16'hF81F;
            end
            
            else if ((x >= 13) && (x <= 19) && (y <= 64) && (y >= 64 - y8*6) &&  (y8 >= 7)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 13) && (x <= 19) && (y <= 64) && (y >= 64 - y8*6) &&  (y8 < 7)) begin
                oled_data <= 16'hF81F;
            end
        
            else if ((x >= 22) && (x <= 28) && (y <= 64) && (y >= 64 - y7*6) &&  (y7 >= 7)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 22) && (x <= 28) && (y <= 64) && (y >= 64 - y7*6) &&  (y7 < 7)) begin
                oled_data <= 16'hF81F;
            end
        
            else if ((x >= 31) && (x <= 37) && (y <= 64) && (y >= 64 - y6*6) && (y6 >= 7)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 31) && (x <= 37) && (y <= 64) && (y >= 64 - y6*6) && (y6 < 7)) begin
                oled_data <= 16'hF81F;
            end
        
            else if ((x >= 40) && (x <= 46) && (y <= 64) && (y >= 64 - y5*6) && (y5 >= 7)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 40) && (x <= 46) && (y <= 64) && (y >= 64 - y5*6) && (y5 < 7)) begin
                oled_data <= 16'hF81F;
            end
            
            else if ((x >= 49) && (x <= 55) && (y <= 64) && (y >= 64 - y4*6) &&  (y4 >= 7)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 49) && (x <= 55) && (y <= 64) && (y >= 64 - y4*6) &&  (y4 < 7)) begin
                oled_data <= 16'hF81F;
            end
            
            else if ((x >= 58) && (x <= 64) && (y <= 64) && (y >= 64 - y3*6) &&  (y3 >= 7)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 58) && (x <= 64) && (y <= 64) && (y >= 64 - y3*6) &&  (y3 < 7)) begin
                oled_data <= 16'hF81F;
            end
            
            else if ((x >= 67) && (x <= 73) && (y <= 64) && (y >= 64 - y2*6) &&  (y2 >= 7)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 67) && (x <= 73) && (y <= 64) && (y >= 64 - y2*6) &&  (y2 < 7)) begin
                oled_data <= 16'hF81F;
            end
            
            else if ((x >= 76) && (x <= 82) && (y <= 64) && (y >= 64 - y1*6) && (y1 >= 7)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 76) && (x <= 82) && (y <= 64) && (y >= 64 - y1*6) && (y1 < 7)) begin
                oled_data <= 16'hF81F;
            end
        
            else if ((x >= 85) && (x <= 91) && (y <= 64) && (y >= 64 - y0*6) && (y0 >= 7)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 85) && (x <= 91) && (y <= 64) && (y >= 64 - y0*6) && (y0 < 7)) begin
                oled_data <= 16'h07E0;
            end
            
             else begin
                oled_data <= 16'h0000;
            end
        end
    default: begin
        if ((x >= 4) && (x <= 10) && (y <= 64) && (y >= 64 - y9*6)) begin
            oled_data <= 16'hF81F;
        end
        else if ((x >= 13) && (x <= 19) && (y <= 64) && (y >= 64 - y8*6)) begin
            oled_data <= 16'hF81F;
        end
        else if ((x >= 22) && (x <= 28) && (y <= 64) && (y >= 64 - y7*6)) begin
            oled_data <= 16'hF81F;
        end
        else if ((x >= 31) && (x <= 37) && (y <= 64) && (y >= 64 - y6*6)) begin
            oled_data <= 16'hF81F;
        end
        else if ((x >= 40) && (x <= 46) && (y <= 64) && (y >= 64 - y5*6)) begin
            oled_data <= 16'hF81F;
        end
        else if ((x >= 49) && (x <= 55) && (y <= 64) && (y >= 64 - y4*6) ) begin
            oled_data <= 16'hF81F;
        end
        else if ((x >= 58) && (x <= 64) && (y <= 64) && (y >= 64 - y3*6) ) begin
            oled_data <= 16'hF81F;
        end
        else if ((x >= 67) && (x <= 73) && (y <= 64) && (y >= 64 - y2*6) ) begin
            oled_data <= 16'hF81F;
        end
        else if ((x >= 76) && (x <= 82) && (y <= 64) && (y >= 64 - y1*6) ) begin
            oled_data <= 16'hF81F;
        end
        else if ((x >= 85) && (x <= 91) && (y <= 64) && (y >= 64 - y0*6) ) begin
            oled_data <= 16'h07E0;
        end
         else begin
            oled_data <= 16'h0000;
        end
    end
    endcase
    end
    
    else begin //normal    
        case(inp) 
        5'b00001: begin
            if ((x >= 4) && (x <= 10) && (y <= 64) && (y >= 64 - y9*6) &&  (y9 >= 3)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 4) && (x <= 10) && (y <= 64) && (y >= 64 - y9*6) &&  (y9 < 3)) begin
                oled_data <= 16'b1111111111111111;
            end
            
            else if ((x >= 13) && (x <= 19) && (y <= 64) && (y >= 64 - y8*6) &&  (y8 >= 3)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 13) && (x <= 19) && (y <= 64) && (y >= 64 - y8*6) &&  (y8 < 3)) begin
                oled_data <= 16'b1111111111111111;
            end
    
            else if ((x >= 22) && (x <= 28) && (y <= 64) && (y >= 64 - y7*6) &&  (y7 >= 3)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 22) && (x <= 28) && (y <= 64) && (y >= 64 - y7*6) &&  (y7 < 3)) begin
                oled_data <= 16'b1111111111111111;
            end
    
            else if ((x >= 31) && (x <= 37) && (y <= 64) && (y >= 64 - y6*6) && (y6 >= 3)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 31) && (x <= 37) && (y <= 64) && (y >= 64 - y6*6) && (y6 < 3)) begin
                oled_data <= 16'b1111111111111111;
            end
    
            else if ((x >= 40) && (x <= 46) && (y <= 64) && (y >= 64 - y5*6) && (y5 >= 3)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 40) && (x <= 46) && (y <= 64) && (y >= 64 - y5*6) && (y5 < 3)) begin
                oled_data <= 16'b1111111111111111;
            end
            
            else if ((x >= 49) && (x <= 55) && (y <= 64) && (y >= 64 - y4*6) &&  (y4 >= 3)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 49) && (x <= 55) && (y <= 64) && (y >= 64 - y4*6) &&  (y4 < 3)) begin
                oled_data <= 16'b1111111111111111;
            end
            
            else if ((x >= 58) && (x <= 64) && (y <= 64) && (y >= 64 - y3*6) &&  (y3 >= 3)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 58) && (x <= 64) && (y <= 64) && (y >= 64 - y3*6) &&  (y3 < 3)) begin
                oled_data <= 16'b1111111111111111;
            end
            
            else if ((x >= 67) && (x <= 73) && (y <= 64) && (y >= 64 - y2*6) &&  (y2 >= 3)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 67) && (x <= 73) && (y <= 64) && (y >= 64 - y2*6) &&  (y2 < 3)) begin
                oled_data <= 16'b1111111111111111;
            end
            
            else if ((x >= 76) && (x <= 82) && (y <= 64) && (y >= 64 - y1*6) && (y1 >= 3)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 76) && (x <= 82) && (y <= 64) && (y >= 64 - y1*6) && (y1 < 3)) begin
                oled_data <= 16'b1111111111111111;
            end
     
            else if ((x >= 85) && (x <= 91) && (y <= 64) && (y >= 64 - y0*6) && (y0 >= 3)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 85) && (x <= 91) && (y <= 64) && (y >= 64 - y0*6) && (y0 < 3)) begin
                oled_data <= 16'h07E0;
            end
            
             else begin
                oled_data <= 16'h0000;
            end
        end
        
        
        5'b00010: begin
            if ((x >= 4) && (x <= 10) && (y <= 64) && (y >= 64 - y9*6) &&  (y9 >= 4)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 4) && (x <= 10) && (y <= 64) && (y >= 64 - y9*6) &&  (y9 < 4)) begin
                oled_data <= 16'b1111111111111111;
            end
            
            else if ((x >= 13) && (x <= 19) && (y <= 64) && (y >= 64 - y8*6) &&  (y8 >= 4)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 13) && (x <= 19) && (y <= 64) && (y >= 64 - y8*6) &&  (y8 < 4)) begin
                oled_data <= 16'b1111111111111111;
            end
        
            else if ((x >= 22) && (x <= 28) && (y <= 64) && (y >= 64 - y7*6) &&  (y7 >= 4)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 22) && (x <= 28) && (y <= 64) && (y >= 64 - y7*6) &&  (y7 < 4)) begin
                oled_data <= 16'b1111111111111111;
            end
        
            else if ((x >= 31) && (x <= 37) && (y <= 64) && (y >= 64 - y6*6) && (y6 >= 4)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 31) && (x <= 37) && (y <= 64) && (y >= 64 - y6*6) && (y6 < 4)) begin
                oled_data <= 16'b1111111111111111;
            end
        
            else if ((x >= 40) && (x <= 46) && (y <= 64) && (y >= 64 - y5*6) && (y5 >= 4)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 40) && (x <= 46) && (y <= 64) && (y >= 64 - y5*6) && (y5 < 4)) begin
                oled_data <= 16'b1111111111111111;
            end
            
            else if ((x >= 49) && (x <= 55) && (y <= 64) && (y >= 64 - y4*6) &&  (y4 >= 4)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 49) && (x <= 55) && (y <= 64) && (y >= 64 - y4*6) &&  (y4 < 4)) begin
                oled_data <= 16'b1111111111111111;
            end
            
            else if ((x >= 58) && (x <= 64) && (y <= 64) && (y >= 64 - y3*6) &&  (y3 >= 4)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 58) && (x <= 64) && (y <= 64) && (y >= 64 - y3*6) &&  (y3 < 4)) begin
                oled_data <= 16'b1111111111111111;
            end
            
            else if ((x >= 67) && (x <= 73) && (y <= 64) && (y >= 64 - y2*6) &&  (y2 >= 4)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 67) && (x <= 73) && (y <= 64) && (y >= 64 - y2*6) &&  (y2 < 4)) begin
                oled_data <= 16'b1111111111111111;
            end
            
            else if ((x >= 76) && (x <= 82) && (y <= 64) && (y >= 64 - y1*6) && (y1 >= 4)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 76) && (x <= 82) && (y <= 64) && (y >= 64 - y1*6) && (y1 < 4)) begin
                oled_data <= 16'b1111111111111111;
            end
        
            else if ((x >= 85) && (x <= 91) && (y <= 64) && (y >= 64 - y0*6) && (y0 >= 4)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 85) && (x <= 91) && (y <= 64) && (y >= 64 - y0*6) && (y0 < 4)) begin
                oled_data <= 16'h07E0;
            end
            
             else begin
                oled_data <= 16'h0000;
            end
        end
        
        
        5'b00100: begin
            if ((x >= 4) && (x <= 10) && (y <= 64) && (y >= 64 - y9*6) &&  (y9 >= 5)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 4) && (x <= 10) && (y <= 64) && (y >= 64 - y9*6) &&  (y9 < 5)) begin
                oled_data <= 16'b1111111111111111;
            end
            
            else if ((x >= 13) && (x <= 19) && (y <= 64) && (y >= 64 - y8*6) &&  (y8 >= 5)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 13) && (x <= 19) && (y <= 64) && (y >= 64 - y8*6) &&  (y8 < 5)) begin
                oled_data <= 16'b1111111111111111;
            end
        
            else if ((x >= 22) && (x <= 28) && (y <= 64) && (y >= 64 - y7*6) &&  (y7 >= 5)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 22) && (x <= 28) && (y <= 64) && (y >= 64 - y7*6) &&  (y7 < 5)) begin
                oled_data <= 16'b1111111111111111;
            end
        
            else if ((x >= 31) && (x <= 37) && (y <= 64) && (y >= 64 - y6*6) && (y6 >= 5)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 31) && (x <= 37) && (y <= 64) && (y >= 64 - y6*6) && (y6 < 5)) begin
                oled_data <= 16'b1111111111111111;
            end
        
            else if ((x >= 40) && (x <= 46) && (y <= 64) && (y >= 64 - y5*6) && (y5 >= 5)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 40) && (x <= 46) && (y <= 64) && (y >= 64 - y5*6) && (y5 < 5)) begin
                oled_data <= 16'b1111111111111111;
            end
            
            else if ((x >= 49) && (x <= 55) && (y <= 64) && (y >= 64 - y4*6) &&  (y4 >= 5)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 49) && (x <= 55) && (y <= 64) && (y >= 64 - y4*6) &&  (y4 < 5)) begin
                oled_data <= 16'b1111111111111111;
            end
            
            else if ((x >= 58) && (x <= 64) && (y <= 64) && (y >= 64 - y3*6) &&  (y3 >= 5)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 58) && (x <= 64) && (y <= 64) && (y >= 64 - y3*6) &&  (y3 < 5)) begin
                oled_data <= 16'b1111111111111111;
            end
            
            else if ((x >= 67) && (x <= 73) && (y <= 64) && (y >= 64 - y2*6) &&  (y2 >= 5)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 67) && (x <= 73) && (y <= 64) && (y >= 64 - y2*6) &&  (y2 < 5)) begin
                oled_data <= 16'b1111111111111111;
            end
            
            else if ((x >= 76) && (x <= 82) && (y <= 64) && (y >= 64 - y1*6) && (y1 >= 5)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 76) && (x <= 82) && (y <= 64) && (y >= 64 - y1*6) && (y1 < 5)) begin
                oled_data <= 16'b1111111111111111;
            end
        
            else if ((x >= 85) && (x <= 91) && (y <= 64) && (y >= 64 - y0*6) && (y0 >= 5)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 85) && (x <= 91) && (y <= 64) && (y >= 64 - y0*6) && (y0 < 5)) begin
                oled_data <= 16'h07E0;
            end
            
             else begin
                oled_data <= 16'h0000;
            end
        end
        
        5'b01000: begin
            if ((x >= 4) && (x <= 10) && (y <= 64) && (y >= 64 - y9*6) &&  (y9 >= 6)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 4) && (x <= 10) && (y <= 64) && (y >= 64 - y9*6) &&  (y9 < 6)) begin
                oled_data <= 16'b1111111111111111;
            end
            
            else if ((x >= 13) && (x <= 19) && (y <= 64) && (y >= 64 - y8*6) &&  (y8 >= 6)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 13) && (x <= 19) && (y <= 64) && (y >= 64 - y8*6) &&  (y8 < 6)) begin
                oled_data <= 16'b1111111111111111;
            end
        
            else if ((x >= 22) && (x <= 28) && (y <= 64) && (y >= 64 - y7*6) &&  (y7 >= 6)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 22) && (x <= 28) && (y <= 64) && (y >= 64 - y7*6) &&  (y7 < 6)) begin
                oled_data <= 16'b1111111111111111;
            end
        
            else if ((x >= 31) && (x <= 37) && (y <= 64) && (y >= 64 - y6*6) && (y6 >= 6)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 31) && (x <= 37) && (y <= 64) && (y >= 64 - y6*6) && (y6 < 6)) begin
                oled_data <= 16'b1111111111111111;
            end
        
            else if ((x >= 40) && (x <= 46) && (y <= 64) && (y >= 64 - y5*6) && (y5 >= 6)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 40) && (x <= 46) && (y <= 64) && (y >= 64 - y5*6) && (y5 < 6)) begin
                oled_data <= 16'b1111111111111111;
            end
            
            else if ((x >= 49) && (x <= 55) && (y <= 64) && (y >= 64 - y4*6) &&  (y4 >= 6)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 49) && (x <= 55) && (y <= 64) && (y >= 64 - y4*6) &&  (y4 < 6)) begin
                oled_data <= 16'b1111111111111111;
            end
            
            else if ((x >= 58) && (x <= 64) && (y <= 64) && (y >= 64 - y3*6) &&  (y3 >= 6)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 58) && (x <= 64) && (y <= 64) && (y >= 64 - y3*6) &&  (y3 < 6)) begin
                oled_data <= 16'b1111111111111111;
            end
            
            else if ((x >= 67) && (x <= 73) && (y <= 64) && (y >= 64 - y2*6) &&  (y2 >= 6)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 67) && (x <= 73) && (y <= 64) && (y >= 64 - y2*6) &&  (y2 < 6)) begin
                oled_data <= 16'b1111111111111111;
            end
            
            else if ((x >= 76) && (x <= 82) && (y <= 64) && (y >= 64 - y1*6) && (y1 >= 6)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 76) && (x <= 82) && (y <= 64) && (y >= 64 - y1*6) && (y1 < 6)) begin
                oled_data <= 16'b1111111111111111;
            end
        
            else if ((x >= 85) && (x <= 91) && (y <= 64) && (y >= 64 - y0*6) && (y0 >= 6)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 85) && (x <= 91) && (y <= 64) && (y >= 64 - y0*6) && (y0 < 6)) begin
                oled_data <= 16'h07E0;
            end
            
             else begin
                oled_data <= 16'h0000;
            end
        end
        
        5'b10000: begin
            if ((x >= 4) && (x <= 10) && (y <= 64) && (y >= 64 - y9*6) &&  (y9 >= 7)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 4) && (x <= 10) && (y <= 64) && (y >= 64 - y9*6) &&  (y9 < 7)) begin
                oled_data <= 16'b1111111111111111;
            end
            
            else if ((x >= 13) && (x <= 19) && (y <= 64) && (y >= 64 - y8*6) &&  (y8 >= 7)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 13) && (x <= 19) && (y <= 64) && (y >= 64 - y8*6) &&  (y8 < 7)) begin
                oled_data <= 16'b1111111111111111;
            end
        
            else if ((x >= 22) && (x <= 28) && (y <= 64) && (y >= 64 - y7*6) &&  (y7 >= 7)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 22) && (x <= 28) && (y <= 64) && (y >= 64 - y7*6) &&  (y7 < 7)) begin
                oled_data <= 16'b1111111111111111;
            end
        
            else if ((x >= 31) && (x <= 37) && (y <= 64) && (y >= 64 - y6*6) && (y6 >= 7)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 31) && (x <= 37) && (y <= 64) && (y >= 64 - y6*6) && (y6 < 7)) begin
                oled_data <= 16'b1111111111111111;
            end
        
            else if ((x >= 40) && (x <= 46) && (y <= 64) && (y >= 64 - y5*6) && (y5 >= 7)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 40) && (x <= 46) && (y <= 64) && (y >= 64 - y5*6) && (y5 < 7)) begin
                oled_data <= 16'b1111111111111111;
            end
            
            else if ((x >= 49) && (x <= 55) && (y <= 64) && (y >= 64 - y4*6) &&  (y4 >= 7)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 49) && (x <= 55) && (y <= 64) && (y >= 64 - y4*6) &&  (y4 < 7)) begin
                oled_data <= 16'b1111111111111111;
            end
            
            else if ((x >= 58) && (x <= 64) && (y <= 64) && (y >= 64 - y3*6) &&  (y3 >= 7)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 58) && (x <= 64) && (y <= 64) && (y >= 64 - y3*6) &&  (y3 < 7)) begin
                oled_data <= 16'b1111111111111111;
            end
            
            else if ((x >= 67) && (x <= 73) && (y <= 64) && (y >= 64 - y2*6) &&  (y2 >= 7)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 67) && (x <= 73) && (y <= 64) && (y >= 64 - y2*6) &&  (y2 < 7)) begin
                oled_data <= 16'b1111111111111111;
            end
            
            else if ((x >= 76) && (x <= 82) && (y <= 64) && (y >= 64 - y1*6) && (y1 >= 7)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 76) && (x <= 82) && (y <= 64) && (y >= 64 - y1*6) && (y1 < 7)) begin
                oled_data <= 16'b1111111111111111;
            end
        
            else if ((x >= 85) && (x <= 91) && (y <= 64) && (y >= 64 - y0*6) && (y0 >= 7)) begin
                oled_data <= 16'hF800;
            end
            else if ((x >= 85) && (x <= 91) && (y <= 64) && (y >= 64 - y0*6) && (y0 < 7)) begin
                oled_data <= 16'h07E0;
            end
            
             else begin
                oled_data <= 16'h0000;
            end
        end
        
        default: begin
                if ((x >= 4) && (x <= 10) && (y <= 64) && (y >= 64 - y9*6)) begin
                    oled_data <= 16'b1111111111111111;
                end
                else if ((x >= 13) && (x <= 19) && (y <= 64) && (y >= 64 - y8*6)) begin
                    oled_data <= 16'b1111111111111111;
                end
                else if ((x >= 22) && (x <= 28) && (y <= 64) && (y >= 64 - y7*6)) begin
                    oled_data <= 16'b1111111111111111;
                end
                else if ((x >= 31) && (x <= 37) && (y <= 64) && (y >= 64 - y6*6)) begin
                    oled_data <= 16'b1111111111111111;
                end
                else if ((x >= 40) && (x <= 46) && (y <= 64) && (y >= 64 - y5*6)) begin
                    oled_data <= 16'b1111111111111111;
                end
                else if ((x >= 49) && (x <= 55) && (y <= 64) && (y >= 64 - y4*6) ) begin
                    oled_data <= 16'b1111111111111111;
                end
                else if ((x >= 58) && (x <= 64) && (y <= 64) && (y >= 64 - y3*6) ) begin
                    oled_data <= 16'b1111111111111111;
                end
                else if ((x >= 67) && (x <= 73) && (y <= 64) && (y >= 64 - y2*6) ) begin
                    oled_data <= 16'b1111111111111111;
                end
                else if ((x >= 76) && (x <= 82) && (y <= 64) && (y >= 64 - y1*6) ) begin
                    oled_data <= 16'b1111111111111111;
                end
                else if ((x >= 85) && (x <= 91) && (y <= 64) && (y >= 64 - y0*6) ) begin
                    oled_data <= 16'h07E0;
                end
                 else begin
                    oled_data <= 16'h0000;
                end
            end
        endcase    
    end
end
endmodule
