`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2018 03:56:08 AM
// Design Name: 
// Module Name: cu_timing_decoder
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


module cu_tdec(
    input clk, rst, en,
    output [31:0] t_bus
    );
    
    reg [31:0] t_val;
    
    always @ (posedge clk or negedge rst)
    begin
        if (!rst)
        begin
        t_val = 1;
        end
        if (en)
        begin
        t_val = t_val << 1;
        end
        
        
    end
    assign t_bus = t_val;
endmodule
