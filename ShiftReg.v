`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2017 02:08:29 AM
// Design Name: 
// Module Name: ShiftReg
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


module ShiftReg(input CLK, RST, SL, LD, LeftIn,
                input [3:0] D,
                output reg [3:0] Q);
always @(posedge CLK)
    begin
        if(RST)
            Q <= 0;
        else if(LD)
            Q <= D;
        else if(SL)
            begin
                Q[3:0] <= {Q[2:0], LeftIn};
            end
        else    Q[3:0] <= Q[3:0];
     end
endmodule
