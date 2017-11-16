`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2017 01:40:24 AM
// Design Name: 
// Module Name: quad_AND
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


module quad_AND(input [3:0] a, input [3:0] b, output [3:0] pp0, output [3:0] pp1, output [3:0] pp2, output [3:0] pp3 );
AND U1 (.a(a), .b(b[0]), .val(pp0));
AND U2 (.a(a), .b(b[1]), .val(pp1));
AND U3 (.a(a), .b(b[2]), .val(pp2));
AND U4 (.a(a), .b(b[3]), .val(pp3));
endmodule
