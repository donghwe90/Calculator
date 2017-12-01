`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2017 02:06:54 AM
// Design Name: 
// Module Name: div_mux1
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


module div_mux1(input [4:0] in1, in2, 
            input s2,
            output reg [4:0] m1out);
always @ (in1, in2, s2)
            begin
                if (s2)  m1out = in1;
                else m1out = in2;
            end
endmodule
