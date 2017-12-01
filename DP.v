`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2017 12:20:38 AM
// Design Name: 
// Module Name: DP
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


module DP(input [3:0] x, y,
          input clk, EN_F, EN_X, EN_Y, Go_Calc, Go_DIV, Sel_H, En_Out_H, En_Out_L, reset, 
          input [1:0]  Op_Calc, Sel_L, Sel_out,
          output [3:0] Out_H, Out_L,
          output Done_Calc_dp, Done_DIV_dp);

wire [3:0] top_x, top_y, out_calc, out_div_ph, out_div_pl, out_r, out_q, out_mux_H, out_mux_L, final_out_H, final_out_L;
Dreg U0 (.clk(clk), .reset(reset), .en(EN_X), .d(x), .q(top_x));
Dreg U1 (.clk(clk), .reset(reset), .en(EN_Y), .d(y), .q(top_y));
small_calc U2 (.go(Go_Calc), .clk(clk), .rst(reset), .in1(top_x), .in2(top_y), .op({Op_Calc[1],Op_Calc[0]}), .done(Done_Calc_dp), .out(out_calc));
multiplier U3(.top_a(top_x), .top_b(top_y), .top_out({out_div_ph, out_div_pl}));
division U4(.clk(clk), .go(Go_DIV), .rst(reset), .x(top_x), .y(top_y), .r(out_r), .q(out_q), .done(Done_DIV_dp));
mux_h U5(.sel(Sel_H), .in1(out_div_ph), .in2(out_r), .out(out_mux_H));
mux_l U6(.sel(Sel_L), .in1(4'd0), .in2(out_calc), .in3(out_div_pl), .in4(out_q), .out(out_mux_L));
Dreg U7 (.clk(clk), .reset(reset), .en(En_Out_H), .d(out_mux_H), .q(final_out_H));
Dreg U8 (.clk(clk), .reset(reset), .en(En_Out_L), .d(out_mux_L), .q(final_out_L));
mux_out U9 (.sel(Sel_out),.in1(8'd0), .in2({final_out_H, final_out_L}), .in3({4'd0,top_x}), .in4({4'd0,top_y}), .out({Out_H, Out_L}));
endmodule
