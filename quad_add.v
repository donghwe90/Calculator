`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2017 01:49:05 AM
// Design Name: 
// Module Name: quad_add
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


module quad_add(input [3:0] a, input [3:0] b, output [3:0] p, output [3:0] g);
half_adder U0 (.a(a[0]), .b(b[0]), .p(p[0]), .g(g[0]));
half_adder U1 (.a(a[1]), .b(b[1]), .p(p[1]), .g(g[1]));
half_adder U2 (.a(a[2]), .b(b[2]), .p(p[2]), .g(g[2]));
half_adder U3 (.a(a[3]), .b(b[3]), .p(p[3]), .g(g[3]));
endmodule
