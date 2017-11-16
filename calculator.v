`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/14/2017 05:54:04 PM
// Design Name: 
// Module Name: calculator
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


module calculator(input Go, clk, rst,
                  input [3:0] x, y,
                  input [2:0] f,
                  output Done,
                  output [3:0] Out_H, Out_L);
wire [13:0] ctrl;
wire Done_c, Done_d;
CU U0 (.Go(Go), .clk(clk), .rst(rst), .Done_Calc(Done_c), .Done_Div(Done_d),
          .f(f),
          .Done(Done),
          .ctrl(ctrl));
DP U1 (.x(x), .y(y), .clk(clk), .EN_F(ctrl[13]), .EN_X(ctrl[12]), .EN_Y(ctrl[11]), 
                          .Go_Calc(ctrl[10]), .Go_DIV(ctrl[7]), .Sel_H(ctrl[6]), .Sel_L({ctrl[5], ctrl[4]}), .En_Out_H(ctrl[3]), .En_Out_L(ctrl[2]), .reset(rst), .Sel_out({ctrl[1], ctrl[0]}),
                            .Op_Calc({ctrl[9], ctrl[8]}), .Out_H(Out_H), .Out_L(Out_L), .Done_Calc_dp(Done_c), .Done_DIV_dp(Done_d));
endmodule
