`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.03.2023 16:24:26
// Design Name: 
// Module Name: RNG
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


module RNG(
    input [13:0] points,
    output [2:0] rand
    );
    wire [4:0] seed = points % 33;
    assign rand = ({seed[3],seed[1]} == 2'b00 ? {seed[4],seed[2],seed[0]} :                        
                        ({seed[3],seed[1]} == 2'b01 ? {seed[0],seed[4],seed[2]} :
                            ({seed[3],seed[1]} == 2'b10 ? {seed[2],seed[0],seed[4]} :
                                ({~seed[4],~seed[2],~seed[0]}
                                )
                            )
                         )
                     ); 
endmodule
