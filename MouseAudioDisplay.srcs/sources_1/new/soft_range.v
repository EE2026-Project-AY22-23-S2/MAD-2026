`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2023 13:26:06
// Design Name: 
// Module Name: soft_range
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


module soft_range(input CLOCK, input [11:0] MIC_in, output reg [3:0] vol_level, output reg [11:0] fixed_peak = 0, output reg [8:0] led);
wire clk20k;

reg [31:0] COUNT = 0;
reg [11:0] curr = 0;
reg [11:0] peak = 0;


clk clock_20k(CLOCK, 20_000, clk20k);

// 12 bit value -> 4095 (max vol)
//CHANGED LED SEG AND AN TO REG, REMOVE INSTANTIATION


//USE ASSIGNOUT = WIRE?
always @ (posedge clk20k)
begin
    curr = MIC_in; // Read sample val into curr 
    if (curr > peak)
    begin
        peak = curr;
    end
    
    COUNT = COUNT + 1;
    
    // AFTER 0.05s
    if (COUNT >= 1000)
    begin
        COUNT <= 0; // reset count
        fixed_peak = peak;
        peak <= 0;
        
        if (fixed_peak < 2050) begin
            vol_level <= 0;
            led <= 0; 
            end
        else if (fixed_peak >= 2050 && fixed_peak < 2080) begin
            vol_level <= 1;
            led <= 1'b1; 
            end
        else if (fixed_peak >= 2080 && fixed_peak < 2120) begin
            vol_level <= 2;
            led <= 2'b11; 
            end
        else if (fixed_peak >= 2120 && fixed_peak < 2160) begin
            vol_level <= 3;
            led <= 3'b111; 
            end
        else if (fixed_peak >= 2160 && fixed_peak < 2200) begin
            vol_level <= 4;
            led <= 4'b1111; 
            end
        else if (fixed_peak >= 2200 && fixed_peak < 2240) begin
            vol_level <= 5;
            led <= 5'b11111; 
            end
        else if (fixed_peak >= 2240 && fixed_peak < 2280) begin
            vol_level <= 6;
            led <= 6'b111111; 
            end
        else if (fixed_peak >= 2280 && fixed_peak < 2340) begin
            vol_level <= 7;
            led <= 7'b1111111; 
            end
        else if (fixed_peak >= 2340 && fixed_peak < 2400) begin
            vol_level <= 8;
            led <= 8'b11111111; 
            end
        else if (fixed_peak >= 2400 && fixed_peak < 4095) begin
            vol_level <= 9;
            led <= 9'b111111111; 
            end
        else
            vol_level <= 20; //FOR DEBUGGING
    end
end
endmodule
