`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2017 02:07:31 AM
// Design Name: 
// Module Name: RemainderShiftReg
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


module RemainderShiftReg(input CLK, RST, SL, SR, LD, LeftIn, RightIn,
                input [4:0] D,
                output reg [4:0] Q);
always @(posedge CLK)
    begin
        if(RST)
            Q <= 0;
        else if(LD)
            Q <= D;
        else if(SL)
            begin
                Q[4:0] <= {Q[3:0], LeftIn};
            end
        else if(SR)
            begin
                Q[4:0] <= {RightIn,Q[4:1]};
            end
        else    Q[4:0] <= Q[4:0];
     end
endmodule
