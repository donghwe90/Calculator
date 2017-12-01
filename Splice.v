`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2017 01:46:27 AM
// Design Name: 
// Module Name: Splice
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


module Splice(input [7:0] a , b, output reg [3:0] a0, a1, b0, b1);

always @(a,b)
begin
    a0[0] = a[0];
    a0[1] = a[1];
    a0[2] = a[2];
    a0[3] = a[3];
    a1[0] = a[4];
    a1[1] = a[5];
    a1[2] = a[6];
    a1[3] = a[7];
    
     b0[0] = b[0];
     b0[1] = b[1];
     b0[2] = b[2];
     b0[3] = b[3];
     b1[0] = b[4];
     b1[1] = b[5];
     b1[2] = b[6];
     b1[3] = b[7];
end

endmodule
