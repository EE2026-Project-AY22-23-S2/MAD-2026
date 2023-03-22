`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2023 04:16:37 PM
// Design Name: 
// Module Name: AudioOutModule
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


module AudioOutModule (input clock, sw0, btnC, output D1, D2, CLK_OUT, nSync);
    wire [11:0] audio_out;
    wire C20k, C50M, Cf, C2f, Cdb, NC, ringState, buttonC;
    reg ringerCommand = 0;
    reg lastRing = 0;

    clk clk20k (clock, 20000, C20k);
    clk clk50M (clock, 50000000, C50M);
    clk clkf (clock, 200, Cf);
    clk clk2f (clock, 400, C2f);
    
    always @ (posedge clock) begin
        if (lastRing == 0) begin
            if (buttonC == 1) begin
                ringerCommand <= 1;
                lastRing <= 1;
            end else //buttonC == 0
                ringerCommand <= 0;
        end else begin //lastRing == 1
            if (buttonC == 0) begin
                lastRing <= 0;
                ringerCommand <= 0;
            end else //buttonC == 1
                ringerCommand <= 0;
        end
    end

    buttonModule moduleButtonC (clock, btnC, buttonC);
    ringerModule ringer (clock, ringerCommand, ringState);
    
    assign audio_out = ringState ? (sw0 ? (Cf ? 12'hFFF : 0) : (C2f ? 12'h800 : 0)) : 0;
    
    Audio_Output aud (.CLK(C50M), .START(C20k), .DATA1(audio_out), .DATA2(NC), .RST(1'b0), .D1(D1), .D2(D2), .CLK_OUT(CLK_OUT), .nSync(nSync), .DONE(NC));

endmodule
