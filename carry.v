`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2017 01:50:43 AM
// Design Name: 
// Module Name: carry
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


module carry(input cin, input [3:0] p, input [3:0] g, output reg [3:0] c, output reg cout);
always @(cin, p, g)
begin
    c[0] = cin;
    c[1] = g[0] | p[0] & cin;
    c[2] = g[1] | g[0] & p[1] | cin & p[0] & p[1];
    c[3] = g[2] | g[1] & p[2] | g[0] & p[1] & p[2] | c[0] & p[0] & p[1] & p[2];
    cout = g[3] | g[2] & p[3] | g[1] & p[2] & p[3] | g[0] & p[1] & p[2] & p[3] | c[0] & p[0] & p[1] & p[2] & p[3];
end
endmodule
