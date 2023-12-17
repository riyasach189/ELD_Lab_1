// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Tue Sep 19 09:13:55 2023
// Host        : RiyaSachLaptop running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/Riya_Sachdeva/Desktop/ELD_Lab/Lab5_DigClock/Lab5_DigClock.srcs/sources_1/ip/vio_digclk/vio_digclk_stub.v
// Design      : vio_digclk
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "vio,Vivado 2019.1" *)
module vio_digclk(clk, probe_in0, probe_in1, probe_out0)
/* synthesis syn_black_box black_box_pad_pin="clk,probe_in0[5:0],probe_in1[5:0],probe_out0[0:0]" */;
  input clk;
  input [5:0]probe_in0;
  input [5:0]probe_in1;
  output [0:0]probe_out0;
endmodule
