`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2017 01:10:45 AM
// Design Name: 
// Module Name: smallCalc_CU
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


module smallCalc_CU(input go, clk, rst,
                    input [1:0] op,
                    output reg done, we, rea, reb, s2,
                    output reg [1:0] s1, wa, raa, rab, c);
                    reg [3:0] ns, cs;
                   
                    
                    always @(cs, op, go, done, ns)
                    begin
                         case(cs)
                               4'd0:
                                   //Idle
                                   begin                
                                       done = 0;
                                       if(go) ns = 4'd1;
                                       else ns = 4'd0;
                                   end
                               4'd1:  
                                   //R1 <- In1
                                   begin               
                                       done = 0;
                                       ns = 4'd2;
                                   end
                               4'd2:
                                   //R2 <- In2
                                   begin               
                                       done = 0;
                                       ns = 4'd3;
                                   end
                               4'd3:
                                   //Wait
                                   begin               
                                       done = 0;
                                       if(op == 0) ns = 4'd4;
                                       else if(op == 1) ns = 4'd5;
                                       else if(op == 2) ns = 4'd6;
                                       else if(op == 3) ns = 4'd7;
                                   end
                                4'd4:
                                   //R3 <- R1 + R2
                                   begin                
                                       done = 0;
                                       ns = 4'd8;
                                   end
                                4'd5:
                                   //R3 <- R1 - R2
                                   begin                
                                       done = 0;
                                       ns = 4'd8;
                                   end
                                4'd6:
                                   //R3 <- R1 & R2
                                   begin
                                       done = 0;
                                       ns = 4'd8;
                                   end
                                4'd7:
                                   //R3 <- R1 ^ R2
                                    begin
                                       done = 0;
                                       ns = 4'd8;
                                   end
                                4'd8:
                                     //Out: R3
                                     begin
                                        done = 1;
                                        ns = 4'd0;
                                     end
                                default: ns = 4'd0;
                              endcase
                    end
                    
                    always @ (posedge clk, posedge rst)
                    begin 
                        if (rst)  cs <= 4'd0; 
                        else  cs <= ns;
                    end
                    
                    always @(cs, s1, wa, raa, rab, c, we, rea, reb, s2) 
                        case(cs) 
                                     4'd0: 
                                        begin 
                                          s1 = 2'b00;
                                                     wa = 2'b00;
                                                     raa = 2'b00;
                                                     rab = 2'b00;
                                                  c = 2'b00;
                                                    we = 0;
                                                  rea = 0;
                                                  reb = 0;
                                                  s2 = 0;    
                                        end
                                     4'd1: 
                                      //R1 <- In1
                                        begin 
                                            s1 = 2'b00;
                                           wa = 2'b01;
                                           raa = 2'b00;
                                           rab = 2'b00;
                                            c = 2'b00;
                                            we = 1;
                                            rea = 0;
                                            reb = 0;
                                            s2 = 0;
                                         end
                                     4'd2:
                                     //R2 <- In2 
                                        begin 
                                           s1 = 2'b01;
                                           wa = 2'b10;
                                           raa = 2'b00;
                                           rab = 2'b00;
                                           c = 2'b00;
                                           we = 1;
                                           rea = 0;
                                           reb = 0;
                                           s2 = 0;
                                        end
                                     4'd3:
                                     //Wait 
                                        begin
                                            s1 = 2'b01;
                                            wa = 2'b00;
                                            raa = 2'b00;
                                            rab = 2'b00;
                                            c = 2'b00;
                                            we = 0;
                                            rea = 0;
                                            reb = 0;
                                            s2 = 0;                 
                                        end
                                     4'd4: 
                                        begin 
                                            s1 = 2'b11;
                                            wa = 2'b11;
                                            raa = 2'b01;
                                            rab = 2'b10;
                                            c = 2'b00;
                                            we = 1;
                                            rea = 1;
                                            reb = 1;
                                            s2 = 0;
                                        end
                                     4'd5:
                                        begin 
                                            s1 = 2'b11;
                                            wa = 2'b11;
                                            raa = 2'b01;
                                            rab = 2'b10;
                                            c = 2'b01;
                                            we = 1;
                                            rea = 1;
                                            reb = 1;
                                            s2 = 0;
                                        end 
                                     4'd6: 
                                        begin 
                                            s1 = 2'b11;
                                            wa = 2'b11;
                                            raa = 2'b01;
                                            rab = 2'b10;
                                            c = 2'b10;
                                            we = 1;
                                            rea = 1;
                                            reb = 1;
                                            s2 = 0;
                                         end 
                                     4'd7:
                                        begin 
                                             s1 = 2'b11;
                                             wa = 2'b11;
                                             raa = 2'b01;
                                             rab = 2'b10;
                                             c = 2'b11;
                                             we = 1;
                                             rea = 1;
                                             reb = 1;
                                             s2 = 0;
                                         end 
                                     4'd8: 
                                        begin 
                                            s1 = 2'b01;
                                            wa = 2'b00;
                                            raa = 2'b11;
                                            rab = 2'b11;
                                            c = 2'b10;
                                            we = 0;
                                            rea = 1;
                                            reb = 1;
                                            s2 = 1;
                                         end 
                            endcase 
endmodule
