`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2018 08:51:18 PM
// Design Name: 
// Module Name: alu_32_structural
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
`include "alu_control_signals.vh"

module alu_32_structural(
    input [7:0] OPR,
    input [31:0] A,
    input [31:0] B,
    output [31:0] Z,
    output [7:0] CC
    );
    wire [31:0] output_value[15:0], Z;
    reg [7:0] CC;
    
    
    assign 
    
    mux_32_1_behavioral vsel(output_value[15:0][0], OPR, Z[0]);
    
endmodule
