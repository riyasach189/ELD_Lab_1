onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib FP_add1_opt

do {wave.do}

view wave
view structure
view signals

do {FP_add1.udo}

run -all

quit -force
