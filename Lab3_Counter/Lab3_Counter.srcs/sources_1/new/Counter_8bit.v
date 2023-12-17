`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.09.2023 09:03:04
// Design Name: 
// Module Name: Counter_8bit
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

module Counter_8bit(
    input Clk_1Hz,
    input reset,
    output [7:0] Count
    );
    
    reg [7:0] Count_reg = 255;  // initialization of FFs during FPGA configuration
    reg [7:0] Count_next;  // output of comb ckt - cannot be initialized
    
    always@(posedge Clk_1Hz or posedge reset)  // asynch active high reset
    begin
        if (reset)  // active high reset
            Count_reg <= 255;
        else
            Count_reg <= Count_next;  // D-FF
    end
    
    always@(*)  // comb ckt to find out the next state
        Count_next = Count_reg - 1;
    
    assign Count = Count_reg;  // comb ckt to find the output
    
endmodule
