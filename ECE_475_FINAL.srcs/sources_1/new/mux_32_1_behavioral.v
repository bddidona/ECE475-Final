`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2018 01:47:46 AM
// Design Name: 
// Module Name: mux_32_1_behavioral
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


module mux_32_1_behavioral(
    input [31:0] DATA,
    input [5:0] SEL,
    output OUT
    );
    reg OUT;
    
    always
    begin
    
    OUT <= DATA[SEL];
    
    
    end
endmodule
