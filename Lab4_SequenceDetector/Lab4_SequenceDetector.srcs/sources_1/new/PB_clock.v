`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.09.2023 09:41:21
// Design Name: 
// Module Name: PB_clock
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


module PB_clock(
    input Clk_1Hz,
    input Inp_0,
    input Inp_1,
    output reg Clk_pb
    );
    
    wire pb_pulse;
    
    always@(posedge Clk_1Hz)
        Clk_pb <= pb_pulse;
        
    assign pb_pulse = Inp_0 | Inp_1;
        
endmodule
