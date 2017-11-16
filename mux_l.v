`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2017 02:21:40 AM
// Design Name: 
// Module Name: mux_l
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


module mux_l(input [1:0] sel,
             input [3:0] in1, in2, in3, in4,
             output reg [3:0] out);

always @(sel, in1, in2, in3, in4)
begin
    case(sel)
        2'b00: out = in1;
        2'b01: out = in2;
        2'b10: out = in3;
        2'b11: out = in4;
    endcase
end
endmodule
