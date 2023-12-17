vlib work
vlib riviera

vlib riviera/xil_defaultlib

vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Lab2_FAHW.srcs/sources_1/ip/vio_FA_1/hdl/verilog" "+incdir+../../../../Lab2_FAHW.srcs/sources_1/ip/vio_FA_1/hdl" \
"../../../../Lab2_FAHW.srcs/sources_1/ip/vio_FA_1/sim/vio_FA.v" \


vlog -work xil_defaultlib \
"glbl.v"

