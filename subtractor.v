`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2017 02:09:37 AM
// Design Name: 
// Module Name: subtractor
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


module subtractor(input [4:0] in1,
                  input [3:0] in2,
                  output reg [4:0] out);
always @(in1, in2)
begin
    out = in1 - {1'd0, in2};
end
endmodule

