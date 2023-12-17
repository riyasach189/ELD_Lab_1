`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.09.2023 05:32:01
// Design Name: 
// Module Name: mult_tb
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


module mult_tb(
    );
    
    reg [3:0] OpA, OpB;
    wire [7:0] Product;
    
    multiplier mult_tb_inst(.OpA(OpA),.OpB(OpB),.Product(Product));
    
    initial
    begin
    OpA = 0;
    OpB = 10;
    
    #5 OpA = 2;
       OpB = 2;
       
    #5 OpA = 1;
       OpB = 15;
    
    #5 OpA = 7;
       OpB = 2;
       
    #5 OpA = 4;
       OpB = 3;
       
    #5 OpA = 6;
       OpB = 2;
       
    #5 OpA = 3;
       OpB = 3;
    
    #5 OpA = 1;
       OpB = 4;
       
    #5 OpA = 0;
       OpB = 15;
       
    #5 $finish;
       
    end
    
endmodule
