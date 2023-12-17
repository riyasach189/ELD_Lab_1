vlib work
vlib riviera

vlib riviera/xil_defaultlib

vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../multiplier.srcs/sources_1/ip/vio_mult/hdl/verilog" "+incdir+../../../../multiplier.srcs/sources_1/ip/vio_mult/hdl" \
"../../../../multiplier.srcs/sources_1/ip/vio_mult/sim/vio_mult.v" \


vlog -work xil_defaultlib \
"glbl.v"

