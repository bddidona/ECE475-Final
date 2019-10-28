`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2018 02:27:26 AM
// Design Name: 
// Module Name: tb_idec
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


module tb_idec(

    );
    
    reg clk;
    reg [31:0] ins;
    wire [255:0] ins_test;
    wire [7:0] cfg_test;
    integer i;
        
        
    initial begin
    clk = 0;
    ins = 0;
    #100;
    for(i=0; i < 256; i = i + 1)
        begin
            ins = i;
            #10;
            end
    end
    
    
        
        
    cu_idec uut(ins, ins_test, cfg_test);
    
endmodule
