`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2017 01:52:55 AM
// Design Name: 
// Module Name: Combine
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


module Combine (input [3:0] a, b, output reg [7:0] newNum);

always @(a,b)
begin
    newNum[0] = a[0];
    newNum[1] = a[1];
    newNum[2] = a[2];
    newNum[3] = a[3];
    newNum[4] = b[0];
    newNum[5] = b[1];
    newNum[6] = b[2];
    newNum[7] = b[3];
end
endmodule
