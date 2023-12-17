onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib clk_div_to_8M_opt

do {wave.do}

view wave
view structure
view signals

do {clk_div_to_8M.udo}

run -all

quit -force
