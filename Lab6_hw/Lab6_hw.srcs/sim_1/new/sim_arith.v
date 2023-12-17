`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.10.2023 12:49:31
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
    
    reg M_ready, x_valid, y_valid, param_valid, Clk_100M;
    reg [31:0] x_data, y_data, param_data;
    wire x_ready, y_ready, param_ready, M_valid;
    wire [31:0] M_data;
    
    top_arith t1(.Clk_100M(Clk_100M),.x_data(x_data),.x_valid(x_valid),.x_ready(x_ready),.y_data(y_data),.y_valid(y_valid),.y_ready(y_ready),.param_data(param_data),.param_valid(param_valid),.param_ready(param_ready),.M_data(M_data),.M_valid(M_valid),.M_ready(M_ready));

    initial
    begin
    M_ready = 0;
    x_valid = 0;
    y_valid = 0;
    param_valid = 0;
    Clk_100M = 0;
    x_data = 0;
    y_data = 0;
    param_data = 0;
    end
    
    always
    #5 Clk_100M = ~Clk_100M;
    
    initial 
    begin
    #20 x_data = 32'b01000001000100000000000000000000;
    x_valid = 1;
    M_ready = 1;

    while (x_ready == 0)
        x_valid = 1;
        
    #5 x_valid = 0;
    
    @(posedge M_valid);
    #5 M_ready = 0;
    end
    
    initial 
    begin
    #20 y_data = 32'b01000001001000000000000000000000;
    y_valid = 1;

    while (y_ready == 0)
        y_valid = 1;
        
    #5 y_valid = 0;
    end
    
    initial 
    begin
    #20 param_data = 32'b00111111110000000000000000000000;
    param_valid = 1;

    while (param_ready == 0)
        param_valid = 1;
        
    #5 param_valid = 0;
    end
    
endmodule
