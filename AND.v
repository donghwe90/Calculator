`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2017 01:41:23 AM
// Design Name: 
// Module Name: AND
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


module AND(input [3:0] a, input  b, output [3:0] val);

assign val[0] = a[0] & b;
assign val[1] = a[1] & b;
assign val[2] = a[2] & b;
assign val[3] = a[3] & b;

endmodule
