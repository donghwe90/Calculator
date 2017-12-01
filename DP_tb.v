`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2017 02:40:22 AM
// Design Name: 
// Module Name: DP_tb
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


module DP_tb();
reg [3:0] x_tb, y_tb;
reg clk_tb, EN_F_tb, EN_X_tb, EN_Y_tb, Go_Calc_tb, Go_DIV_tb, Sel_H_tb, En_Out_H_tb, En_Out_L_tb, reset_tb;
reg [1:0] Op_Calc_tb, Sel_L_tb, Sel_out_tb;
reg [2:0] F;
reg [13:0] ctrl;
reg [1:0] check;
wire [3:0] Out_H_tb, Out_L_tb;
wire Done_Calc_tb, Done_DIV_tb;

integer i, x;
DP DUT(.x(x_tb), .y(y_tb), .clk(clk_tb), .EN_F(EN_F_tb), .EN_X(EN_X_tb), .EN_Y(EN_Y_tb), 
        .Go_Calc(Go_Calc_tb), .Go_DIV(Go_DIV_tb), .Sel_H(Sel_H_tb), .Sel_L(Sel_L_tb), .En_Out_H(En_Out_H_tb), .En_Out_L(En_Out_L_tb), .reset(reset_tb), .Sel_out(Sel_out_tb),
          .Op_Calc(Op_Calc_tb), .Out_H(Out_H_tb), .Out_L(Out_L_tb), .Done_Calc_dp(Done_Calc_tb),  .Done_DIV_dp(Done_DIV_tb));

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
    S6_3 = 14'b0_0_0_1_11_0_0_01_0_1_00,
    S6_E_0 = 14'b0_0_0_0_00_0_0_01_0_1_00,
    S6_E_1 = 14'b0_0_0_0_01_0_0_01_0_1_00,
    S6_E_2 = 14'b0_0_0_0_10_0_0_01_0_1_00,
    S6_E_3 = 14'b0_0_0_0_11_0_0_01_0_1_00,
    S7   =   14'b0_0_0_0_00_1_0_11_1_1_00,
    S7_E =   14'b0_0_0_0_00_0_0_11_1_1_00,
    S8  =    14'b0_0_0_0_00_0_1_10_1_1_00,
    S9_0  =  14'b0_0_0_0_00_0_0_00_0_0_01,
    S2_0 =  14'b0_0_0_0_00_0_0_00_0_0_10,
    S2_1 =  14'b0_0_0_0_00_0_0_00_0_0_11;
    
task tick; begin #5 clk_tb = 1; #5 clk_tb = 0; end endtask
always @(ctrl) {EN_F_tb, EN_X_tb, EN_Y_tb, Go_Calc_tb, Op_Calc_tb, Go_DIV_tb, Sel_H_tb, Sel_L_tb, En_Out_H_tb, En_Out_L_tb, Sel_out_tb} = ctrl;
initial
begin
    clk_tb = 0; reset_tb = 0; 
    for(i = 0; i < 256; i = i + 1)
    begin
          {x_tb, y_tb} = i;
           for(x = 0; x < 8; x = x + 1)
           begin
                F = x;
                ctrl = IDLE; tick;
                ctrl = S1; tick;
                ctrl = S2; tick;
                
                if(!F[2])
                    begin 
                        case(F)
                            3'b000: begin ctrl = S3_0; tick; end
                            3'b001: begin ctrl = S3_1; tick; end
                            3'b010: begin ctrl = S3_2; tick; end
                            3'b011: begin ctrl = S3_3; tick; end
                        endcase
                        while(!Done_Calc_tb)
                        begin
                            case(Op_Calc_tb)
                                2'b00: begin ctrl = S6_0; tick; end
                                2'b01: begin ctrl = S6_1; tick; end
                                2'b10: begin ctrl = S6_2; tick; end
                                2'b11: begin ctrl = S6_3; tick; end
                            endcase
                        end
                        
                        case(Op_Calc_tb)
                            2'b00: begin ctrl = S6_E_0;  end
                            2'b01: begin ctrl = S6_E_1;  end
                            2'b10: begin ctrl = S6_E_2;  end
                            2'b11: begin ctrl = S6_E_3;  end
                        endcase               
                        tick;
                    end
                else
                    begin
                        if(F[1])
                            begin
                                if(F[0])begin ctrl = S2_1;  tick; if(Out_L_tb != y_tb) $display("Error with B"); end
                                else begin ctrl = S2_0; tick; if(Out_L_tb != x_tb) begin $display("Error with A");  end end
                            end
                        else
                            begin
                                if(F[0]) //multiplication
                                    begin
                                        ctrl = S4_0; tick;
                                        ctrl = S4_1; tick;
                                        ctrl = S8; tick;
                                    end
                                else
                                    begin
                                        ctrl = S5; tick;
                                        while(!Done_DIV_tb)
                                        begin
                                            ctrl = S7; tick;
                                        end
                                        ctrl = S7_E; tick;
                                    end
                              
                            end
                    end
                
                   case(F)
                    3'b011: 
                          begin   
                                ctrl = S9_0;  tick;
                                              
                                if(Out_L_tb !== ( x_tb ^ y_tb)) 
                                              begin 
                                                  $display("Error with Xor");
                                              end 
                                              
                                          end
                   3'b000: begin   
                                ctrl = S9_0;  
                                tick;
                                if(Out_L_tb != x_tb + y_tb) 
                                        $display("Error with addition");         
                           end
                   3'b001: 
                        begin   
                            ctrl = S9_0;  
                            tick; 
                            if(Out_L_tb != x_tb - y_tb) 
                                begin 
                                    $display("Error with subtraction"); 
                                end
                        end
                   3'b010: begin   
                                ctrl = S9_0;  tick;
                                
                                if(Out_L_tb !== (x_tb & y_tb)) 
                                    begin 
                                        $display("Error with And"); 
                                    end 
                                     
                           end
                  
                   3'b100: begin ctrl = S9_0; tick;
                           if(y_tb != 0)  
                                begin 
                                    if(Out_L_tb != x_tb / y_tb) 
                                    begin  
                                        $display("Error with Division"); 
                                    end
                                    if(Out_H_tb != x_tb % y_tb)
                                    begin  
                                       $display("Error with Division"); 
                                    end
                                end 
                           else 
                                begin  
                                    if({Out_H_tb,Out_L_tb} != 0)
                                    begin 
                                        $display("Error with Division"); 
                                   end
                                end 
                           end
                   3'b101: 
                   begin  
                       ctrl = S9_0; tick;  
                            if({Out_H_tb,Out_L_tb} != x_tb * y_tb) 
                                $display("Error with Mul"); 
                      
                  end
                  endcase
                  
           end      
    end
    $display("End of Simulation");
    $finish;
end 
endmodule
