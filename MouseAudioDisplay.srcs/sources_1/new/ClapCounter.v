`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.03.2023 19:19:44
// Design Name: 
// Module Name: grp_stage
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


module ClapCounter (input CLOCK, [11:0] MIC_in, input btnC, output reg [3:0] number_of_claps);
    reg [31:0] count = 0;
    reg flag = 0;
    // 79999999
    always @ (posedge CLOCK) begin
        if (btnC) begin // reset all claps so user can try again
            number_of_claps <= number_of_claps == 5 ? 5 : 0; // keep at 5 if already 5 so user can unlock in top student
            count <= 0;
            flag <= 0;
        end else begin
        // MIC_in > 2400
            if ((MIC_in > 3500) && (flag == 0)) begin
                count <= 1; // set to 1 to begin the counting
                flag <= 1;
                number_of_claps <= number_of_claps + 1;
            end else begin
                // if nothing is happening, count and flag both kept at 0
                count <= count == 0 ? 0 : (count == 79999999 ? 0 : count + 1);
                flag <= count == 0 ? 0 : (count == 79999999 ? 0 : 1); // still counting, flag on to prevent extra clap
            end
        end
    end
endmodule