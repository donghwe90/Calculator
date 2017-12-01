`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2017 12:52:59 AM
// Design Name: 
// Module Name: small_calc
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


module small_calc(input go, clk, rst,
                  input [3:0] in1, in2, 
                  input [1:0] op,
                  output done,
                  output [3:0] out);
                  
wire [1:0] s1, wa, raa, rab, c;
wire we, rea, reb, s2;
smallCalc_CU U0 (.go(go), .clk(clk), .rst(rst), .op(op), .done(done), .we(we), .rea(rea), .reb(reb), .s2(s2), .s1(s1), .wa(wa), .raa(raa), .rab(rab), .c(c));
small_calc_DP U1 (.in1(in1), .in2(in2), .s1(s1), .wa(wa), .raa(raa), .rab(rab), .c(c), .we(we), .rea(rea), .reb(reb), .s2(s2), .clk(clk), .out(out));
endmodule
