`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2017 02:03:19 AM
// Design Name: 
// Module Name: div_cu
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


module div_cu(input rst, CLK, Go, R_It_Y, cnt_out, Error,
          output reg [9:0] ctrl,
          output reg Done);
reg [3:0] ns, cs;
parameter
    IDLE = 10'b0_0_0_0_0_0_0_0_0_0, //0
    S1 = 10'b0_1_0_0_1_0_0_0_1_0, //1
    S2 = 10'b0_0_1_0_0_1_0_0_0_0,
    S3 = 10'b0_0_0_0_0_0_0_0_1_0, //2
    S3_0 = 10'b1_1_0_0_0_0_0_0_0_0, //3
    S3_1 = 10'b0_0_0_0_0_0_0_0_0_0, //4
    S4 = 10'b0_0_1_0_0_1_1_0_0_0, //5
    S5 = 10'b0_0_1_0_0_1_0_0_0_0, //6
    S6 = 10'b0_0_0_1_0_0_0_0_0_0,
    S7 = 10'b0_0_0_0_0_0_0_0_0_1,
    S7_E = 10'b0_0_0_0_0_0_0_0_0_0;
always @(Go, Done, ns, cs, Error, R_It_Y, cnt_out)
begin
    case(cs)
        4'd0:
            begin
                Done = 0;
                if(Go) ns = 4'd1;
                else   ns = 4'd0;
            end
        4'd1:
            begin
                Done = 0;
                if(Error) begin ns = 4'd8; end
                else ns = 4'd2;
            end
        4'd2:
            begin
                Done = 0; 
                ns = 4'd3;
            end
         4'd3:
           begin
               Done = 0;
               ns = 4'd4;
           end
        4'd4:
            begin
                Done = 0;
                begin if(R_It_Y) ns = 4'd6; else ns = 4'd5; end
            end
        4'd5:
            begin
                Done = 0;
                if(cnt_out) ns = 4'd7;
                else ns = 4'd3;
            end
        4'd6:
            begin
                Done = 0;
                if(cnt_out) ns = 4'd7;
                else ns = 4'd3;
            end
        4'd7:
            begin
                Done = 0;
                ns = 4'd8;
            end
        4'd8:
            begin
                Done = 1;
                ns = 4'd0;
            end
        default: ns = 4'd0;
    endcase
end

always @(posedge CLK, posedge rst)
begin
    if(rst)
        cs <= 0;
    else
        cs <= ns;
end

always @(cs, ctrl, R_It_Y, Error) //{sel1, ld1, sl1, sr1, ld2, sl2, lf, ud, ce, sel2} = ctrl;
begin
    case(cs)
        4'd0: ctrl = IDLE;
        4'd1: ctrl = S1;
        4'd2: ctrl = S2;
        4'd3: ctrl = S3;
        4'd4: begin if(R_It_Y) ctrl = S3_1; else ctrl = S3_0; end
        4'd5: ctrl = S4;
        4'd6: ctrl = S5;
        4'd7: ctrl = S6;
        4'd8: begin if(Error) begin ctrl = S7_E; end  else begin ctrl = S7; end end
    endcase
end
endmodule
