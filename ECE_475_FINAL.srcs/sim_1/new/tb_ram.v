`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2018 09:42:56 PM
// Design Name: 
// Module Name: tb_ram
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


module tb_ram(

    );
    reg clk, w_en;
    reg [31:0] addr, d_in;
    wire [31:0] d_out;
    sys_ram_8k uut(clk, w_en, addr, d_in, d_out);
    
    initial begin
    w_en = 0;
    addr = 0;
    d_in = 32;
    clk = 0;
    #100;
    w_en = 1;
    #10;
    w_en=0;
    
    
    end
    
    always begin
    clk = ~clk;
    #10;
    end
    
    
endmodule
