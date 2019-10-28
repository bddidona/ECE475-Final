`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2018 11:44:59 AM
// Design Name: 
// Module Name: tb_cpu_minimal
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


module tb_cpu_minimal(

    );
    
    reg clk, rst;
    reg [7:0] dbg_control;
    reg [31:0] mem_bus_out;
    wire [31:0] iobus;
    wire [31:0] mem_bus_in, abus, dbg_reg_PC, dbg_reg_IRA;
    wire [7:0] status_indicators;
    wire we_mem, re_mem;
    
    
    
    cpu uut(clk, rst, dbg_control, mem_bus_out, iobus, mem_bus_in, abus, status_indicators, we_mem, re_mem, dbg_reg_PC, dbg_reg_IRA, dbg_reg_MAR, dbg_reg_MBR);
    
    initial begin
    clk = 0;
    rst = 1;
    dbg_control = 1;
    mem_bus_out = 0;
    #100
    rst = 0;
    
    end
    
    
    
    always begin
    clk = ~clk;
    #10;
    end
    
    
    
    
    
endmodule
