`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.09.2023 09:39:58
// Design Name: 
// Module Name: top_counter
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

module top_counter(
    input Clk_100M,
    input reset,
    output [5:0] sec_count,
    output [5:0] min_count
    );
    
    wire Clk_8M;
    wire Clk_1Hz;
    
    clk_div_to_8M cm1
   (
    // Clock out ports
    .Clk_8M(Clk_8M),     // output Clk_8M
   // Clock in ports
    .Clk_100M(Clk_100M));      // input Clk_100M
    
    clk_div_rtl cd1(.Clk_8M(Clk_8M),.Clk_1Hz(Clk_1Hz));
    
    DigClock digclk(.Clk_1Hz(Clk_1Hz),.reset(reset),.sec_count(sec_count),.min_count(min_count));
    
endmodule
