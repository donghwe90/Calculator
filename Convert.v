`timescale 1ns / 1ps



module Convert(input [3:0] in0,  input [3:0] in1, input [3:0] in2, input [3:0] in3, output [7:0] out0, output [7:0] out1, output [7:0] out2, output [7:0] out3);
Convert_to_EightBit U1(.in(in0), .out(out0));
Convert_to_EightBit U2(.in(in1), .out(out1));
Convert_to_EightBit U3(.in(in2), .out(out2));
Convert_to_EightBit U4(.in(in3), .out(out3));
endmodule
