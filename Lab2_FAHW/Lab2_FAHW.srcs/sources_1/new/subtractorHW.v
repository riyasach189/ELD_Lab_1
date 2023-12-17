`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.08.2023 09:52:40
// Design Name: 
// Module Name: top_adderHW
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


module subtractorHW(
    input Clock
    );
    
    wire [3:0] InA, InB;
    wire M;
    wire [3:0] OutSum;
    wire flag_overflow, neg_sum, zero_sum;
    
    vio_subtractor sub1 (
  .clk(Clock),                // input wire clk
  .probe_in0(OutSum),    // input wire [3 : 0] probe_in0
  .probe_in1(flag_overflow),    // input wire [0 : 0] probe_in1
  .probe_in2(neg_sum),    // input wire [0 : 0] probe_in2
  .probe_in3(zero_sum),    // input wire [0 : 0] probe_in3
  .probe_out0(InA),  // output wire [3 : 0] probe_out0
  .probe_out1(InB),  // output wire [3 : 0] probe_out1
  .probe_out2(M)  // output wire [0 : 0] probe_out2
);
    
    subtractor_4bit(.InA(InA),.InB(InB),.M(M),.OutSum(OutSum),.flag_overflow(flag_overflow), .neg_sum(neg_sum), .zero_sum(zero_sum));   
    
endmodule
