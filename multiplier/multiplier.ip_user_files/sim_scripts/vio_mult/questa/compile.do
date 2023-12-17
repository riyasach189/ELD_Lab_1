vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib

vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xil_defaultlib -64 "+incdir+../../../../multiplier.srcs/sources_1/ip/vio_mult/hdl/verilog" "+incdir+../../../../multiplier.srcs/sources_1/ip/vio_mult/hdl" \
"../../../../multiplier.srcs/sources_1/ip/vio_mult/sim/vio_mult.v" \


vlog -work xil_defaultlib \
"glbl.v"

