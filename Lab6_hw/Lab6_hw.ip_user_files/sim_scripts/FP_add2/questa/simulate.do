onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib FP_add2_opt

do {wave.do}

view wave
view structure
view signals

do {FP_add2.udo}

run -all

quit -force
