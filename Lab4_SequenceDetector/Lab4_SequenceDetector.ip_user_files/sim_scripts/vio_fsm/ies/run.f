-makelib ies_lib/xil_defaultlib -sv \
  "C:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
-endlib
-makelib ies_lib/xpm \
  "C:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../../Lab4_SequenceDetector.srcs/sources_1/ip/vio_fsm/sim/vio_fsm.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

