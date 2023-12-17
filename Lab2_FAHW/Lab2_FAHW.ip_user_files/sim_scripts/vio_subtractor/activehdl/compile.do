vlib work
vlib activehdl

vlib activehdl/xil_defaultlib

vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Lab2_FAHW.srcs/sources_1/ip/vio_subtractor/hdl/verilog" "+incdir+../../../../Lab2_FAHW.srcs/sources_1/ip/vio_subtractor/hdl" \
"../../../../Lab2_FAHW.srcs/sources_1/ip/vio_subtractor/sim/vio_subtractor.v" \


vlog -work xil_defaultlib \
"glbl.v"

