`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2018 08:29:24 PM
// Design Name: 
// Module Name: reg_32_general
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


module reg_32_general(
    input [31:0] d_in,
    output [31:0] data,
    input clk,
    input w_en,
    input rst
    );
    reg [31:0] data;
    always @(posedge clk)
    begin
        if (rst)
            data = 0;
        else if (w_en)
            data = d_in;
    end
endmodule
