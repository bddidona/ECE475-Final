`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2018 06:58:05 AM
// Design Name: 
// Module Name: tb_cu
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


`include "opcodes.vh"

module tb_cu();



    reg clk, rst;
    reg [7:0] CCR;
    reg [31:0] IRA;

    wire [3:0] dreg_index;
    wire we_DREG, we_dbus, we_abus, we_iobus, we_IRA, we_IRB, we_PC, inc_PC, we_MAR, we_MBR;
    wire [7:0] w_alu_control;
    wire [4:0] mux_dbus, mux_abus, mux_iobus, mux_alu_a, mux_alu_b;
    reg [7:0] opcode;
    reg runtime;


    cu_combinational control_unit(clk, rst, runtime, CCR, IRA, w_alu_control, we_DREG, we_dbus, we_abus, we_iobus, we_IRA, we_IRB, we_PC, inc_PC, we_MAR, we_MBR, we_aluZ, we_aluCCR, we_mem, re_mem, error_flag, dreg_index, mux_dbus, mux_abus, mux_iobus, mux_alu_a, mux_alu_b, mux_MBR_load);

    initial begin
    clk = 0;
    runtime = 1;
    rst = 1;
    CCR = 0;
    IRA = 32'h11000000;
    #100;
    
    
    
        rst = 0;
    /*
        #100;
        IRA = 32'h10000000;
        */
    
    
    end
    
    always begin
    opcode = IRA[31:24];
    clk = ~clk;
    #10;
    end

endmodule
