`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2018 02:19:53 PM
// Design Name: 
// Module Name: cpu
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


module cpu(
    input clk,
    input rst,
    input [7:0] dbg_control,
    input [31:0] mem_bus_out,
    inout [31:0] iobus,
    output [31:0] mem_bus_in, MAR,
    output [7:0] status_indicators,
    output we_mem, re_mem,
    output [31:0] dbg_reg_PC, dbg_reg_IRA, dbg_reg_MAR, dbg_reg_MBR, dbg_reg_IRB, dbg_reg_ALUZ, dbg_reg_CCR
    
    );
    
    //Write locks
    wire we_dbus, we_abus, we_iobus, we_IRA, we_IRB, we_PC, we_MBR, we_MAR, we_DREG, we_aluZ, we_aluCCR;
    
    //Busses
    reg [31:0] dbus, abus, mem_bus_in;
    
    //Bus Multiplexing
    wire [4:0] mux_dbus, mux_abus, mux_iobus, mux_alu_a, mux_alu_b;
    wire [3:0] dreg_index;
    wire mux_MBR_load;  //0 - dbus, 1 - mem_bus_out
    
    
    //Registers
    reg [31:0] R [0:15];
    reg [31:0] PC, MBR, MAR, IRA, IRB, Z;
    reg [7:0] CCR;
    reg [31:0] alu_a, alu_b;
    reg [7:0] status_indicators;
    
    //Debug registers
    reg [31:0] dbg_reg_PC, dbg_reg_IRA, dbg_reg_MAR, dbg_reg_MBR, dbg_reg_IRB, dbg_reg_ALUZ;
    reg [31:0] dbg_reg_CCR;
    
    //Interconnect wires
    wire [31:0] w_aluZ, w_aluCCR;
    wire [7:0] w_alu_control;
    wire error_flag;
    reg runtime;
    reg sysclk;
    
    //System Components
    wire inc_PC;
    cu_combinational control_unit(clk, rst, runtime, CCR, IRA, w_alu_control, we_DREG, we_dbus, we_abus, we_iobus, we_IRA, we_IRB, we_PC, inc_PC, we_MAR, we_MBR, we_aluZ, we_aluCCR, we_mem, re_mem, error_flag, dreg_index, mux_dbus, mux_abus, mux_iobus, mux_alu_a, mux_alu_b, mux_MBR_load);
    alu_32_behavioral al_unit(w_alu_control, alu_a, alu_b, w_aluZ, w_aluCCR);
    
   
   
   
    
    always @ (posedge clk)
    begin
    
    if (rst) begin
    mem_bus_in = 0;
            abus = 0;
            R[0]=0;
            R[1]=0;
            R[2]=0;
            R[3]=0;
            R[4]=0;
            R[5]=0;
            R[6]=0;
            R[7]=0;
            R[8]=0;
            R[9]=0;
                R[10]=0;
                R[11]=0;
                R[12]=0;
                R[13]=0;
                R[14]=0;
                R[15]=0;
        
            MBR = 0;
            MAR = 0;
            IRA = 0;
            IRB = 0;
            Z = 0;
            CCR = 0;
            alu_a = 0;
            alu_b = 0;
            status_indicators = 0;
            dbg_reg_PC = 0;
            dbg_reg_IRA = 0;
            PC = 0;
            runtime = 1;
            end
    
    
 /*   
    if (~rst)
        status_indicators[7] = 1;
*/
          status_indicators = PC;
//        status_indicators[7] = runtime;
//        status_indicators[6] = error_flag;
        
//        status_indicators[3:0] = CCR[3:0];
        
    if (we_PC) begin
        PC = abus;
        end
    
    if (inc_PC)
        PC = PC+1;    
        
        
    if (error_flag)
        runtime = 0;
        
    if (dbg_control == 1) begin
        dbg_reg_PC = PC;
        dbg_reg_IRA = IRA;
        dbg_reg_MAR = MAR;
        dbg_reg_MBR = MBR;
        dbg_reg_IRB = IRB;
        dbg_reg_ALUZ = Z;
        dbg_reg_CCR = CCR;
        end
    
    
    
    

        
        if (we_MAR)
                MAR=abus;
                
                
                
     //if (we_dbus) begin
                    case(mux_dbus)
                        0: dbus = R[mux_dbus];
                        1: dbus = R[mux_dbus];
                        2: dbus = R[mux_dbus];
                        3: dbus = R[mux_dbus];
                        4: dbus = R[mux_dbus];
                        5: dbus = R[mux_dbus];
                        6: dbus = R[mux_dbus];
                        7: dbus = R[mux_dbus];
                        8: dbus = R[mux_dbus];
                        9: dbus = R[mux_dbus];
                        10: dbus = R[mux_dbus];
                        11: dbus = R[mux_dbus];
                        12: dbus = R[mux_dbus];
                        13: dbus = R[mux_dbus];
                        14: dbus = R[mux_dbus];
                        15: dbus = R[mux_dbus];
                        16: dbus = MBR;
                        17: dbus = MAR;
                        18: dbus = IRA;
                        19: dbus = IRB;
                        20: dbus = PC;
                        21: dbus = Z;
                        22: dbus = w_aluZ;
                    endcase
                    //end
                
                //if (we_abus) begin
                    case(mux_abus)
                    0: abus = R[mux_abus];
                                1: abus = R[mux_abus];
                                2: abus = R[mux_abus];
                                3: abus = R[mux_abus];
                                4: abus = R[mux_abus];
                                5: abus = R[mux_abus];
                                6: abus = R[mux_abus];
                                7: abus = R[mux_abus];
                                8: abus = R[mux_abus];
                                9: abus = R[mux_abus];
                                10: abus = R[mux_abus];
                                11: abus = R[mux_abus];
                                12: abus = R[mux_abus];
                                13: abus = R[mux_abus];
                                14: abus = R[mux_abus];
                                15: abus = R[mux_abus];
                                16: abus = MBR;
                                17: abus = MAR;
                                18: abus = IRA;
                                19: abus = IRB;
                                20: abus = PC;
                                21: abus = Z;
                                22: abus = w_aluZ;
                    endcase
                    //end               
    
        if (we_MBR) begin
                            case(mux_MBR_load)
                                0: MBR = dbus;
                                1: MBR = mem_bus_out;
                            endcase
                            end
    
        case(mux_alu_a)
                0: alu_a = R[mux_alu_a];
                1: alu_a = R[mux_alu_a];
                2: alu_a = R[mux_alu_a];
                3: alu_a = R[mux_alu_a];
                4: alu_a = R[mux_alu_a];
                5: alu_a = R[mux_alu_a];
                6: alu_a = R[mux_alu_a];
                7: alu_a = R[mux_alu_a];
                8: alu_a = R[mux_alu_a];
                9: alu_a = R[mux_alu_a];
                10: alu_a = R[mux_alu_a];
                11: alu_a = R[mux_alu_a];
                12: alu_a = R[mux_alu_a];
                13: alu_a = R[mux_alu_a];
                14: alu_a = R[mux_alu_a];
                15: alu_a = R[mux_alu_a];
                16: alu_a = MBR;
                17: alu_a = MAR;
                18: alu_a = IRA;
                19: alu_a = IRB;
                20: alu_a = PC;
                21: alu_a = Z;
        endcase

    
    case(mux_alu_b)
        0: alu_b = R[mux_alu_b];
                    1: alu_b = R[mux_alu_b];
                    2: alu_b = R[mux_alu_b];
                    3: alu_b = R[mux_alu_b];
                    4: alu_b = R[mux_alu_b];
                    5: alu_b = R[mux_alu_b];
                    6: alu_b = R[mux_alu_b];
                    7: alu_b = R[mux_alu_b];
                    8: alu_b = R[mux_alu_b];
                    9: alu_b = R[mux_alu_b];
                    10: alu_b = R[mux_alu_b];
                    11: alu_b = R[mux_alu_b];
                    12: alu_b = R[mux_alu_b];
                    13: alu_b = R[mux_alu_b];
                    14: alu_b = R[mux_alu_b];
                    15: alu_b = R[mux_alu_b];
                    16: alu_b = MBR;
                    17: alu_b = MAR;
                    18: alu_b = IRA;
                    19: alu_b = IRB;
                    20: alu_b = PC;
                    21: alu_b = Z;
    endcase

    if (we_aluZ)
        Z = w_aluZ;
        
    if (we_aluCCR)
        CCR = w_aluCCR;
        
    mem_bus_in = MBR;
    
   if (we_DREG)
            R[dreg_index] = dbus;
    
    if (we_IRA)
        IRA = MBR;
    
    if (we_IRB)
        IRB = MBR;
        
    

    
    if (we_PC) begin
        PC = abus;
        end
    

        
    
    if (dbg_control == 1) begin
                    dbg_reg_PC = PC;
                    dbg_reg_IRA = IRA;
                    dbg_reg_MAR = MAR;
                    dbg_reg_MBR = MBR;
                    dbg_reg_IRB = IRB;
                    dbg_reg_ALUZ = Z;
                    dbg_reg_CCR = CCR;
                    end
                    
    
    end
    
    
endmodule
