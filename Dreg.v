`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2017 12:22:32 AM
// Design Name: 
// Module Name: Dreg
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


module Dreg(input clk, reset, en, 
            input [3:0] d,
            output reg[3:0] q);
always @(posedge clk, posedge reset)
    if(reset) q <= 4'b0;
    else if(en) q <= d;
    else q <= q;
endmodule
