`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.09.2023 08:51:41
// Design Name: 
// Module Name: DigClock
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


module DigClock(
    input Clk_1Hz,
    input reset,
    output [5:0] sec_count,
    output [5:0] min_count
    );
    
    reg [5:0] sec_count_next;
    reg [5:0] sec_count_reg = 0;
    reg [5:0] min_count_next;
    reg [5:0] min_count_reg = 0;
    
    always@(posedge Clk_1Hz or posedge reset)
    begin
        if (reset)
            sec_count_reg <= 0;
        else
            sec_count_reg <= sec_count_next;
    end
    
    always@(*)
    begin
        if (sec_count_reg == 59)
            sec_count_next = 0;
        else
            sec_count_next = sec_count_reg + 1;
    end
    
    always@(posedge Clk_1Hz or posedge reset)
    begin
        if (reset)
            min_count_reg <= 0;
        else
            min_count_reg <= min_count_next;
    end
    
    always@(*)
    begin
        if (sec_count_reg == 59)
            if (min_count_reg == 59)
                min_count_next = 0;
            else 
                min_count_next = min_count_reg + 1;
        else
            min_count_next = min_count_reg;    
    end 
    
    assign sec_count = sec_count_reg;
    assign min_count = min_count_reg;  
    
endmodule
