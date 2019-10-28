`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2018 08:51:18 PM
// Design Name: 
// Module Name: alu_32_behavioral
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

module alu_32_behavioral(
    input [7:0] control,
    input [31:0] a,
    input [31:0] b,
    output [31:0] z,
    output [7:0] cc
    );
    reg [31:0] z;
    reg [32:0] zc;
    reg [7:0] cc;
    always @ (control, a, b)
    begin
    //ALU STUFF
    case(control)
        `SETZER: zc = 0;
        `SETONE: zc = 32'b11111111_11111111_11111111_11111111;
        `MVA: zc = a;
        `MVB: zc = b;
        `lNOTA: zc = ~a;
        `lNOTB: zc = ~b;
        `lAND: zc = a & b;
        `lOR: zc = a | b;
        `lXOR: zc = a ^ b;
        `lSHL: zc = a << 1;
        `lSHR: zc = a >> 1;
        `aSHL: zc = b << 1;
        `aSHR: zc = b >> 1;
        `aINCA: zc = a + 1;
        `aINCB: zc = b + 1;
        `aDECA: zc = a - 1;
        `aDECB: zc = b - 1;
        `aADD: zc = a + b;
        `aADDC: zc = a + b + 1;
        `aSUB: zc = a - b;
        `aMULT: zc = a * b;
        `aDIV:  zc = a / b;
        
    endcase
    z = zc[31:0];
    cc[3] = zc[32];
    cc[2] = ~(zc[31] & a[31]);
    cc[1] = zc[31];
    cc[0] = (zc == 0);
    
    end
endmodule
