`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.09.2023 09:55:09
// Design Name: 
// Module Name: Top_FSM
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


module Top_FSM(
    input Clk_100M,
    input Inp_0,
    input Inp_1,
    output Detect,
    output [2:0] FSM_state,
    input Clear
    );
    
    wire Clk_8M, Clk_1Hz, Clk_pb;
    
      clk_cmt c1
   (
    // Clock out ports
    .Clk_8M(Clk_8M),     // output Clk_8M
   // Clock in ports
    .Clk_100M(Clk_100M));      // input Clk_100M
    
    clk_div_rtl cd(.Clk_8M(Clk_8M),.Clk_1Hz(Clk_1Hz));
    
    PB_clock pb(.Clk_1Hz(Clk_1Hz),.Inp_0(Inp_0),.Inp_1(Inp_1),.Clk_pb(Clk_pb));
    
    FSM_moore_1111 fsm(.Inp_1(Inp_1),.Clear(Clear),.Clk_pb(Clk_pb),.Detect(Detect),.FSM_state(FSM_state));
    
endmodule
