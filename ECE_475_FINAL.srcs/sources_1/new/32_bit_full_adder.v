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


module full_adder_32_bit(A, B, Cin, S, Cout);
input [31:0] A, B;
input Cin;
output [31:0] S;
output Cout;
wire [31:0] c_sig;

full_adder fa0(.A(A[0]),.B(B[0]),.Cin(Cin),.S(S[0]),.Cout(c_sig[0]));
full_adder fa1(.A(A[1]),.B(B[1]),.Cin(c_sig[0]),.S(S[1]),.Cout(c_sig[1]));
full_adder fa2(.A(A[2]),.B(B[2]),.Cin(c_sig[1]),.S(S[2]),.Cout(c_sig[2]));
full_adder fa3(.A(A[3]),.B(B[3]),.Cin(c_sig[2]),.S(S[3]),.Cout(c_sig[3]));
full_adder fa4(.A(A[4]),.B(B[4]),.Cin(c_sig[3]),.S(S[4]),.Cout(c_sig[4]));
full_adder fa5(.A(A[5]),.B(B[5]),.Cin(c_sig[4]),.S(S[5]),.Cout(c_sig[5]));
full_adder fa6(.A(A[6]),.B(B[6]),.Cin(c_sig[5]),.S(S[6]),.Cout(c_sig[6]));
full_adder fa7(.A(A[7]),.B(B[7]),.Cin(c_sig[6]),.S(S[7]),.Cout(c_sig[7]));
full_adder fa8(.A(A[8]),.B(B[8]),.Cin(c_sig[7]),.S(S[8]),.Cout(c_sig[8]));
full_adder fa9(.A(A[9]),.B(B[9]),.Cin(c_sig[8]),.S(S[9]),.Cout(c_sig[9]));
full_adder fa10(.A(A[10]),.B(B[10]),.Cin(c_sig[9]),.S(S[10]),.Cout(c_sig[10]));
full_adder fa11(.A(A[11]),.B(B[11]),.Cin(c_sig[10]),.S(S[11]),.Cout(c_sig[11]));
full_adder fa12(.A(A[12]),.B(B[12]),.Cin(c_sig[11]),.S(S[12]),.Cout(c_sig[12]));
full_adder fa13(.A(A[13]),.B(B[13]),.Cin(c_sig[12]),.S(S[13]),.Cout(c_sig[13]));
full_adder fa14(.A(A[14]),.B(B[14]),.Cin(c_sig[13]),.S(S[14]),.Cout(c_sig[14]));
full_adder fa15(.A(A[15]),.B(B[15]),.Cin(c_sig[14]),.S(S[15]),.Cout(c_sig[15]));
full_adder fa16(.A(A[16]),.B(B[16]),.Cin(c_sig[15]),.S(S[16]),.Cout(c_sig[16]));
full_adder fa17(.A(A[17]),.B(B[17]),.Cin(c_sig[16]),.S(S[17]),.Cout(c_sig[17]));
full_adder fa18(.A(A[18]),.B(B[18]),.Cin(c_sig[17]),.S(S[18]),.Cout(c_sig[18]));
full_adder fa19(.A(A[19]),.B(B[19]),.Cin(c_sig[18]),.S(S[19]),.Cout(c_sig[19]));
full_adder fa20(.A(A[20]),.B(B[20]),.Cin(c_sig[19]),.S(S[20]),.Cout(c_sig[20]));
full_adder fa21(.A(A[21]),.B(B[21]),.Cin(c_sig[20]),.S(S[21]),.Cout(c_sig[21]));
full_adder fa22(.A(A[22]),.B(B[22]),.Cin(c_sig[21]),.S(S[22]),.Cout(c_sig[22]));
full_adder fa23(.A(A[23]),.B(B[23]),.Cin(c_sig[22]),.S(S[23]),.Cout(c_sig[23]));
full_adder fa24(.A(A[24]),.B(B[24]),.Cin(c_sig[23]),.S(S[24]),.Cout(c_sig[24]));
full_adder fa25(.A(A[25]),.B(B[25]),.Cin(c_sig[24]),.S(S[25]),.Cout(c_sig[25]));
full_adder fa26(.A(A[26]),.B(B[26]),.Cin(c_sig[25]),.S(S[26]),.Cout(c_sig[26]));
full_adder fa27(.A(A[27]),.B(B[27]),.Cin(c_sig[26]),.S(S[27]),.Cout(c_sig[27]));
full_adder fa28(.A(A[28]),.B(B[28]),.Cin(c_sig[27]),.S(S[28]),.Cout(c_sig[28]));
full_adder fa29(.A(A[29]),.B(B[29]),.Cin(c_sig[28]),.S(S[29]),.Cout(c_sig[29]));
full_adder fa30(.A(A[30]),.B(B[30]),.Cin(c_sig[29]),.S(S[30]),.Cout(c_sig[30]));
full_adder fa31(.A(A[31]),.B(B[31]),.Cin(c_sig[30]),.S(S[31]),.Cout(c_sig[31]));

assign Cout = c_sig[31];

endmodule