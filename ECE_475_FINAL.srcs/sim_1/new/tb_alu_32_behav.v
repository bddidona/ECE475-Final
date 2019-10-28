`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2018 03:06:01 PM
// Design Name: 
// Module Name: tb_alu_32_behav
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


module tb_alu_32_behav();
    
    reg [31:0] AA, BB;
    wire [31:0] ZZ;
    reg [7:0] OPR;
    wire [7:0] CCC;
    
    
    initial begin
    assign AA = 32'b00000000000000000000000000000010;
    assign BB = 32'b00000000000000000000000001011011;
    OPR = 0;
    end
    
    always begin
    #100;
    OPR = OPR + 1;
    end
    
    alu_32_behavioral UUT(OPR, AA, BB, ZZ, CCC);
    
endmodule
