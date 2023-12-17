`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.09.2023 09:53:19
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
    
    wire Clear;
    wire [8:0] sequence;
    wire [1:0] FSM_state;
    
   vio_0 vio_count (
  .clk(Clk_100M),                // input wire clk
  .probe_in0(sequence),    // input wire [8 : 0] probe_in0
  .probe_in1(FSM_state),    // input wire [1 : 0] probe_in1
  .probe_out0(Clear)  // output wire [0 : 0] probe_out0
);

    top_FSM top(.Clk_100M(Clk_100M),.Clear(Clear),.sequence(sequence),.FSM_state(FSM_state));
    
endmodule
