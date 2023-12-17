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
    input [31:0] t_data,
    input t_valid,
    output t_ready,
    input [31:0] data2,
    input valid2,
    output ready2,
    output [31:0] M_data,
    output M_valid,
    input M_ready
    );
    
    wire xy_res_valid, xy_res_ready;
    wire [31:0] xy_res_data;
    wire ln_t_valid, ln_t_ready;
    wire [31:0] ln_t_data;
    wire mult_res_valid, mult_res_ready;
    wire [31:0] mult_res_data;
    wire div_res_valid, div_res_ready;
    wire [31:0] div_res_data;
    wire sqrt_res_valid, sqrt_res_ready;
    wire [31:0] sqrt_res_data;
    
    FP_div_x_y div_xy (
  .aclk(Clk_100M),                                  // input wire aclk
  .s_axis_a_tvalid(x_valid),            // input wire s_axis_a_tvalid
  .s_axis_a_tready(x_ready),            // output wire s_axis_a_tready
  .s_axis_a_tdata(x_data),              // input wire [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(y_valid),            // input wire s_axis_b_tvalid
  .s_axis_b_tready(y_ready),            // output wire s_axis_b_tready
  .s_axis_b_tdata(y_data),              // input wire [31 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(xy_res_valid),  // output wire m_axis_result_tvalid
  .m_axis_result_tready(xy_res_ready),  // input wire m_axis_result_tready
  .m_axis_result_tdata(xy_res_data)    // output wire [31 : 0] m_axis_result_tdata
);

    FP_ln ln_t (
  .aclk(Clk_100M),                                  // input wire aclk
  .s_axis_a_tvalid(t_valid),            // input wire s_axis_a_tvalid
  .s_axis_a_tready(t_ready),            // output wire s_axis_a_tready
  .s_axis_a_tdata(t_data),              // input wire [31 : 0] s_axis_a_tdata
  .m_axis_result_tvalid(ln_t_valid),  // output wire m_axis_result_tvalid
  .m_axis_result_tready(ln_t_ready),  // input wire m_axis_result_tready
  .m_axis_result_tdata(ln_t_data)    // output wire [31 : 0] m_axis_result_tdata
);

    FP_mult mult (
  .aclk(Clk_100M),                                  // input wire aclk
  .s_axis_a_tvalid(ln_t_valid),            // input wire s_axis_a_tvalid
  .s_axis_a_tready(ln_t_ready),            // output wire s_axis_a_tready
  .s_axis_a_tdata(ln_t_data),              // input wire [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(valid2),            // input wire s_axis_b_tvalid
  .s_axis_b_tready(ready2),            // output wire s_axis_b_tready
  .s_axis_b_tdata(data2),              // input wire [31 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(mult_res_valid),  // output wire m_axis_result_tvalid
  .m_axis_result_tready(mult_res_ready),  // input wire m_axis_result_tready
  .m_axis_result_tdata(mult_res_data)    // output wire [31 : 0] m_axis_result_tdata
);    

    FP_div div (
  .aclk(Clk_100M),                                  // input wire aclk
  .s_axis_a_tvalid(mult_res_valid),            // input wire s_axis_a_tvalid
  .s_axis_a_tready(mult_res_ready),            // output wire s_axis_a_tready
  .s_axis_a_tdata(mult_res_data),              // input wire [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(y_valid),            // input wire s_axis_b_tvalid
  .s_axis_b_tready(y_ready),            // output wire s_axis_b_tready
  .s_axis_b_tdata(y_data),              // input wire [31 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(div_res_valid),  // output wire m_axis_result_tvalid
  .m_axis_result_tready(div_res_ready),  // input wire m_axis_result_tready
  .m_axis_result_tdata(div_res_data)    // output wire [31 : 0] m_axis_result_tdata
);
    
    FP_sqrt sqrt (
  .aclk(Clk_100M),                                  // input wire aclk
  .s_axis_a_tvalid(div_res_valid),            // input wire s_axis_a_tvalid
  .s_axis_a_tready(div_res_ready),            // output wire s_axis_a_tready
  .s_axis_a_tdata(div_res_data),              // input wire [31 : 0] s_axis_a_tdata
  .m_axis_result_tvalid(sqrt_res_valid),  // output wire m_axis_result_tvalid
  .m_axis_result_tready(sqrt_res_ready),  // input wire m_axis_result_tready
  .m_axis_result_tdata(sqrt_res_data)    // output wire [31 : 0] m_axis_result_tdata
);
    
    FP_add add (
  .aclk(Clk_100M),                                  // input wire aclk
  .s_axis_a_tvalid(sqrt_res_valid),            // input wire s_axis_a_tvalid
  .s_axis_a_tready(sqrt_res_ready),            // output wire s_axis_a_tready
  .s_axis_a_tdata(sqrt_res_data),              // input wire [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(xy_res_valid),            // input wire s_axis_b_tvalid
  .s_axis_b_tready(xy_res_ready),            // output wire s_axis_b_tready
  .s_axis_b_tdata(xy_res_data),              // input wire [31 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(M_valid),  // output wire m_axis_result_tvalid
  .m_axis_result_tready(M_ready),  // input wire m_axis_result_tready
  .m_axis_result_tdata(M_data)    // output wire [31 : 0] m_axis_result_tdata
);
    
endmodule