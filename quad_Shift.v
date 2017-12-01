`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2017 01:44:12 AM
// Design Name: 
// Module Name: quad_Shift
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


module quad_Shift(input [7:0] in0, input [7:0] in1, input [7:0] in2, input [7:0] in3, output [7:0] shiftVal0, output [7:0] shiftVal1, output [7:0] shiftVal2, output [7:0] shiftVal3);
reg [1:0] ctrl3 = 2'd3;
reg [1:0] ctrl2 = 2'd2;
reg [1:0] ctrl1 = 2'd1;
reg [1:0] ctrl0 = 2'd0;

Shift U1 ( .ctrl(ctrl0), .in(in0), .out(shiftVal0));
Shift U2 ( .ctrl(ctrl1), .in(in1), .out(shiftVal1));
Shift U3 ( .ctrl(ctrl2), .in(in2), .out(shiftVal2));
Shift U4 ( .ctrl(ctrl3), .in(in3), .out(shiftVal3));
endmodule
