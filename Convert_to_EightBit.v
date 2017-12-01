`timescale 1ns / 1ps



module Convert_to_EightBit(input [3:0] in, output reg [7:0] out);

always @ (in)
begin
    case(in)
        4'd0: out = 8'd0;
        4'd1: out = 8'd1;
        4'd2: out = 8'd2;
        4'd3: out = 8'd3;
        4'd4: out = 8'd4;
        4'd5: out = 8'd5;
        4'd6: out = 8'd6;
        4'd7: out = 8'd7;
        4'd8: out = 8'd8;
        4'd9: out = 8'd9;
        4'd10: out = 8'd10;
        4'd11: out = 8'd11;
        4'd12: out = 8'd12;
        4'd13: out = 8'd13;
        4'd14: out = 8'd14;
        4'd15: out = 8'd15;
    endcase
end

endmodule