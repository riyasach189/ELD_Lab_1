`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.09.2023 09:47:32
// Design Name: 
// Module Name: top_FSM
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


module top_FSM(
    input Clk_100M,
    input Clear,
    output [8:0] sequence,
    output [1:0] FSM_state
    output Detect;
    );
    
    wire Clk_8M, Clk_1Hz;
    
    clk_wiz_8M cmt
   (
    // Clock out ports
    .Clk_8M(Clk_8M),     // output Clk_8M
   // Clock in ports
    .Clk_100M(Clk_100M));      // input Clk_100M
    
    clk_div_rtl cd(.Clk_8M(Clk_8M),.Clk_1Hz(Clk_1Hz));
    
    FSM fsm(.Clear(Clear),.Clk_1Hz(Clk_1Hz),.FSM_state(FSM_state),.sequence(sequence),.Detect(Detect));
endmodule
