`timescale 1ns / 1ps

module addition(input [7:0] a, input [7:0] b, output [7:0] sum);
wire [3:0] a0, a1, b0, b1;
Splice U1 (.a(a), .b(b), .a0(a0), .a1(a1), .b0(b0), .b1(b1));
Splice_Add U2(.a0(a0), .a1(a1), .b0(b0), .b1(b1), .sum(sum));
        
endmodule