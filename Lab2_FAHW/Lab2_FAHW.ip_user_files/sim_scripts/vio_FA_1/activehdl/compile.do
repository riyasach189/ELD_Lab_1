vlib work
vlib activehdl

vlib activehdl/xil_defaultlib

vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Lab2_FAHW.srcs/sources_1/ip/vio_FA_1/hdl/verilog" "+incdir+../../../../Lab2_FAHW.srcs/sources_1/ip/vio_FA_1/hdl" \
"../../../../Lab2_FAHW.srcs/sources_1/ip/vio_FA_1/sim/vio_FA.v" \


vlog -work xil_defaultlib \
"glbl.v"

