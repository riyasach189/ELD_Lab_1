vlib work
vlib riviera

vlib riviera/xil_defaultlib

vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Lab2_FAHW.srcs/sources_1/ip/vio_subtractor/hdl/verilog" "+incdir+../../../../Lab2_FAHW.srcs/sources_1/ip/vio_subtractor/hdl" \
"../../../../Lab2_FAHW.srcs/sources_1/ip/vio_subtractor/sim/vio_subtractor.v" \


vlog -work xil_defaultlib \
"glbl.v"

