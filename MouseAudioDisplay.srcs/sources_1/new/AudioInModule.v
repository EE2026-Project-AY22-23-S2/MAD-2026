`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2023 04:18:51 PM
// Design Name: 
// Module Name: AudioInModule
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


module AudioInModule(input CLOCK, input J_MIC_Pin3, output J_MIC_Pin1, J_MIC_Pin4, output reg [8:0] led,
output reg [6:0] seg, output reg [3:0] an);
wire clk20k;
wire [11:0] MIC_in;
reg [11:0] fixed_peak = 0;
reg [31:0] COUNT = 0;
reg [11:0] curr = 0;
reg [11:0] peak = 0;

clk clk20kHz (CLOCK, 20000, clk20k);

//wire vol_level;
//vol_level vl(clk20k, fixed_peak, vol_level); //CHECK CLOCK FOR EACH MOD
reg [3:0] vol_level;
//led_module led_on(clk20k, vol_level, led); //are these combinational circuits? always happening regardless of clock? constantly running?
//seven_segment segm(clk20k, vol_level, seg, an);


Audio_Input my_audio_unit(
    .CLK(CLOCK),                  // 100MHz clock
    .cs(clk20k),                   // sampling clock, 20kHz
    .MISO(J_MIC_Pin3),                 // J_MIC3_Pin3, serial mic input
    .clk_samp(J_MIC_Pin1),            // J_MIC3_Pin1
    .sclk(J_MIC_Pin4),            // J_MIC3_Pin4, MIC3 serial clock
    .sample(MIC_in)     // 12-bit audio sample data
);

// 12 bit value -> 4095 (max vol)
//CHANGED LED SEG AND AN TO REG, REMOVE INSTANTIATION

always @ (posedge clk20k)
begin
    curr = MIC_in; // Read sample val into curr 
    if (curr > peak)
    begin
        peak = curr;
    end
    
    COUNT = COUNT + 1;
    
    // AFTER 0.2s
    if (COUNT >= 4000)
    begin
        COUNT <= 0; // reset count
        fixed_peak = peak;
        peak <= 0;
        
        if (fixed_peak < 2048) begin
            vol_level <= 0;
            led <= 0; 
            seg <= 7'b1000000;
            an <= 4'b1110;
            end
        else if (fixed_peak >= 2048 && fixed_peak < 2100) begin
            vol_level <= 1;
            an <= 4'b1110;
            seg <= 7'b1111001;
            led <= 1'b1;
            end
        else if (fixed_peak >= 2100 && fixed_peak < 2250) begin
            vol_level <= 2;
            an <= 4'b1110;
            seg <= 7'b0100100; 
            led <= 2'b11;
            end
        else if (fixed_peak >= 2250 && fixed_peak < 2400) begin
            vol_level <= 3;
            an <= 4'b1110;
            seg <= 7'b0110000;
            led <= 3'b111;
            end
        else if (fixed_peak >= 2400 && fixed_peak < 2650) begin
            vol_level <= 4;
            an <= 4'b1110;
            seg <= 7'b0011001;
            led <= 4'b1111;
            end
        else if (fixed_peak >= 2650 && fixed_peak < 2900) begin
            vol_level <= 5;
            an <= 4'b1110;
            seg <= 7'b0010010;
            led <= 5'b11111;
            end
        else if (fixed_peak >= 2900 && fixed_peak < 3200) begin
            vol_level <= 6;
            an <= 4'b1110;
            seg <= 7'b0000010; 
            led <= 6'b111111;
            end
        else if (fixed_peak >= 3200 && fixed_peak < 3450) begin
            vol_level <= 7;
            an <= 4'b1110;
            seg <= 7'b1111000; 
            led <= 7'b1111111;
            end
        else if (fixed_peak >= 3450 && fixed_peak < 3700) begin
            vol_level <= 8;
            an <= 4'b1110;
            seg <= 7'b0000000; 
            led <= 8'b11111111;
            end
        else if (fixed_peak >= 3700 && fixed_peak < 4095) begin
            vol_level <= 9;
            an <= 4'b1110;
            seg <= 7'b0010000;
            led <= 9'b111111111;
            end
        else
            vol_level <= 20; //FOR DEBUGGING
    end
end
endmodule
