`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.09.2023 05:00:27
// Design Name: 
// Module Name: multiplier
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


module multiplier(
    input [3:0] OpA,
    input [3:0] OpB,
    output [7:0] Product
    );
    
    wire carry00, carry01, carry02, carry03;
    wire carry10, carry11, carry12, carry13;
    wire carry20, carry21, carry22, carry23;
    wire pp12, pp13, pp14, pp23, pp24, pp25;
    
    assign Product[0] = OpA[0]&OpB[0];
    full_adder_1bit in00(.FA1_InA(OpA[1]&OpB[0]),.FA1_InB(OpA[0]&OpB[1]),.FA1_InC(1'b0),.FA1_OutSum(Product[1]),.FA1_OutC(carry00));
    full_adder_1bit in01(.FA1_InA(OpA[2]&OpB[0]),.FA1_InB(OpA[1]&OpB[1]),.FA1_InC(carry00),.FA1_OutSum(pp12),.FA1_OutC(carry01));
    full_adder_1bit in02(.FA1_InA(OpA[3]&OpB[0]),.FA1_InB(OpA[2]&OpB[1]),.FA1_InC(carry01),.FA1_OutSum(pp13),.FA1_OutC(carry02));
    full_adder_1bit in03(.FA1_InA(1'b0),.FA1_InB(OpA[3]&OpB[1]),.FA1_InC(carry02),.FA1_OutSum(pp14),.FA1_OutC(carry03));
    
    full_adder_1bit in10(.FA1_InA(pp12),.FA1_InB(OpA[0]&OpB[2]),.FA1_InC(1'b0),.FA1_OutSum(Product[2]),.FA1_OutC(carry10));
    full_adder_1bit in11(.FA1_InA(pp13),.FA1_InB(OpA[1]&OpB[2]),.FA1_InC(carry10),.FA1_OutSum(pp23),.FA1_OutC(carry11));
    full_adder_1bit in12(.FA1_InA(pp14),.FA1_InB(OpA[2]&OpB[2]),.FA1_InC(carry11),.FA1_OutSum(pp24),.FA1_OutC(carry12));
    full_adder_1bit in13(.FA1_InA(carry03),.FA1_InB(OpA[3]&OpB[2]),.FA1_InC(carry12),.FA1_OutSum(pp25),.FA1_OutC(carry13));
    
    full_adder_1bit in20(.FA1_InA(pp23),.FA1_InB(OpA[0]&OpB[3]),.FA1_InC(1'b0),.FA1_OutSum(Product[3]),.FA1_OutC(carry20));
    full_adder_1bit in21(.FA1_InA(pp24),.FA1_InB(OpA[1]&OpB[3]),.FA1_InC(carry20),.FA1_OutSum(Product[4]),.FA1_OutC(carry21));
    full_adder_1bit in22(.FA1_InA(pp25),.FA1_InB(OpA[2]&OpB[3]),.FA1_InC(carry21),.FA1_OutSum(Product[5]),.FA1_OutC(carry22));
    full_adder_1bit in23(.FA1_InA(carry13),.FA1_InB(OpA[3]&OpB[3]),.FA1_InC(carry22),.FA1_OutSum(Product[6]),.FA1_OutC(Product[7]));
     
endmodule
