`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2018 03:07:05 PM
// Design Name: 
// Module Name: bsp_io
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


module bsp_io(
    input clk,
    input [7:0] status,
    input [31:0] data,
    input [15:0] device,
    input [15:0] switches,
    input [5:0]  buttons,
    
    output [15:0] led_array,
    output [2:0] rgb_led0, rgb_led1,
    output [7:0] AN,
    output [7:0] CA,
    output rst_sig,
    input [31:0] dbg_reg_PC, dbg_reg_IRA, dbg_reg_MAR, dbg_reg_MBR, dbg_reg_IRB, dbg_reg_ALUZ, 
    input [7:0] dbg_reg_CCR
    );
    
    integer counter_AN;
    reg [3:0] data_AN [7:0];
    reg [15:0] led_array;
    reg rst_sig;
    
    
    always begin
    data_AN[0] = data[3:0];
    data_AN[1] = data[7:4];
    data_AN[2] = data[11:8];
    data_AN[3] = data[15:12];
    data_AN[4] = data[19:16];
    data_AN[5] = data[23:20];
    data_AN[6] = data[27:24];
    data_AN[7] = data[31:28];
    rst_sig = ~buttons[5];
    
    
    case(switches)
        0:  begin
                led_array[7:0] = status;
                led_array[15] = clk;
            end
            
        1:  begin
                led_array[15:0] = dbg_reg_PC[15:0];
            end
            
        2:  begin
                led_array[15:0] = dbg_reg_IRA[15:0];
            end
            
        3:  begin
                led_array[15:0] = dbg_reg_MAR[15:0];
            end
            
        4:  begin
                led_array[15:0] = dbg_reg_MBR[15:0];
            end
            
        5:  begin
                led_array[15:0] = dbg_reg_MBR[15:0];
            end
            
        6:  begin
                led_array[15:0] = dbg_reg_IRB[15:0];
            end
            
        7:  begin
                led_array[15:0] = dbg_reg_ALUZ[15:0];
            end
        8:  begin
                led_array[15] = clk;
                led_array[7:0] = dbg_reg_CCR[7:0];
            end
            
    
    
    endcase
    
    
    
    end
    
    always @ (posedge clk) begin
    case(counter_AN)
    0:  begin
    
        end
    1:  begin
    
        end
    2:  begin
    
        end
    3:  begin
    
        end
    4:  begin
    
        end
    5:  begin
    
        end
    6:  begin
    
        end
    7:  begin
    
        end
    
    endcase
    
    end
    
    
    
    
    
    
    
    
    
    
    
    
    
endmodule
