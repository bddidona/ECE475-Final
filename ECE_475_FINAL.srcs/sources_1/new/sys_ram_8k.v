`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2018 09:48:00 PM
// Design Name: 
// Module Name: sys_ram_8k
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


module sys_ram_8k(
    input clk, w_en,
    input [31:0] addr, d_in,
    output [mem_width-1:0] d_out
    );
    
    parameter mem_width = 32;
    parameter addr_width = 8;
    parameter mem_depth = 1 << addr_width;
    
    reg [mem_width-1:0] d_out;
    reg [mem_width-1:0] mem [0:mem_depth-1];

    initial begin
        $readmemb("mem_8k.mem", mem);
    end
    
    always @ (posedge clk) begin
    d_out = mem[addr];
    if (w_en) begin
    mem[addr] = d_in;
    end
    
    end
    

endmodule
