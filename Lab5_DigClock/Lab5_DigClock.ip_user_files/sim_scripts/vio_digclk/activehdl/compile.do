vlib work
vlib activehdl

vlib activehdl/xil_defaultlib
vlib activehdl/xpm

vmap xil_defaultlib activehdl/xil_defaultlib
vmap xpm activehdl/xpm

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../Lab5_DigClock.srcs/sources_1/ip/vio_digclk/hdl/verilog" "+incdir+../../../../Lab5_DigClock.srcs/sources_1/ip/vio_digclk/hdl" \
"C:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -93 \
"C:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Lab5_DigClock.srcs/sources_1/ip/vio_digclk/hdl/verilog" "+incdir+../../../../Lab5_DigClock.srcs/sources_1/ip/vio_digclk/hdl" \
"../../../../Lab5_DigClock.srcs/sources_1/ip/vio_digclk/sim/vio_digclk.v" \


vlog -work xil_defaultlib \
"glbl.v"

