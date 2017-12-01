`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/14/2017 08:24:56 PM
// Design Name: 
// Module Name: CU_tb
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


module CU_tb( );
reg Go_tb, clk_tb, rst_tb;
reg Done_Calc_tb, Done_Div_tb;
reg [2:0] F_tb;
wire Done;
wire [13:0] ctrl;

integer i;
 CU DUT(.Go(Go_tb), .clk(clk_tb), .rst(rst_tb), .Done_Calc(Done_Calc_tb), .Done_Div(Done_Div_tb),
          .f(F_tb),
          .Done(Done),
          .ctrl(ctrl));
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
                     S7   =   14'b0_0_0_0_00_1_0_11_1_1_00,
                     S8  =    14'b0_0_0_0_00_0_1_10_1_1_00,
                     S9_0  =  14'b0_0_0_0_00_0_0_00_0_0_01,
                     S9_1 =  14'b0_0_0_0_00_0_0_00_0_0_10,
                     S9_2 =  14'b0_0_0_0_00_0_0_00_0_0_11;
                     
task tick; begin #5 clk_tb = 1; #5 clk_tb = 0; end endtask
initial
begin
    clk_tb = 0; rst_tb = 0; Go_tb = 1;
    for(i = 0; i < 8; i = i + 1)
    begin
    F_tb = i; Done_Calc_tb = 1; Done_Div_tb = 1;
    tick;
    if(ctrl != IDLE) $display("Error with Idle");
    tick;
    if(ctrl != S1) 
        $display("Error with S1");
    tick;
    if(ctrl != S2) $display("Error with S2");
    tick;
    case (F_tb)
        3'b000: 
        begin
            if(ctrl != S3_0) $display("Error with S3_0");  tick;
              if(ctrl != S6_0) $display("Error with S6_0"); tick;
            if(ctrl != S9_0) $display("Error with S9_0"); 
            if(Done != 1) $display("Error with Done");
        end
        3'b001:
        begin
             if(ctrl != S3_1) $display("Error with S3_1");  tick;
              if(ctrl != S6_1) $display("Error with S6_1"); tick;
            if(ctrl != S9_0) $display("Error with S9_0"); 
            if(Done != 1) $display("Error with Done");
        end
        3'b010:
        begin
              if(ctrl != S3_2) $display("Error with S3_2"); tick;
               if(ctrl != S6_2) $display("Error with S6_2"); tick;
             if(ctrl != S9_0) $display("Error with S9_0");  
             if(Done != 1) $display("Error with Done");
        end
        3'b011:
        begin
              if(ctrl != S3_3) $display("Error with S3_3"); tick;
             if(ctrl != S6_3) $display("Error with S6_3"); tick;
            if(ctrl != S9_0) $display("Error with S9_0"); 
            if(Done != 1) $display("Error with Done");
        end
        3'b100: 
        begin
            tick;
            if(ctrl != S5) $display("Error with S5"); tick;
            if(ctrl != S7) $display("Error with S7"); tick;
            if(ctrl != S9_0) $display("Error with S9_0");
            if(Done != 1) $display("Error with Done");
        end
        3'b101:
        begin
            tick;
            if(ctrl != S4_0) $display("Error with S4_0"); tick;
            if(ctrl != S4_1) $display("Error with S4_1"); tick;
            if(ctrl != S8) $display("Error with S8"); tick;
            if(ctrl != S9_0) $display("Error with S9_0"); 
            if(Done != 1) $display("Error with Done");
        end
        3'b110:
        begin
            tick;
            if(ctrl != S9_1) $display("Error with S9_1"); 
            if(Done != 1) $display("Error with Done");
        end
        3'b111:
        begin
            tick;
            if(ctrl != S9_2) $display("Error with S9_2");
            if(Done != 1) $display("Error with Done");
        end
    endcase
    end
    $display("End of Simulation");
    $finish;
end
endmodule
