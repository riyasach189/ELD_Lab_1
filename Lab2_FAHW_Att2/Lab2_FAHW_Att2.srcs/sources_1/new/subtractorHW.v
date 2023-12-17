`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.09.2023 09:33:55
// Design Name: 
// Module Name: subtractorHW
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
    wire [3:0] OutSum;
    wire M, flag_overflow, neg_sum, zero_sum;
    
    subtractor_4bit sub(.InA(InA),.InB(InB),.M(M),.OutSum(OutSum),.flag_overflow(flag_overflow), .neg_sum(neg_sum), .zero_sum(zero_sum));
    
    vio_sub sub_vio (
  .clk(Clock),                // input wire clk
  .probe_in0(OutSum),    // input wire [3 : 0] probe_in0
  .probe_in1(flag_overflow),    // input wire [0 : 0] probe_in1
  .probe_in2(neg_sum),    // input wire [0 : 0] probe_in2
  .probe_in3(zero_sum),    // input wire [0 : 0] probe_in3
  .probe_out0(InA),  // output wire [3 : 0] probe_out0
  .probe_out1(InB),  // output wire [3 : 0] probe_out1
  .probe_out2(M)  // output wire [0 : 0] probe_out2
);
    
    
endmodule
