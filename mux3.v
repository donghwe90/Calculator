`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2017 04:45:24 AM
// Design Name: 
// Module Name: mux3
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


module mux3(input [3:0] in1, in2, 
            input s2,
            output reg [3:0] out);

always @ (in1, in2, s2)
begin
    if (s2)  out = in1;
    else out = in2;
end

endmodule

