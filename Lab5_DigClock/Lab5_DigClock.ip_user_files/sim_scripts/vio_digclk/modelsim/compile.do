vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/xpm

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap xpm modelsim_lib/msim/xpm

vlog -work xil_defaultlib -64 -incr -sv "+incdir+../../../../Lab5_DigClock.srcs/sources_1/ip/vio_digclk/hdl/verilog" "+incdir+../../../../Lab5_DigClock.srcs/sources_1/ip/vio_digclk/hdl" \
"C:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -64 -93 \
"C:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../Lab5_DigClock.srcs/sources_1/ip/vio_digclk/hdl/verilog" "+incdir+../../../../Lab5_DigClock.srcs/sources_1/ip/vio_digclk/hdl" \
"../../../../Lab5_DigClock.srcs/sources_1/ip/vio_digclk/sim/vio_digclk.v" \


vlog -work xil_defaultlib \
"glbl.v"

