vlib work
vlib riviera

vlib riviera/xil_defaultlib
vlib riviera/xpm

vmap xil_defaultlib riviera/xil_defaultlib
vmap xpm riviera/xpm

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../ipstatic" \
"C:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -93 \
"C:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../ipstatic" \
"../../../../Lab5_hw_4_6_8_counter.srcs/sources_1/ip/clk_wiz_8M/clk_wiz_8M_clk_wiz.v" \
"../../../../Lab5_hw_4_6_8_counter.srcs/sources_1/ip/clk_wiz_8M/clk_wiz_8M.v" \

vlog -work xil_defaultlib \
"glbl.v"

