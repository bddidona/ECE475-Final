`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2018 01:55:53 AM
// Design Name: 
// Module Name: alu_1_structural
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


module alu_1_structural(
    input A,
    input B,
    input Cin,
    input [7:0] OPR,
    output Z,
    output Cout
    );
    wire result;
    wire [31:0] result_value;
    wire [4:0] OPR_VALID;
    wire cin_flag, w0, w1, w2, w3, w4, w5, w6, w7;
    
    assign OPR_VALID = OPR[4:0];
    assign result_value[0] = 1'b0;
    assign result_value[1] = 1'b1;
    
    not NOTA(w0, A);
    not NOTB(w1, B);
    not NOTC(cin_flag, OPR[0]);
    
    and AND0(w2, A, B); 
    or OR0(w3, A, B);
    xor XOR0(w4, A, B);
    nand NAND0(w5, A, B);
    nor NOR0(w6, A, B);
    
    full_adder FA0(A, B, cin_flag, w7, Cout);
    full_adder FS0(A, B, 0, w8, Cout);
    
    
    
    
    
    mux_32_1_behavioral rsel(result_value, OPR_VALID, result);
    assign Z = result;
    
endmodule
