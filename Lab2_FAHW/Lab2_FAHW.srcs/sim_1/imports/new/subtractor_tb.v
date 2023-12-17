`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.08.2023 09:45:16
// Design Name: 
// Module Name: adder_tb
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


module subtractor_tb(

    );
    
    reg [3:0] InA, InB;
    reg M;
    wire [3:0] OutSum;
    wire flag_overflow, neg_sum, zero_sum;
    
    subtractor_4bit Tb1(.InA(InA),.InB(InB),.M(M),.OutSum(OutSum),.flag_overflow(flag_overflow), .neg_sum(neg_sum), .zero_sum(zero_sum));
    
    initial 
    begin
        InA = 0;
        InB = 0;
        M = 1;
        
        #5 InA = -8; InB = -7;
        #5 InA = -8; InB = 7;
        #5 InA = -1; InB = 7;
        #5 InA = 5; InB = 7;
        #5 InA = 7; InB = 2;
        #5 InA = 1; InB = -1;
            
        #5 M = 0;
        
        #5 InA = 3; InB = 4;
        #5 InA = 4; InB = 4;
        #5 InA = 7; InB = -7;
        #5 InA = 0; InB = 0;
        #5 InA = -4; InB = -4;
        #5 InA = 0; InB = -8;
        #5 InA = 7; InB = -8;
        
        #5 $stop;
        
    end
    
endmodule
