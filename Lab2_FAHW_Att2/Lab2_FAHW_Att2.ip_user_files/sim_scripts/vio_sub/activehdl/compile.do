vlib work
vlib activehdl

vlib activehdl/xil_defaultlib

vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Lab2_FAHW_Att2.srcs/sources_1/ip/vio_sub/hdl/verilog" "+incdir+../../../../Lab2_FAHW_Att2.srcs/sources_1/ip/vio_sub/hdl" \
"../../../../Lab2_FAHW_Att2.srcs/sources_1/ip/vio_sub/sim/vio_sub.v" \


vlog -work xil_defaultlib \
"glbl.v"

