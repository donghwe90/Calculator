`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2017 01:55:47 AM
// Design Name: 
// Module Name: division
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


module division(input clk, go, rst,
                input [3:0] x, y,
                output [3:0] r, q,
                output done);

wire R_It_Y, cnt_out, Error;
wire [9:0] ctrl;
div_cu U0(.rst(rst), .CLK(clk), .Go(go), .R_It_Y(R_It_Y), .cnt_out(cnt_out), .Error(Error), .ctrl(ctrl), .Done(done));
div_dp U1(.rst(rst), .CLK(clk),  .sel1(ctrl[9]), .ld1(ctrl[8]), .sl1(ctrl[7]), .sr1(ctrl[6]), .ld2(ctrl[5]), .sl2(ctrl[4]), .lf(ctrl[3]), .ud(ctrl[2]), .ce(ctrl[1]), .sel2(ctrl[0]),
      .Dividend(x), .Divisor(y), .n(4),
      .R_It_Y(R_It_Y), .cnt_out(cnt_out), .error(Error),
      .Q(q), .R(r));

endmodule
