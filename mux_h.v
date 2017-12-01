`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2017 02:19:13 AM
// Design Name: 
// Module Name: mux_h
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


module mux_h(input sel,
             input [3:0] in1, in2,
             output reg [3:0] out);
always @ (in1, in2, sel)
             begin
                 if (sel)  out = in1;
                 else out = in2;
             end          
endmodule
