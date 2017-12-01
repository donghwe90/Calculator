`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/14/2017 09:14:18 PM
// Design Name: 
// Module Name: calculator_fpga
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


module calculator_fpga(input [3:0] top_x, top_y,
                        input [2:0] top_f,
                        input go, clk100MHz, control, rst,
                        output Done,
                        output [7:0] LEDOUT, LEDSEL);

supply1 [7:0] vcc;
wire DONT_USE, clk_5KHz;
wire [3:0] top_H, top_L;
wire [6:0] out_aH, out_bH, out_aL, out_bL;
calculator U0 (.Go(go), .clk(debouncedButton), .rst(rst), .x(top_x), .y(top_y), .f(top_f), .Done(Done), .Out_H(top_H), .Out_L(top_L));
showDivNumber U1(.in1(top_H), .in2(top_L), .out1(out_aH), .out2(out_bH), .out3(out_aL), .out4(out_bL));
led_mux U2(clk_5KHz, rst, vcc, vcc, {1'b1, out_aH}, {1'b1, out_bH}, vcc, vcc, {1'b1, out_aL},{1'b1, out_bL}, LEDOUT, LEDSEL); 
clk_gen U3(.clk100MHz(clk100MHz), .rst(rst), .clk_4sec(DONT_USE), .clk_5KHz(clk_5KHz));
button_debouncer U4(.clk(clk_5KHz), .button(control), .debounced_button(debouncedButton));
endmodule
