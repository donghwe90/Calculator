`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/14/2017 05:12:14 PM
// Design Name: 
// Module Name: CU
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


module CU(input Go, clk, rst, Done_Calc, Done_Div,
          input [2:0] f,
          output reg Done,
          output reg [13:0] ctrl);

reg [3:0] ns, cs;  
reg [2:0] q_f;
          parameter
             IDLE = 14'b0_0_0_0_00_0_0_00_0_0_00,
             S1   = 14'b1_1_1_0_00_0_0_00_0_0_00,
             S2   = 14'b1_0_0_0_00_0_0_00_0_0_00,
             S3_0 = 14'b0_0_0_1_00_0_0_00_0_0_00,
             S3_1 = 14'b0_0_0_1_01_0_0_00_0_0_00,
             S3_2 = 14'b0_0_0_1_10_0_0_00_0_0_00,
             S3_3 = 14'b0_0_0_1_11_0_0_00_0_0_00,
             S4_0 = 14'b0_0_0_0_00_0_1_10_0_0_00,
             S4_1 = 14'b0_0_0_0_00_0_1_10_1_1_00,
             S5 =   14'b0_0_0_0_00_1_0_00_0_0_00,
             S6_0 = 14'b0_0_0_1_00_0_0_01_0_1_00,
             S6_1 = 14'b0_0_0_1_01_0_0_01_0_1_00,
             S6_2 = 14'b0_0_0_1_10_0_0_01_0_1_00,
             S6_3 =   14'b0_0_0_1_11_0_0_01_0_1_00,
             S6_E_0 = 14'b0_0_0_0_00_0_0_01_0_1_00,
             S6_E_1 = 14'b0_0_0_0_01_0_0_01_0_1_00,
             S6_E_2 = 14'b0_0_0_0_10_0_0_01_0_1_00,
             S6_E_3 = 14'b0_0_0_0_11_0_0_01_0_1_00,
             S7   =   14'b0_0_0_0_00_1_0_11_1_1_00,
             S8  =    14'b0_0_0_0_00_0_1_10_1_1_00,
             S9_0  =  14'b0_0_0_0_00_0_0_00_0_0_01,
             S9_1 =  14'b0_0_0_0_00_0_0_00_0_0_10,
             S9_2 =  14'b0_0_0_0_00_0_0_00_0_0_11;
             
always @(posedge clk, posedge rst)
             begin
                      if(rst)
                             q_f <= 0;
                       else if(ctrl[13]) q_f <= f;
                       else q_f <= q_f;
             end
             
always @(Go, Done_Calc, Done_Div, Done, ns, cs, q_f)
             begin
                 case(cs)
                 4'd0:
                     begin
                     Done = 0;
                     if(Go) begin ns = 1; end
                     else begin ns = 0; end
                     end
                 4'd1: begin Done = 0; ns = 2; end
                 4'd2: begin Done = 0; ns = 3; end
                 4'd3:
                    begin
                        Done = 0;
                        case(q_f)
                                       3'b000: ns = 6;
                                       3'b001: ns = 6;
                                       3'b010: ns = 6;
                                       3'b011: ns = 6;
                                       3'b100: ns = 5;
                                       3'b101: ns = 4;
                                       3'b110: ns = 10;
                                       3'b111: ns = 10;
                       endcase
                    end   
                 4'd4: begin Done = 0; ns = 7; end
                 4'd5: begin Done = 0; ns = 8; end
                 4'd6: begin Done = 0;
                 if(!Done_Calc) 
                 begin 
                    ns = 4'd6; 
                 end 
                 else 
                 begin 
                    ns = 4'd10; 
                 end
                 end
                 4'd7: begin Done = 0; ns = 9; end
                 4'd8: begin Done = 0; if(Done_Div)  begin ns = 4'd10; end else begin ns = 4'd8; end end
                 4'd9: begin Done = 0; ns = 4'd10; end
                 4'd10: begin Done = 1; ns = 4'd0; end
                 default: ns = 4'd0;
                 endcase
end
                 
always @(posedge clk, posedge rst)
begin
         if(rst)
                cs <= 0;
         else
             cs <= ns;
end

always @(cs, ctrl, q_f) //{sel1, ld1, sl1, sr1, ld2, sl2, lf, ud, ce, sel2} = ctrl;
begin
    case(cs)
    4'd0:   ctrl = IDLE;
    4'd1:   ctrl = S1;
    4'd2:   ctrl = S2;
    4'd3:   
        begin
        case(q_f)
                3'b000: ctrl = S3_0;
                3'b001: ctrl = S3_1;
                3'b010: ctrl = S3_2;
                3'b011: ctrl = S3_3;
        endcase
        end
    4'd4:   ctrl = S4_0;
    4'd5:   ctrl = S5;
    4'd6: 
         begin
         case(q_f)
                   3'b000: ctrl = S6_0;
                   3'b001: ctrl = S6_1;
                   3'b010: ctrl = S6_2;
                   3'b011: ctrl = S6_3;
         endcase
         end
    4'd8: begin  ctrl = S7;
          end
    4'd9: ctrl = S8;
    4'd7: ctrl = S4_1;
    4'd10: 
         begin
           case(q_f)
               3'b000: ctrl = S9_0;
               3'b001: ctrl = S9_0;
               3'b010: ctrl = S9_0;
               3'b011: ctrl = S9_0;
               3'b100: ctrl = S9_0;
               3'b101: ctrl = S9_0;
               3'b110: ctrl = S9_1;
               3'b111: ctrl = S9_2;
           endcase
         end   
    endcase
end                                      
endmodule
