`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2017 02:05:24 AM
// Design Name: 
// Module Name: div_dp
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


module div_dp(input rst, CLK, sel1, ld1, sl1, sr1, ld2, sl2, lf, ud, ce, sel2,
          input [3:0] Dividend, Divisor, n,
          output R_It_Y, cnt_out, error,
          output [3:0] Q, R);
wire lessThan;
wire [4:0] Remainder_out, sub_out, q_r;
wire [3:0] q_x, q_y, q_cnt;
assign cnt_out = (q_cnt == 0) ? 1 : 0;
assign error = (Divisor == 0) ? 1 : 0;
assign R_It_Y = (q_r[3:0] < q_y) ? 1 : 0;
div_mux1 U0 (.in1(sub_out), .in2(5'd0), .s2(sel1), .m1out(Remainder_out));
RemainderShiftReg U1 (.CLK(CLK), .RST(rst), .SL(sl1), .SR(sr1), .LD(ld1), .LeftIn(q_x[3]), .RightIn(0), .D(Remainder_out), .Q(q_r));
ShiftReg U3 (.CLK(CLK), .RST(rst), .SL(sl2), .LD(ld2), .LeftIn(lf), .D(Dividend), .Q(q_x));
Reg U4 (.CLK(CLK), .RST(rst), .LD(ld2), .D(Divisor), .Q(q_y));
subtractor U5 (.in1(q_r), .in2(q_y), .out(sub_out));
mux3 U6 (.in1({q_r[3:0]}), .in2(0), .s2(sel2), .out(R));
mux3 U7 (.in1(q_x), .in2(0), .s2(sel2), .out(Q));
UD_CNT_4 U8 (.D(n), .LD(ld2), .UD(ud), .CE(ce), .CLK(CLK), .RST(rst), .Q(q_cnt));
endmodule
