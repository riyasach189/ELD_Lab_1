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


module adder_tb(

    );
    
    reg [3:0] InA, InB;
    wire [4:0] OutSum;
    
    top_adder Tb1(.InA(InA),.InB(InB),.OutSum(OutSum));
    
    initial 
    begin
        InA = 4'b0000;
        InB = 4'b0000;
        
        #5 InA = 4'b0001;
        #5 InB = 4'b0001;
        #5 InB = 4'b1110;
        #5 InA = 4'b1110;
        #5 $stop;
        
    end
    
endmodule
