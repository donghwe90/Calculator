`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2017 01:51:31 AM
// Design Name: 
// Module Name: overall_sum
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


module overall_sum(input [3:0] c, input [3:0] p, output [3:0] sum);
basic_add U0 (c[0], p[0], sum[0]);
basic_add U1 (c[1], p[1], sum[1]);
basic_add U2 (c[2], p[2], sum[2]);
basic_add U3 (c[3], p[3], sum[3]);
endmodule
