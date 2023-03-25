`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.03.2023 11:52:20
// Design Name: 
// Module Name: car_position
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


module car_position(
    input ThousandHz,
    input btnL,
    input btnR,
    input btnU,
    input btnD,
    output reg [6:0] car_x,
    output reg [6:0] car_y
    );
    initial begin
        car_x <= 45; //middle of screen (left of car)
        car_y <= 51; // bottom of the screen (top of car)
    end
    wire btnLdb;
    wire btnRdb;
    wire btnUdb;
    wire btnDdb;
    debouncer_button db_btnL (btnL,ThousandHz,btnLdb);
    debouncer_button db_btnR (btnR,ThousandHz,btnRdb);
    debouncer_button db_btnU (btnU,ThousandHz,btnUdb);
    debouncer_button db_btnD (btnD,ThousandHz,btnDdb);        
    always @(posedge ThousandHz) begin
        if(btnLdb) begin
            if (car_x > 14) begin
                car_x = car_x - 1;
            end
            else begin
                car_x = car_x;
            end
        end
        else if (btnRdb) begin
            if (car_x < 72) begin
                car_x = car_x + 1;
            end
            else begin
                car_x = car_x;
            end
        end 
        else if (btnUdb) begin
            if (car_y > 5) begin
                car_y = car_y - 1;
            end 
            else begin
                car_y = car_y;
            end
        end
        else if (btnDdb) begin
            if (car_y < 55) begin
                car_y = car_y + 1;
            end
            else begin
                car_y = car_y;
            end
        end 
        else begin
            car_x = car_x;
            car_y = car_y;
        end      
    end
    
endmodule
