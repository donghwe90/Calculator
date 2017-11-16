`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2017 03:20:09 AM
// Design Name: 
// Module Name: mux_out
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


module mux_out(input [1:0] sel,
               input [7:0] in1, in2, in3, in4,
               output reg [7:0] out);
always @ (in1, in2, in3, in4, sel)
begin
    case(sel)
        2'b00: out = in1;
        2'b01: out = in2;
        2'b10: out = in3;
        2'b11: out = in4;
    endcase
end          
endmodule
