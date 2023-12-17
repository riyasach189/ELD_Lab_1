vlib work
vlib activehdl

vlib activehdl/xil_defaultlib

vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../multiplier.srcs/sources_1/ip/vio_mult/hdl/verilog" "+incdir+../../../../multiplier.srcs/sources_1/ip/vio_mult/hdl" \
"../../../../multiplier.srcs/sources_1/ip/vio_mult/sim/vio_mult.v" \


vlog -work xil_defaultlib \
"glbl.v"

