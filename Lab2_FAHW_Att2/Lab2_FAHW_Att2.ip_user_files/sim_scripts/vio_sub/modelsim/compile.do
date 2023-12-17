vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../Lab2_FAHW_Att2.srcs/sources_1/ip/vio_sub/hdl/verilog" "+incdir+../../../../Lab2_FAHW_Att2.srcs/sources_1/ip/vio_sub/hdl" \
"../../../../Lab2_FAHW_Att2.srcs/sources_1/ip/vio_sub/sim/vio_sub.v" \


vlog -work xil_defaultlib \
"glbl.v"

