`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2018 07:44:15 PM
// Design Name: 
// Module Name: tb_tdec
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


module tb_tdec(

    );
    reg clk, rst, en;
    wire [31:0] t_bus;
    integer i;
    
    initial begin
    rst = 0;
    en = 1;
    clk = 0;
    #50
    rst = 1;
    #50
    for (i=0; i < 127; i = i + 1)
    begin
    clk = ~clk;
    #10;
    end
    end
    
    cu_tdec uut(clk, rst, en,t_bus);
endmodule
