#If required use the below command and launch symbol server from an external shell.
#symbol_server.bat -S -s tcp::1534
connect -path [list tcp::1534 tcp:192.168.226.142:52063]
source C:/Users/Riya_Sachdeva/Desktop/ELD_Lab/FFT_HP_Port/FFT_HP_Port.sdk/design_1_wrapper_hw_platform_0/ps7_init.tcl
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent Zybo Z7 210351A78190A"} -index 0
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent Zybo Z7 210351A78190A" && level==0} -index 1
fpga -file C:/Users/Riya_Sachdeva/Desktop/ELD_Lab/FFT_HP_Port/FFT_HP_Port.sdk/design_1_wrapper_hw_platform_0/design_1_wrapper.bit
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent Zybo Z7 210351A78190A"} -index 0
loadhw -hw C:/Users/Riya_Sachdeva/Desktop/ELD_Lab/FFT_HP_Port/FFT_HP_Port.sdk/design_1_wrapper_hw_platform_0/system.hdf -mem-ranges [list {0x40000000 0xbfffffff}]
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent Zybo Z7 210351A78190A"} -index 0
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent Zybo Z7 210351A78190A"} -index 0
dow C:/Users/Riya_Sachdeva/Desktop/ELD_Lab/FFT_HP_Port/FFT_HP_Port.sdk/FFT_HP_Port/Debug/FFT_HP_Port.elf
configparams force-mem-access 0
bpadd -addr &main
