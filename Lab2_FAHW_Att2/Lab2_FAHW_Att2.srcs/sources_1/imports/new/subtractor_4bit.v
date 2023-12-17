`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.08.2023 09:23:31
// Design Name: 
// Module Name: top_adder
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


module subtractor_4bit(
    input [3:0] InA,
    input [3:0] InB,
    input M,
    output [3:0] OutSum,
    output  flag_overflow, neg_sum, zero_sum
    );
    wire Carry1, Carry2, Carry3, Carry4;
    
    full_adder_1bit in0(.FA1_InA(InA[0]),.FA1_InB(InB[0]^M),.FA1_InC(M),.FA1_OutSum(OutSum[0]),.FA1_OutC(Carry1));
    full_adder_1bit in1(.FA1_InA(InA[1]),.FA1_InB(InB[1]^M),.FA1_InC(Carry1),.FA1_OutSum(OutSum[1]),.FA1_OutC(Carry2));
    full_adder_1bit in2(.FA1_InA(InA[2]),.FA1_InB(InB[2]^M),.FA1_InC(Carry2),.FA1_OutSum(OutSum[2]),.FA1_OutC(Carry3));
    full_adder_1bit in3(.FA1_InA(InA[3]),.FA1_InB(InB[3]^M),.FA1_InC(Carry3),.FA1_OutSum(OutSum[3]),.FA1_OutC(Carry4));
    
    assign flag_overflow = Carry3^Carry4;
    assign neg_sum = (OutSum[3]==1'b1);
    assign zero_sum = (OutSum==4'b0000);
 
endmodule
