`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.10.2023 09:28:57
// Design Name: 
// Module Name: sim_arith
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


module sim_arith(
);

    reg M_ready, S_valid, Clk_100M;
    reg [31:0] S_data;
    wire S_ready, M_valid;
    wire [31:0] M_data;
    
    Top_arith t1(.Clk_100M(Clk_100M),.S_data(S_data),.S_valid(S_valid),.S_ready(S_ready),.M_data(M_data),.M_valid(M_valid),.M_ready(M_ready));

    initial
    begin
    M_ready = 0;
    S_valid = 0;
    Clk_100M = 0;
    S_data = 0;
    end
    
    always
    #5 Clk_100M = ~Clk_100M;
    
    initial 
    begin
    #20 S_data = 32'b01000001001000000000000000000000;
    S_valid = 1;
    M_ready = 1;

    while (S_ready == 0)
        S_valid = 1;
    #5 S_valid = 0;
    @(posedge M_valid);
    #5 M_ready = 0;
        
    
    #5 S_data = 32'b01000001101000000000000000000000;
    S_valid = 1;
    M_ready = 1;
    while (S_ready == 0)
        S_valid = 1;     
    #5 S_valid = 0;
    @(posedge M_valid);
    #5 M_ready = 0;
    
    #2000 $stop;
    end

endmodule
