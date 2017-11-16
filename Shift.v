`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2017 01:44:40 AM
// Design Name: 
// Module Name: Shift
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


module Shift(input [1:0] ctrl, input [7:0] in, output reg [7:0] out  );

always @(ctrl, in)
begin
    case(ctrl)
        2'd0: out = in;
        2'd1: out = in << 1;
        2'd2: out = in << 2;
        2'd3: out = in << 3;
    endcase
end
endmodule