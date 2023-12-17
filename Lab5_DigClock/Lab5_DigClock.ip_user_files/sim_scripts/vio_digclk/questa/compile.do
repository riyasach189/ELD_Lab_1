vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib
vlib questa_lib/msim/xpm

vmap xil_defaultlib questa_lib/msim/xil_defaultlib
vmap xpm questa_lib/msim/xpm

vlog -work xil_defaultlib -64 -sv "+incdir+../../../../Lab5_DigClock.srcs/sources_1/ip/vio_digclk/hdl/verilog" "+incdir+../../../../Lab5_DigClock.srcs/sources_1/ip/vio_digclk/hdl" \
"C:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -64 -93 \
"C:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib -64 "+incdir+../../../../Lab5_DigClock.srcs/sources_1/ip/vio_digclk/hdl/verilog" "+incdir+../../../../Lab5_DigClock.srcs/sources_1/ip/vio_digclk/hdl" \
"../../../../Lab5_DigClock.srcs/sources_1/ip/vio_digclk/sim/vio_digclk.v" \


vlog -work xil_defaultlib \
"glbl.v"

