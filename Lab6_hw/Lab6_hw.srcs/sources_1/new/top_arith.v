`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.10.2023 09:57:17
// Design Name: 
// Module Name: top_arith
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


module top_arith(
    input Clk_100M,
    input [31:0] x_data,
    input x_valid,
    output x_ready,
    input [31:0] y_data,
    input y_valid,
    output y_ready,
    input [31:0] param_data,
    input param_valid,
    output param_ready,
    output [31:0] M_data,
    output M_valid,
    input M_ready
    );
    
    wire [31:0] x_sqrt_data, y_ln_data, y_recp_data, result1_data;
    wire x_sqrt_ready, x_sqrt_valid;
    wire y_ln_ready, y_ln_valid, y_recp_valid, y_recp_ready;
    wire result1_valid, result1_ready;
    
    FP_sqrt sqrt_x (
  .aclk(Clk_100M),                                  // input wire aclk
  .s_axis_a_tvalid(x_valid),            // input wire s_axis_a_tvalid
  .s_axis_a_tready(x_ready),            // output wire s_axis_a_tready
  .s_axis_a_tdata(x_data),              // input wire [31 : 0] s_axis_a_tdata
  .m_axis_result_tvalid(x_sqrt_valid),  // output wire m_axis_result_tvalid
  .m_axis_result_tready(x_sqrt_ready),  // input wire m_axis_result_tready
  .m_axis_result_tdata(x_sqrt_data)    // output wire [31 : 0] m_axis_result_tdata
);

    FP_ln ln_y (
  .aclk(Clk_100M),                                  // input wire aclk
  .s_axis_a_tvalid(y_valid),            // input wire s_axis_a_tvalid
  .s_axis_a_tready(y_ready),            // output wire s_axis_a_tready
  .s_axis_a_tdata(y_data),              // input wire [31 : 0] s_axis_a_tdata
  .m_axis_result_tvalid(y_ln_valid),  // output wire m_axis_result_tvalid
  .m_axis_result_tready(y_ln_ready),  // input wire m_axis_result_tready
  .m_axis_result_tdata(y_ln_data)    // output wire [31 : 0] m_axis_result_tdata
);    

    FP_recp recp_y (
  .aclk(Clk_100M),                                  // input wire aclk
  .s_axis_a_tvalid(y_ln_valid),            // input wire s_axis_a_tvalid
  .s_axis_a_tready(y_ln_ready),            // output wire s_axis_a_tready
  .s_axis_a_tdata(y_ln_data),              // input wire [31 : 0] s_axis_a_tdata
  .m_axis_result_tvalid(y_recp_valid),  // output wire m_axis_result_tvalid
  .m_axis_result_tready(y_recp_ready),  // input wire m_axis_result_tready
  .m_axis_result_tdata(y_recp_data)    // output wire [31 : 0] m_axis_result_tdata
);

    FP_add1 add1 (
  .aclk(Clk_100M),                                  // input wire aclk
  .s_axis_a_tvalid(x_sqrt_valid),            // input wire s_axis_a_tvalid
  .s_axis_a_tready(x_sqrt_ready),            // output wire s_axis_a_tready
  .s_axis_a_tdata(x_sqrt_data),              // input wire [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(y_recp_valid),            // input wire s_axis_b_tvalid
  .s_axis_b_tready(y_recp_ready),            // output wire s_axis_b_tready
  .s_axis_b_tdata(y_recp_data),              // input wire [31 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(result1_valid),  // output wire m_axis_result_tvalid
  .m_axis_result_tready(result1_ready),  // input wire m_axis_result_tready
  .m_axis_result_tdata(result1_data)    // output wire [31 : 0] m_axis_result_tdata
);

    FP_add2 add2 (
  .aclk(Clk_100M),                                  // input wire aclk
  .s_axis_a_tvalid(result1_valid),            // input wire s_axis_a_tvalid
  .s_axis_a_tready(result1_ready),            // output wire s_axis_a_tready
  .s_axis_a_tdata(result1_data),              // input wire [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(param_valid),            // input wire s_axis_b_tvalid
  .s_axis_b_tready(param_ready),            // output wire s_axis_b_tready
  .s_axis_b_tdata(param_data),              // input wire [31 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(M_valid),  // output wire m_axis_result_tvalid
  .m_axis_result_tready(M_ready),  // input wire m_axis_result_tready
  .m_axis_result_tdata(M_data)    // output wire [31 : 0] m_axis_result_tdata
);
    
endmodule
