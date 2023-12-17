-makelib xcelium_lib/xil_defaultlib -sv \
  "C:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "C:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../../Lab5_hw_4_6_8_counter.srcs/sources_1/ip/clk_wiz_8M/clk_wiz_8M_clk_wiz.v" \
  "../../../../Lab5_hw_4_6_8_counter.srcs/sources_1/ip/clk_wiz_8M/clk_wiz_8M.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

