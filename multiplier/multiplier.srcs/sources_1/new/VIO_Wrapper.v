`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.09.2023 05:28:33
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
    input Clock
    );
    
    wire [3:0] OpA, OpB;
    wire [7:0] Product;
    
    vio_mult vio_m (
  .clk(Clock),                // input wire clk
  .probe_in0(Product),    // input wire [7 : 0] probe_in0
  .probe_out0(OpA),  // output wire [3 : 0] probe_out0
  .probe_out1(OpB)  // output wire [3 : 0] probe_out1
);
    
    multiplier mult(.OpA(OpA),.OpB(OpB),.Product(Product));
    
endmodule
