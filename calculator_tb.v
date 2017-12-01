`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/14/2017 06:07:50 PM
// Design Name: 
// Module Name: calculator_tb
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


module calculator_tb();
reg Go_tb, clk_tb, rst_tb;
reg [3:0] x_tb, y_tb;
reg [2:0] f_tb;
wire Done_tb;
wire [3:0] Out_H_tb, Out_L_tb;
integer i, x;
calculator DUT ( .Go(Go_tb), .clk(clk_tb), .rst(rst_tb),
                   .x(x_tb), .y(y_tb),
                  .f(f_tb),
                  .Done(Done_tb),
                  .Out_H(Out_H_tb), .Out_L(Out_L_tb));

task tick; begin #5 clk_tb = 1; #5 clk_tb = 0; end endtask
initial
begin
    rst_tb = 0; clk_tb = 0; Go_tb = 1;
    for(i = 0; i < 256; i = i + 1)
    begin
        {x_tb, y_tb} = i;
        tick;
        for(x = 0; x < 8; x = x + 1)
        begin
            f_tb = x;
            tick;
            while(!Done_tb)
                tick;
            case(f_tb)
            3'b000: begin if(Out_L_tb != x_tb + y_tb) $display("Error with addition"); end
            3'b001: begin if(Out_L_tb != x_tb - y_tb) $display("Error with subtraction"); end
            3'b010: begin if(Out_L_tb !== (x_tb & y_tb)) $display("Error with AND"); end
            3'b011: begin if(Out_L_tb !== (x_tb ^ y_tb)) $display("Error with XOR"); end
            3'b100: begin 
                    if(y_tb == 0) 
                        begin
                            if(Out_L_tb != 0) $display("Error with DIV"); 
                        end
                    else
                    begin
                        if(Out_L_tb != x_tb / y_tb) 
                            $display("Error with Div");
                        if(Out_H_tb != x_tb % y_tb) $display("Error with Remainder");
                    end
                    end
            3'b101: begin if({Out_H_tb,Out_L_tb} != x_tb * y_tb) $display("Error with MUL"); end
            3'b110: begin if(Out_L_tb != x_tb) $display("Error with A"); end
            3'b111: begin if(Out_L_tb != y_tb) $display("Error with B"); end
            endcase
        end
    end
    $display("End of Simulation");
    $finish;
end
endmodule
