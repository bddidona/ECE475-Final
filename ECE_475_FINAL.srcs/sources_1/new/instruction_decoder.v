`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2018 01:55:36 PM
// Design Name: 
// Module Name: instruction_decoder
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
`include "alu_control_signals.vh"

module cu_idec(
input   [31:0]   instruction,
output  [255:0]  dec_instruction,
output  [7:0]    dec_cfg
    );
    
    reg [255:0] dec_signal;
    reg [7:0] dec_cfg_signal;
    wire [7:0] opcode = instruction[31:24];
    wire [3:0] addr_mode = instruction[23:0];
    wire [8:0] dest_reg  = instruction[19:12];
    wire [8:0] src_reg = instruction[11:3];
    wire [4:0] dbg_ctrl = instruction[3:0];
    
    always @ (instruction)
    begin
    
    end
    
endmodule
