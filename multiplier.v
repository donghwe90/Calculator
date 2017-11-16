`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2017 01:36:38 AM
// Design Name: 
// Module Name: multiplier
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


module multiplier(input [3:0] top_a, input [3:0] top_b, output [7:0] top_out);


wire [3:0] AND_val3;
wire [3:0] AND_val2;
wire [3:0] AND_val1;
wire [3:0] AND_val0;

wire [7:0] convert_val3;
wire [7:0] convert_val2;
wire [7:0] convert_val1;
wire [7:0] convert_val0;

wire [7:0] shift_val3;
wire [7:0] shift_val2;
wire [7:0] shift_val1;
wire [7:0] shift_val0;

wire [7:0] first_level_sum0;
wire [7:0] first_level_sum1;

quad_AND U1 (.a(top_a), .b(top_b), .pp0(AND_val0), .pp1(AND_val1), .pp2(AND_val2), .pp3(AND_val3));
Convert U2 (.in0(AND_val0), .in1(AND_val1), .in2(AND_val2), .in3(AND_val3), .out0(convert_val0), .out1(convert_val1), .out2(convert_val2), .out3(convert_val3));
quad_Shift U3(.in0(convert_val0), .in1(convert_val1), .in2(convert_val2), .in3(convert_val3), .shiftVal0(shift_val0), .shiftVal1(shift_val1), .shiftVal2(shift_val2), .shiftVal3(shift_val3));
addition U4(.a(shift_val0), .b(shift_val1), .sum(first_level_sum0));
addition U5(.a(shift_val2), .b(shift_val3), .sum(first_level_sum1));
addition U8(.a(first_level_sum0), .b(first_level_sum1), .sum(top_out));

endmodule
