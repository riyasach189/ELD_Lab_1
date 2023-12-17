`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2023 09:29:34
// Design Name: 
// Module Name: sim_fft
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module sim_fft(
    );
    
    reg Clk_100M, aresetn, aclken;
    reg [7:0] c_data;
    reg c_valid;
    wire c_ready;
    reg [63:0] ffti_data;
    reg ffti_valid;
    wire ffti_ready;
    reg ffti_last;
    reg ffto_ready;
    wire ffto_valid, ffto_last;
    wire [63:0] ffto_data;
    wire event_frame_started, event_tlast_unexpected, event_tlast_missing;
    wire event_status_channel_halt;
    wire event_data_in_channel_halt;
    wire event_data_out_channel_halt;
    
    initial begin
        Clk_100M = 0;
        aresetn = 0;
        aclken = 0;
        c_valid = 0;
        ffti_last = 0;
        ffti_valid = 0;
        ffto_ready = 0;
        c_data = 0;
        ffti_data = 0;
    end

    always
    #5 Clk_100M = ~Clk_100M;
    
    initial begin
        #50 aresetn = 1;
        aclken = 1;
        #20 c_data = 1;
        c_valid = 1;
        
        while (c_ready == 0)
            #2 c_valid = 1;
            
       #10 c_valid = 0;
    end
    
    reg [31:0] inp_data_r [31:0];
    reg [31:0] inp_data_im [31:0];
    
    initial begin
        inp_data_r[0] = 32'b00111111100000000000000000000000;
        inp_data_r[1] = 32'b00000000000000000000000000000000;
        inp_data_r[2] = 32'b00000000000000000000000000000000;
        inp_data_r[3] = 32'b00000000000000000000000000000000;
        inp_data_r[4] = 32'b00000000000000000000000000000000;
        inp_data_r[5] = 32'b00000000000000000000000000000000;
        inp_data_r[6] = 32'b00000000000000000000000000000000;
        inp_data_r[7] = 32'b00000000000000000000000000000000;
        inp_data_r[8] = 32'b00000000000000000000000000000000;
        inp_data_r[9] = 32'b00000000000000000000000000000000;
        inp_data_r[10] = 32'b00000000000000000000000000000000;
        inp_data_r[11] = 32'b00000000000000000000000000000000;
        inp_data_r[12] = 32'b00000000000000000000000000000000;
        inp_data_r[13] = 32'b00000000000000000000000000000000;
        inp_data_r[14] = 32'b00000000000000000000000000000000;
        inp_data_r[15] = 32'b00000000000000000000000000000000;
        inp_data_r[16] = 32'b00000000000000000000000000000000;
        inp_data_r[17] = 32'b00000000000000000000000000000000;
        inp_data_r[18] = 32'b00000000000000000000000000000000;
        inp_data_r[19] = 32'b00000000000000000000000000000000;
        inp_data_r[20] = 32'b00000000000000000000000000000000;
        inp_data_r[21] = 32'b00000000000000000000000000000000;
        inp_data_r[22] = 32'b00000000000000000000000000000000;
        inp_data_r[23] = 32'b00000000000000000000000000000000;
        inp_data_r[24] = 32'b00000000000000000000000000000000;
        inp_data_r[25] = 32'b00000000000000000000000000000000;
        inp_data_r[26] = 32'b00000000000000000000000000000000;
        inp_data_r[27] = 32'b00000000000000000000000000000000;
        inp_data_r[28] = 32'b00000000000000000000000000000000;
        inp_data_r[29] = 32'b00000000000000000000000000000000;
        inp_data_r[30] = 32'b00000000000000000000000000000000;
        inp_data_r[31] = 32'b00000000000000000000000000000000;
        
        inp_data_im[0] = 32'b00000000000000000000000000000000;
        inp_data_im[1] = 32'b00000000000000000000000000000000;
        inp_data_im[2] = 32'b00000000000000000000000000000000;
        inp_data_im[3] = 32'b00000000000000000000000000000000;
        inp_data_im[4] = 32'b00000000000000000000000000000000;
        inp_data_im[5] = 32'b00000000000000000000000000000000;
        inp_data_im[6] = 32'b00000000000000000000000000000000;
        inp_data_im[7] = 32'b00000000000000000000000000000000;
        inp_data_im[8] = 32'b00000000000000000000000000000000;
        inp_data_im[9] = 32'b00000000000000000000000000000000;
        inp_data_im[10] = 32'b00000000000000000000000000000000;
        inp_data_im[11] = 32'b00000000000000000000000000000000;
        inp_data_im[12] = 32'b00000000000000000000000000000000;
        inp_data_im[13] = 32'b00000000000000000000000000000000;
        inp_data_im[14] = 32'b00000000000000000000000000000000;
        inp_data_im[15] = 32'b00000000000000000000000000000000;
        inp_data_im[16] = 32'b00000000000000000000000000000000;
        inp_data_im[17] = 32'b00000000000000000000000000000000;
        inp_data_im[18] = 32'b00000000000000000000000000000000;
        inp_data_im[19] = 32'b00000000000000000000000000000000;
        inp_data_im[20] = 32'b00000000000000000000000000000000;
        inp_data_im[21] = 32'b00000000000000000000000000000000;
        inp_data_im[22] = 32'b00000000000000000000000000000000;
        inp_data_im[23] = 32'b00000000000000000000000000000000;
        inp_data_im[24] = 32'b00000000000000000000000000000000;
        inp_data_im[25] = 32'b00000000000000000000000000000000;
        inp_data_im[26] = 32'b00000000000000000000000000000000;
        inp_data_im[27] = 32'b00000000000000000000000000000000;
        inp_data_im[28] = 32'b00000000000000000000000000000000;
        inp_data_im[29] = 32'b00000000000000000000000000000000;
        inp_data_im[30] = 32'b00000000000000000000000000000000;
        inp_data_im[31] = 32'b00000000000000000000000000000000;
    end
    
    integer i;
    initial begin
        #100 for(i = 31; i >= 0; i=i-1)
        begin
            if (i==0)
                ffti_last = 1;
                
            ffti_data = {inp_data_im[i], inp_data_r[i]};
            ffti_valid = 1;
            
            while (ffti_ready == 0)
                #2 ffti_valid = 1;
            #10 ffti_valid = 0;
            ffti_last = 0;
        end
    end
    
    reg [31:0] outp_data_r [31:0];
    reg [31:0] outp_data_im [31:0];
    integer j;
    
    initial begin
        ffto_ready = 1;
        for(j = 31; j >= 0; j=j-1)
        begin
            #5 ffto_ready = 1;
            wait (ffto_valid == 1);
            //    #2 ffto_ready = 1;
                
            {outp_data_im[j], outp_data_r[j]} = ffto_data;
            
            #10 ffto_ready = 0;
        end
    end
    
    xfft_8 fft_32 (
  .aclk(Clk_100M),                                                // input wire aclk
  .aclken(aclken),                                            // input wire aclken
  .aresetn(aresetn),                                          // input wire aresetn
  .s_axis_config_tdata(c_data),                  // input wire [7 : 0] s_axis_config_tdata
  .s_axis_config_tvalid(c_valid),                // input wire s_axis_config_tvalid
  .s_axis_config_tready(c_ready),                // output wire s_axis_config_tready
  .s_axis_data_tdata(ffti_data),                      // input wire [63 : 0] s_axis_data_tdata
  .s_axis_data_tvalid(ffti_valid),                    // input wire s_axis_data_tvalid
  .s_axis_data_tready(ffti_ready),                    // output wire s_axis_data_tready
  .s_axis_data_tlast(ffti_last),                      // input wire s_axis_data_tlast
  .m_axis_data_tdata(ffto_data),                      // output wire [63 : 0] m_axis_data_tdata
  .m_axis_data_tvalid(ffto_valid),                    // output wire m_axis_data_tvalid
  .m_axis_data_tready(ffto_ready),                    // input wire m_axis_data_tready
  .m_axis_data_tlast(ffto_last),                      // output wire m_axis_data_tlast
  .event_frame_started(event_frame_started),                  // output wire event_frame_started
  .event_tlast_unexpected(event_tlast_unexpected),            // output wire event_tlast_unexpected
  .event_tlast_missing(event_tlast_missing),                  // output wire event_tlast_missing
  .event_status_channel_halt(event_status_channel_halt),      // output wire event_status_channel_halt
  .event_data_in_channel_halt(event_data_in_channel_halt),    // output wire event_data_in_channel_halt
  .event_data_out_channel_halt(event_data_out_channel_halt)  // output wire event_data_out_channel_halt
);
endmodule
