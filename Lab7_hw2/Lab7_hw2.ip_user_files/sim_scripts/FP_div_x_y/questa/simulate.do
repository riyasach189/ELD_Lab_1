onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib FP_div_x_y_opt

do {wave.do}

view wave
view structure
view signals

do {FP_div_x_y.udo}

run -all

quit -force
