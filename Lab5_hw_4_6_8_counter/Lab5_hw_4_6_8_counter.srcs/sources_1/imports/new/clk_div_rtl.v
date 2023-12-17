`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.09.2023 09:25:08
// Design Name: 
// Module Name: clk_div_rtl
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


module clk_div_rtl(
    input Clk_8M,
    output Clk_1Hz
    );
    
    reg [22:0] Count_reg = 0;  // initialization of FFs during FPGA configuration
    reg [22:0] Count_next;  // output of comb ckt - cannot be initialized
    
    always@(posedge Clk_8M)
    begin
            Count_reg <= Count_next;  // D-FF
    end
    
    always@(*)  // comb ckt to find out the next state
        Count_next = Count_reg + 1;
        
    assign Clk_1Hz = Count_reg[22];
    
endmodule
