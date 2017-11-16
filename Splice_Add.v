`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2017 01:47:07 AM
// Design Name: 
// Module Name: Splice_Add
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


module Splice_Add(input [3:0] a0, a1, b0, b1, output [7:0] sum);
wire c_out0;
wire c_out1; 
wire [3:0] Splice_sum0, Splice_sum1;
reg zero;

initial
begin
zero = 0;
end

cla U1 (.a(a0), .b(b0), .c_in(zero), .c_out(c_out0), .sum(Splice_sum0)); 
cla U2 (.a(a1), .b(b1), .c_in(c_out0), .c_out(c_out1), .sum(Splice_sum1));
Combine U3(.a(Splice_sum0), .b(Splice_sum1), .newNum(sum));

endmodule