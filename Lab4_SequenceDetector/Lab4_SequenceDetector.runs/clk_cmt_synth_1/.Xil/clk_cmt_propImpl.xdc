set_property SRC_FILE_INFO {cfile:c:/Users/Riya_Sachdeva/Desktop/ELD_Lab/Lab4_SequenceDetector/Lab4_SequenceDetector.srcs/sources_1/ip/clk_cmt/clk_cmt.xdc rfile:../../../Lab4_SequenceDetector.srcs/sources_1/ip/clk_cmt/clk_cmt.xdc id:1 order:EARLY scoped_inst:inst} [current_design]
current_instance inst
set_property src_info {type:SCOPED_XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports Clk_100M]] 0.1
