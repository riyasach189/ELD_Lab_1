// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Tue Nov 21 09:31:15 2023
// Host        : RiyaSachLaptop running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/Riya_Sachdeva/Desktop/ELD_Lab/Lab11_Multi_Stream/Lab11_Multi_Stream.srcs/sources_1/bd/design_1/ip/design_1_floating_point_0_0/design_1_floating_point_0_0_stub.v
// Design      : design_1_floating_point_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "floating_point_v7_1_8,Vivado 2019.1" *)
module design_1_floating_point_0_0(aclk, aresetn, s_axis_a_tvalid, 
  s_axis_a_tready, s_axis_a_tdata, s_axis_a_tlast, m_axis_result_tvalid, 
  m_axis_result_tready, m_axis_result_tdata, m_axis_result_tlast)
/* synthesis syn_black_box black_box_pad_pin="aclk,aresetn,s_axis_a_tvalid,s_axis_a_tready,s_axis_a_tdata[31:0],s_axis_a_tlast,m_axis_result_tvalid,m_axis_result_tready,m_axis_result_tdata[31:0],m_axis_result_tlast" */;
  input aclk;
  input aresetn;
  input s_axis_a_tvalid;
  output s_axis_a_tready;
  input [31:0]s_axis_a_tdata;
  input s_axis_a_tlast;
  output m_axis_result_tvalid;
  input m_axis_result_tready;
  output [31:0]m_axis_result_tdata;
  output m_axis_result_tlast;
endmodule
