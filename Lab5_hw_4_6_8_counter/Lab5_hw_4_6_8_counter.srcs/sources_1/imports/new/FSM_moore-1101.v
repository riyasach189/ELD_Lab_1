`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.09.2023 09:23:52
// Design Name: 
// Module Name: FSM_moore_1101
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


module FSM(
    input Clear,
    input Clk_1Hz,
    output [1:0] FSM_state,
    output reg [8:0] sequence,
    output Detect;
    );
    
    parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;
    reg [1:0] present_state = S0; //is output of ff; can be initialized
    reg [1:0] next_state;
    
    always@(posedge Clk_1Hz or posedge Clear)
    begin
        if(Clear)
            present_state <= S0;
        else
            present_state <= next_state;
    end
    
    always@(*)
    begin
    case(present_state)
        S0: next_state = S1;
            
        S1: next_state = S2;
                
        S2: next_state = S3;
        
        S3: next_state = S0;
                
        default next_state = S0;      
    endcase
    end
    
    always@(*)
    begin
        if (present_state == S0)
            sequence = 500;
        else if (present_state == S1)
            sequence = 2;
        else if (present_state == S2)
            sequence = 9;
        else if (present_state == S3)
            sequence = 16;
        else
            sequence = 500;
    end
    
    assign FSM_state = present_state;
    
    assign Detect = ((sequence==500) | (sequence==9));
    
endmodule
