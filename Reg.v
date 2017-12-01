`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2017 02:09:03 AM
// Design Name: 
// Module Name: Reg
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

module Reg(input CLK, RST, LD,
           input [3:0] D,
           output reg [3:0] Q);
always @(posedge CLK)
    begin
        if(RST)
            Q <= 0;
        else if(LD)
            Q <= D;
        else    Q[3:0] <= Q[3:0];
     end
endmodule
