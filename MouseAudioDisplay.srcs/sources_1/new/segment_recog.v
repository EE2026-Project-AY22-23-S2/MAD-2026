`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.03.2023 12:19:54
// Design Name: 
// Module Name: segment_recog
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


module segment_recog(input sw15, CLOCK, input [12:0] segment, output reg LD15, [11:0] audio_out,  reg [7:0] seg, reg [3:0] an, input [3:0] indv_an, input [7:0] indv_seg);

reg beeperCommand = 0;
reg [4:0] lastCommand = 10;
reg [4:0] timing = 10;
wire [11:0] sound;
wire state;
wire sound_clk, seg_clk;
reg [1:0] stg = 0;

TeamBeeper beeper (CLOCK, timing, beeperCommand, state);
clk seg_clock (CLOCK, 20000, seg_clk);
clk sound_clock (CLOCK, 400, sound_clk);

always @ (posedge seg_clk) begin
    stg <= stg == 2 ? 0 : stg + 1;
end

always @ (posedge CLOCK) begin
    if (sw15 == 1) begin
        an <= stg == 0 ? 4'b0111 : (stg == 1 ? 4'b1011 : 4'b1110);
        case (segment[6:0])
            //number 0
            7'b1111101: begin
            LD15 <= 1;
            seg <= stg == 0 ? (8'b01000000) : stg == 1 ? (8'b11111001) : indv_seg;
            timing <= 0;
                if (lastCommand != 0) begin
                    beeperCommand <= 1;
                    lastCommand <= 0;
                end else
                    beeperCommand <= 0;
            end
            //number 1
            7'b1010000: begin
            LD15 <= 1;
            seg <= stg == 0 ? (8'b01000000) : stg == 1 ? (8'b10100100) : indv_seg;
            timing <= 1;
                if (lastCommand != 1) begin
                    beeperCommand <= 1;
                    lastCommand <= 1;
                end else
                    beeperCommand <= 0;
            end
            //number 2
            7'b0110111: begin
            LD15 <= 1;
            seg <= stg == 0 ? (8'b01000000) : stg == 1 ? (8'b10110000) : indv_seg;
            timing <= 2;
                if (lastCommand != 2) begin
                    beeperCommand <= 1;
                    lastCommand <= 2;
                end else
                    beeperCommand <= 0;
            end
            //number 3
            7'b1010111: begin
            LD15 <= 1;
            seg <= stg == 0 ? (8'b01000000) : stg == 1 ? (8'b10011001) : indv_seg;
            timing <= 3;
                if (lastCommand != 3) begin
                    beeperCommand <= 1;
                    lastCommand <= 3;
                end else
                    beeperCommand <= 0;
            end
            //number 4
            7'b1011010: begin
            LD15 <= 1;
            seg <= stg == 0 ? (8'b01000000) : stg == 1 ? (8'b10010010) : indv_seg;
            timing <= 4;
                if (lastCommand != 4) begin
                    beeperCommand <= 1;
                    lastCommand <= 4;
                end else
                    beeperCommand <= 0;
            end
            //number 5
            7'b1001111: begin
            LD15 <= 1;
            seg <= stg == 0 ? (8'b01000000) : stg == 1 ? (8'b10000010) : indv_seg;
            timing <= 5;
                if (lastCommand != 5) begin
                    beeperCommand <= 1;
                    lastCommand <= 5;
                end else
                    beeperCommand <= 0;
            end
            //number 6
            7'b1101111: begin
            LD15 <= 1;
            seg <= stg == 0 ? (8'b01000000) : stg == 1 ? (8'b11111000) : indv_seg;
            timing <= 6;
                if (lastCommand != 6) begin
                    beeperCommand <= 1;
                    lastCommand <= 6;
                end else
                    beeperCommand <= 0;
            end
            //number 7
            7'b1010001: begin
            LD15 <= 1;
            seg <= stg == 0 ? (8'b01000000) : stg == 1 ? (8'b10000000) : indv_seg;
            timing <= 7;
                if (lastCommand != 7) begin
                    beeperCommand <= 1;
                    lastCommand <= 7;
                end else
                    beeperCommand <= 0;
            end
            //number 8
            7'b1111111: begin
            LD15 <= 1;
            seg <= stg == 0 ? (8'b01000000) : stg == 1 ? (8'b10010000) : indv_seg;
            timing <= 8;
                if (lastCommand != 8) begin
                    beeperCommand <= 1;
                    lastCommand <= 8;
                end else
                    beeperCommand <= 0;
            end
            //number 9
            7'b1011111: begin
            LD15 <= 1;
            seg <= stg == 0 ? (8'b01111001) : stg == 1 ? (8'b11000000) : indv_seg;
            timing <= 9;
                if (lastCommand != 9) begin
                    beeperCommand <= 1;
                    lastCommand <= 9;
                end else
                    beeperCommand <= 0;
            end
            //any other value
            default: begin
                LD15 <= 0;
                beeperCommand <= 0;
                lastCommand <= 10;
                timing <= 10;
                an <= 4'b1110;
                seg <= indv_seg;
            end
        endcase
    end
    else begin
        LD15 <= 0;
        beeperCommand <= 0;
        lastCommand <= 10;
        timing <= 10;
        an <= 4'b1110;
        seg <= indv_seg;
    end
end

assign audio_out = state ? (sw15 ? (sound_clk ? 12'h800 : 0) : 0) : 0;

endmodule
