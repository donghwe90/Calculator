`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2017 01:48:22 AM
// Design Name: 
// Module Name: cla
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


module cla(input [3:0] a, input [3:0] b, input c_in, output c_out, output [3:0] sum );

wire [3:0] p;
wire [3:0] g;
wire [3:0] c;
quad_add U1 (.a(a), .b(b), .p(p), .g(g));
carry    U2 (.cin(c_in), .p(p), .g(g), .c(c), .cout(c_out));
overall_sum U3 (.c(c), .p(p), .sum(sum));
endmodule

