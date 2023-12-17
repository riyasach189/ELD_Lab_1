`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.09.2023 09:14:08
// Design Name: 
// Module Name: VIO_Wrapper
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


module VIO_Wrapper(
    input Clk_100M
    );
    
    wire reset;
    wire [5:0] sec_count, min_count;
    
   vio_digclk vio (
  .clk(Clk_100M),                // input wire clk
  .probe_in0(sec_count),    // input wire [5 : 0] probe_in0
  .probe_in1(min_count),    // input wire [5 : 0] probe_in1
  .probe_out0(reset)  // output wire [0 : 0] probe_out0
);

    top_counter tc(.Clk_100M(Clk_100M),.reset(reset),.sec_count(sec_count),.min_count(min_count));

    
    
    
    
endmodule
