`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2018 12:37:03 AM
// Design Name: 
// Module Name: half_adder
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

module full_adder(A,B,Cin,S,Cout);
input A, B, Cin;
output S, Cout;
wire w0, w1, w2;
half_adder ha0(A, B, w0, w1);
half_adder ha1(Cin, w0, S, w2);
or(Cout, w1, w2);
endmodule