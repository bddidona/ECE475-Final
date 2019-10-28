`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2018 02:21:04 PM
// Design Name: 
// Module Name: system_top
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


module system_top(
    input clk,
    //input [7:0] dbg_control,
    input [15:0] switches,
            input [5:0]  buttons,
            output [15:0] led_array,
            //output [2:0] rgb_led0, rgb_led1,
            output [7:0] AN,
            output [7:0] CA
    );
    
    wire [31:0] mem_bus_in, iobus, mem_bus_out, mar;
    wire we_mem, re_mem;
    wire rst_sig;
    
    wire [31:0] data_io_in;
    wire [15:0] device_select, switches_outl, led_array;
    wire [2:0] rgb_led0, rgb_led1;
    wire [7:0] status, AN, CA;
    reg div_clk;
    reg [31:0] clk_count = 0;
    reg dbg_control = 1;
    wire [31:0] dbg_reg_PC, dbg_reg_IRA, dbg_reg_MAR, dbg_reg_MBR, dbg_reg_IRB, dbg_reg_ALUZ;
    wire [15:0] dbg_reg_CCR;
    
    
    bsp_io io0(div_clk,status, data_io_in,device_select,switches,buttons,led_array,rgb_led0, rgb_led1,AN,CA,rst_sig,dbg_reg_PC, dbg_reg_IRA, dbg_reg_MAR, dbg_reg_MBR, dbg_reg_IRB, dbg_reg_ALUZ, dbg_reg_CCR);
    sys_ram_8k ram0(div_clk, we_mem, mar, mem_bus_out, mem_bus_in);
    cpu cpu0(div_clk,rst_sig,dbg_control,mem_bus_in,iobus,mem_bus_out, mar,status,we_mem, re_mem, dbg_reg_PC, dbg_reg_IRA, dbg_reg_MAR, dbg_reg_MBR, dbg_reg_IRB, dbg_reg_ALUZ, dbg_reg_CCR);
    
    always @ (posedge clk) begin
    clk_count = clk_count + 1;
    if (clk_count > 10000000) begin
        div_clk = 1;
    end
    if (clk_count == 20000000) begin
        div_clk = 0;
        clk_count = 0;
    end
    
    end
    
endmodule
