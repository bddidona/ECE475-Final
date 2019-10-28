`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2018 03:56:37 AM
// Design Name: 
// Module Name: cu_combinational
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
`include "opcodes.vh"
`include "alu_control_signals.vh"

module cu_combinational(
    input clk,
    input rst, runtime,
    input [7:0] ccr_reg,
    input [31:0] instruction,
    output [7:0] alu_control,
    output d_reg_we, dbus_we, abus_we, iobus_we, ira_we, irb_we, pc_we, pc_inc, mar_we, mbr_we, aluZ_we, aluCCR_we, mem_we, mem_re, error,
    output [3:0] d_reg_w_sel,
    output [4:0] dbus_mux, abus_mux, iobus_mux, alu_a_mux, alu_b_mux, mbr_mux,
    output  [7:0] timer
    
    
    
    
    );
    
    //Instruction Definition
    wire [7:0] opcode = instruction[31:24]; //8 bit opcode
    wire [3:0] addr_mode = instruction[23:20];  //4 bit addressing mode identifier
    wire [4:0] dest_reg  = instruction[19:15];  //5 bit destination register identifier
    wire [4:0] src0_reg = instruction[14:10];    //5 bit register 1 operand
    wire [4:0] src1_reg = instruction[9:5];    //5 bit register 2 operand
    wire [4:0] dbg_ctrl = instruction[4:0];     //5 bit Debug configuration/options
    
    wire flag_zero = ccr_reg[0];
    
    
    reg pc_inc = 0;
    
     reg dbus_we, abus_we, iobus_we, ira_we, irb_we, pc_we, pc_inc, mar_we, mbr_we, d_reg_we, mem_re, mem_we, alu_en, error = 0;
       reg [3:0] d_reg_w_sel = 0;
       reg [4:0] d_reg_mux, dbus_mux, abus_mux, iobus_mux, alu_a_mux, alu_b_mux, sys_ira_select, sys_irb_select, sys_pc_select;
       reg [7:0] alu_control = 0;
       reg mbr_mux, aluZ_we, aluCCR_we = 0;
    
    
    reg [7:0] timer;
    reg instruction_ready;
    
    always @ (rst) begin
            
    end 
    
    always @ (posedge clk) begin
    
    if (rst) begin
    timer = 0;
                instruction_ready = 0;
                dbus_we = 0;
                abus_we = 0;
                iobus_we = 0;
                ira_we = 0;
                irb_we = 0;
                pc_we = 0;
                pc_inc = 0;
                mar_we = 0;
                mbr_we = 0;
                d_reg_we = 0;
                alu_en = 0;
                dbus_mux = 0;
                abus_mux = 0;
                iobus_mux = 0;
                alu_a_mux = 0;
                alu_b_mux = 0;
                alu_control = 0;
                mem_we = 0;
                mem_re = 0;
                aluZ_we = 0;
                error = 0;
                aluCCR_we = 0;
                end
    else if(runtime & ~rst) begin
        if (~error) begin
        timer = timer + 1;
        d_reg_we = 0;
        /*mem_we = 0;
        pc_inc = 0;
        
        aluCCR_we = 0;*/

        case(instruction_ready)
        
            0:  begin
                

                case(timer)
                    1:  begin   //Load
//                            //aluZ_we = 0;
//                            //PC -> MAR
//                            abus_mux = 20;
//                            //abus_we = 1;
//                            mar_we = 1;
//                            //MEM -> MBR
//                            mem_re = 1;
//                            mbr_mux = 1;
//                            //mbr_we = 1;
                            abus_mux = 20;
                            mar_we = 1;
                            //mem_re = 1;
                            mbr_mux = 1;
                            mbr_we = 1;
                            ira_we = 1;
                            
                            
                        end
                        
                    2:  begin
                            mar_we = 0;
                            mbr_we = 0;
                            pc_inc = 1;
                            //abus_we = 0;
                            
                            
                      
                            //mem_re = 0;
                            
                            //mbr_we = 1;
                       
                            ira_we = 1;
                            
                            //MBR -> IRA
                            
                            instruction_ready = 1;
                        end //Instruction is now ready
                endcase
                end
            1:  begin   //Instruction decoding
                pc_inc = 0;
                mbr_we = 0;
                ira_we = 0;
                /*ira_we = 0;                          
                abus_we=1;
                            abus_mux = 20;
                ira_we = 0;
                irb_we = 1;
                //PC -> MAR
                
                mar_we = 1;
                //MEM -> MBR
                mem_re = 1;
                mbr_mux = 1;
                mbr_we = 1;*/
                
                case(opcode)
                    `NOP:   begin
                            timer = 0;
                            instruction_ready = 0;
                            end
                            
                    `LDR:   begin
                            case(addr_mode)
                                `RR:    begin   //src0_reg -> dest_reg
                                            
                                            dbus_we = 1;
                                            dbus_mux = src0_reg;
                                            d_reg_w_sel = dest_reg;
                                            d_reg_we = 1;
                                            timer = 0;
                                            instruction_ready = 0;
                                        end
                                        
                                `IMM:   begin   //IRB -> dest_reg
                                        case(timer)
                                            3:  begin
                                                    ira_we = 0;
                                                    abus_mux = 20;
                                                    abus_we = 1;
                                                    mar_we = 1;
                                                    mbr_mux = 1;
                                                    mbr_we = 1;
                                                    dbus_mux = 16;
                                                    dbus_we = 1;
                                                    
                                                    d_reg_w_sel = dest_reg;
                                                    
                                                end
                                                
                                            4:  begin
                                                    
                                                    mbr_we = 0;
                                                    mar_we = 0;
                                                     d_reg_we = 1;
                                                                                                       timer = 0;
                                                                                                       instruction_ready = 0;
                                                    pc_inc = 1;
                                                end
                                                    
                                            5:  begin
                                                    pc_inc = 0;
                                                    d_reg_we = 0;
                                                    timer = 0;
                                                    instruction_ready = 0;
                                                end
                                                
                                        endcase
                                        end
                                        
                                `DIR:   begin   //MEM[IRB] -> dest_reg
                                        case(timer)
                                            3:  begin
                                                    dbus_we = 1;
                                                    dbus_mux = 16;
                                                    d_reg_w_sel = dest_reg;
                                                    
                                                end
                                                
                                            4:  begin
                                                    irb_we = 1;
                                                    mbr_we = 0;
                                                    
                                                end
                                                
                                            5:  begin
                                                    irb_we = 0;
                                                    abus_we = 1;
                                                    abus_mux = 19;
                                                    mar_we = 1;
                                                    
                                                end
                                                
                                            6:  begin
                                                    mar_we = 1;
                                                end
                                                
                                            7:  begin
                                                    mem_re = 1;
                                                    mbr_mux = 1;
                                                    mbr_we = 1;
                                                end
                                                    
                                            8:  begin
                                                    mbr_we = 0;
                                                    d_reg_we = 1;
                                                    timer = 0;
                                                    instruction_ready = 0;
                                                end
                                           
                                        
                                        
                                       
                                                
                                        endcase
                                        end
                                 endcase
                            end
                            
                    `STR:   begin
                                case(addr_mode)
                                    `RR:    begin   //src0_reg -> MEM[dest_reg]
                                            case(timer)
                                            3:  begin
                                            abus_we = 1;
                                            abus_mux = dest_reg;
                                            mar_we = 1;
                                            dbus_we = 1;
                                            dbus_mux = src0_reg;
                                            mbr_we = 1;
                                            end
                                            
                                            4:  begin
                                            mar_we = 0;
                                            mbr_we = 0;
                                            mem_we = 1;
                                            end
                                            endcase
                                            end
                                            
                                    `IMM:   begin   //IRB -> MEM[IRB_1]
                                            
                                            end
                                            
                                    `DIR:   begin   //src0_reg -> MEM[IRB]
                                                case(timer)
                                                                                3:  begin
                                                                                        dbus_we = 1;
                                                                                        dbus_mux = src0_reg;    //set dbus to source
                                                                                        
                                                                                        //d_reg_w_sel = dest_reg;
                                                                                    end
                                                                                    
                                                                                4:  begin
                                                                                        mbr_we = 0;
                                                                                        mar_we = 0;
                                                                                        irb_we = 1;
                                                                                        
                                                                                        pc_inc = 1;
                                                                                    end
                                                                                        
                                                                                5:  begin
                                                                                        irb_we = 0;
                                                                                        abus_we = 1;            //set 
                                                                                                                                                                        abus_mux = 19;
                                                                                        mar_we = 1;
                                                                                        
                                                                                        
                                                                                        
                                                                                        mbr_mux = 0;
                                                                                        mbr_we = 1;
                                                                                        
                                                                                        //d_reg_we = 1;
                                                                                        end
                                                                                        
                                                                                6:  begin
                                                                                        mar_we = 0;
                                                                                        mbr_we = 0;
                                                                                        mem_we = 1;
                                                                                        timer = 0;
                                                                                        instruction_ready = 0;
                                                                                    end
                                                                                    
                                                                            endcase
                                            end
                                            
                                endcase
                            end
                            
                    `ZERS:  begin
                                case(addr_mode)
                                    `RR:    begin   //0 -> dest_reg
                                                case(timer)
                                                    3:  begin
                                                        alu_en = 1;
                                                        dbus_we = 1;
                                                        dbus_mux = 21;
                                                        alu_control = `SETZER;
                                                        aluZ_we = 1;
                                                        aluCCR_we = 1;
                                                        
                                                        end
                                                    4:  begin
                                                        aluZ_we = 0;
                                                        aluCCR_we = 0;
                                                        dbus_we = 0;
                                                        d_reg_w_sel = dest_reg;
                                                        d_reg_we = 1;
                                                        timer = 0;
                                                        instruction_ready = 0;
                                                        end
                                            endcase
                                            end
                                            
                                    `DIR:   begin   //0 -> MEM[IRB]
                                    
                                            end
                                endcase
                    
                            end
                            
                    `ONES:  begin
                                case(addr_mode)
                                    `RR:    begin   //1 -> dest_reg
                                            alu_en = 1;
                                            dbus_we = 1;
                                            dbus_mux = 21;
                                            alu_control = `SETONE;
                                            aluZ_we = 1;
                                            aluCCR_we =1;
                                            timer = 0;
                                                                        instruction_ready = 0;
                                            end
                                    
                                            
                                    `DIR:   begin   //1 -> MEM[IRB]
                                    
                                            end
                                    endcase
                            end
                            
                    `AND:   begin
                                case(addr_mode)
                                    `RR:    begin   //src0_reg & src1_reg -> dest_reg
                                                //src0_reg -> aluA
                                                alu_en = 1;
                                                alu_a_mux = src0_reg;
                                                //src1_reg -> aluB
                                                alu_b_mux = src1_reg;
                                                //alu_operation = and
                                                alu_control = `AND;
                                                //write result to Z
                                                aluZ_we = 1;
                                                aluCCR_we = 1;
                                                dbus_we = 1;
                                                dbus_mux = 22;
                                                d_reg_w_sel = dest_reg;
                                                d_reg_we = 1;
                                                timer = 0;
                                                instruction_ready = 0;                                                
                                            end
                                            
                                    `IMM:   begin   //src0_reg & IRB -> dest_reg
                                    
                                            end
                                            
                                    `DIR:   begin   //src0_reg & MEM[IRB] -> dest_reg
                                    
                                            end
                                endcase
                            end
                            
                    `OR:    begin
                                case(addr_mode)
                                    `RR:    begin
                                                //src0_reg -> aluA
                                                alu_a_mux = src0_reg;
                                                alu_en = 1;
                                                //src1_reg -> aluB
                                                alu_b_mux = src1_reg;
                                                //alu_operation = and
                                                alu_control = `lOR;
                                                //write result to Z
                                                aluZ_we = 1;
                                                aluCCR_we = 1;
                                                dbus_we = 1;
                                                dbus_mux = 22;
                                                d_reg_w_sel = dest_reg;
                                                d_reg_we = 1;
                                                timer = 0;
                                                instruction_ready = 0;                                    
                                            end
                                            
                                    `IMM:   begin
                                    
                                            end
                                            
                                    `DIR:   begin
                                    
                                            end
                                endcase
                            end
                            
                    `EOR:   begin
                                case(addr_mode)
                                    `RR:    begin
                                                //src0_reg -> aluA
                                                alu_a_mux = src0_reg;
                                                //src1_reg -> aluB
                                                alu_b_mux = src1_reg;
                                                //alu_operation = and
                                                alu_control = `lXOR;
                                                //write result to Z
                                                aluZ_we = 1;
                                                aluCCR_we = 1;
                                                dbus_we = 1;
                                                dbus_mux = 22;
                                                d_reg_w_sel = dest_reg;
                                                d_reg_we = 1;
                                                                                                timer = 0;
                                                                                                instruction_ready = 0; 
                                            end
                                            
                                    `IMM:   begin
                                    
                                            end
                                            
                                    `DIR:   begin
                                    
                                            end
                                endcase
                                            
                            end
                            
                    `INV:   begin
                                case(addr_mode)
                                    `RR:    begin
                                                //src0_reg -> aluA
                                                alu_a_mux = src0_reg;
                                                //src1_reg -> aluB
                                                alu_b_mux = src1_reg;
                                                //alu_operation = and
                                                alu_control = `lNOTA;
                                                //write result to Z
                                                aluZ_we = 1;
                                                aluCCR_we = 1;
                                                dbus_we = 1;
                                                dbus_mux = 22;
                                                d_reg_w_sel = dest_reg;
                                                d_reg_we = 1;
                                                                                                timer = 0;
                                                                                                instruction_ready = 0; 
                                            end
                                            
                                    `IMM:   begin
                                    
                                            end
                                            
                                    `DIR:   begin
                                    
                                            end
                                endcase
                            end
                            
                    `SHR:   begin
                                case(addr_mode)
                                    `RR:    begin
                                                //src0_reg -> aluA
                                                alu_a_mux = src0_reg;
                                                //src1_reg -> aluB
                                                alu_b_mux = src1_reg;
                                                //alu_operation = and
                                                alu_control = `lSHR;
                                                //write result to Z
                                                aluZ_we = 1;
                                                aluCCR_we = 1;
                                                dbus_we = 1;
                                                dbus_mux = 22;
                                                d_reg_w_sel = dest_reg;
                                                d_reg_we = 1;
                                                                                                timer = 0;
                                                                                                instruction_ready = 0; 
                                            end
                                        
                                    `IMM:   begin
                                
                                            end
                                        
                                    `DIR:   begin
                                
                                            end
                                endcase
                            end
                            
                    `SHL:   begin
                                case(addr_mode)
                                    `RR:    begin
                                                //src0_reg -> aluA
                                                alu_a_mux = src0_reg;
                                                //src1_reg -> aluB
                                                alu_b_mux = src1_reg;
                                                //alu_operation = and
                                                alu_control = `lSHL;
                                                //write result to Z
                                                aluZ_we = 1;
                                                aluCCR_we = 1;
                                                dbus_we = 1;
                                                dbus_mux = 22;
                                                d_reg_w_sel = dest_reg;
                                                d_reg_we = 1;
                                                                                                timer = 0;
                                                                                                instruction_ready = 0; 
                                            end
                                            
                                    `IMM:   begin
                                    
                                            end
                                            
                                    `DIR:   begin
                                    
                                            end
                                endcase
                            end
                            
                    `ADD:   begin
                                case(addr_mode)
                                    `RR:    begin
                                                case(timer)
                                                    3: begin
                                            //src0_reg -> aluA
                                            alu_a_mux = src0_reg;
                                            //src1_reg -> aluB
                                            alu_b_mux = src1_reg;
                                            //alu_operation = and
                                            alu_control = `aADD;
                                            //write result to Z
                                            aluZ_we = 1;
                                            aluCCR_we = 1;
                                            dbus_we = 1;
                                            dbus_mux = 22;
                                            d_reg_w_sel = dest_reg;
                                            
                                            end
                                            
                                            4:  begin
                                                d_reg_we = 1;
                                                                                                                                        timer = 0;
                                                                                                                                        instruction_ready = 0; 
                                                end
                                            endcase
                                            end
                                            
                                            
                                    `IMM:   begin
                                    
                                            end
                                            
                                    `DIR:   begin
                                    
                                            end
                                            
                                    endcase
                                        
                            end
                            
                    `ADDC:  begin
                                case(addr_mode)
                                    `RR:    begin
                                                case(timer)
                                                                                        3: begin
                                                                                //src0_reg -> aluA
                                                                                alu_a_mux = src0_reg;
                                                                                //src1_reg -> aluB
                                                                                alu_b_mux = src1_reg;
                                                                                //alu_operation = and
                                                                                alu_control = `aADDC;
                                                                                //write result to Z
                                                                                aluZ_we = 1;
                                                                                aluCCR_we = 1;
                                                                                dbus_we = 1;
                                                                                dbus_mux = 22;
                                                                                d_reg_w_sel = dest_reg;
                                                                                
                                                                                end
                                                                                
                                                                                4:  begin
                                                                                    d_reg_we = 1;
                                                                                                                                                                            timer = 0;
                                                                                                                                                                            instruction_ready = 0; 
                                                                                    end
                                                                                endcase
                                            end
                                            
                                    `IMM:   begin
                                    
                                            end
                                            
                                    `DIR:   begin
                                    
                                            end
                                    endcase
                            end
                            
                    `SUB:   begin
                                case(addr_mode)
                                    `RR:    begin
                                            case(timer)
                                                                                        3: begin
                                                                                //src0_reg -> aluA
                                                                                alu_a_mux = src0_reg;
                                                                                //src1_reg -> aluB
                                                                                alu_b_mux = src1_reg;
                                                                                //alu_operation = and
                                                                                alu_control = `aSUB;
                                                                                //write result to Z
                                                                                aluZ_we = 1;
                                                                                aluCCR_we = 1;
                                                                                dbus_we = 1;
                                                                                dbus_mux = 22;
                                                                                d_reg_w_sel = dest_reg;
                                                                                
                                                                                end
                                                                                
                                                                                4:  begin
                                                                                    d_reg_we = 1;
                                                                                                                                                                            timer = 0;
                                                                                                                                                                            instruction_ready = 0; 
                                                                                    end
                                                                                    
                                                                                5:  begin
                                                                                    d_reg_we = 0;
                                                                                    timer = 0;
                                                                                    instruction_ready = 0;
                                                                                    end
                                                                                endcase
                                            end
                                            
                                    `IMM:   begin
                                    
                                            end
                                            
                                    `DIR:   begin
                                    
                                            end
                                    endcase
                            end
                            
                    `INCR:  begin
                                case(addr_mode)
                                    `RR:    begin
                                                case(timer)
                                                                                        3: begin
                                                                                //src0_reg -> aluA
                                                                                alu_a_mux = src0_reg;
                                                                                //src1_reg -> aluB
                                                                                alu_b_mux = src1_reg;
                                                                                //alu_operation = and
                                                                                alu_control = `aINCA;
                                                                                //write result to Z
                                                                                aluZ_we = 1;
                                                                                aluCCR_we = 1;
                                                                                dbus_we = 1;
                                                                                dbus_mux = 22;
                                                                                d_reg_w_sel = dest_reg;
                                                                                
                                                                                end
                                                                                
                                                                                4:  begin
                                                                                    d_reg_we = 1;
                                                                                                                                                                            timer = 0;
                                                                                                                                                                            instruction_ready = 0; 
                                                                                    end
                                                                                endcase
                                            end
                                            
                                    `IMM:   begin
                                    
                                            end
                                            
                                    `DIR:   begin
                                    
                                            end
                                    endcase
                            end
                            
                    `DECR:  begin
                                case(addr_mode)
                                    `RR:    begin
                                                case(timer)
                                                                                        3: begin
                                                                                //src0_reg -> aluA
                                                                                alu_a_mux = src0_reg;
                                                                                //src1_reg -> aluB
                                                                                alu_b_mux = src1_reg;
                                                                                //alu_operation = and
                                                                                alu_control = `aDECA;
                                                                                //write result to Z
                                                                                aluZ_we = 1;
                                                                                aluCCR_we = 1;
                                                                                dbus_we = 1;
                                                                                dbus_mux = 22;
                                                                                d_reg_w_sel = dest_reg;
                                                                                
                                                                                end
                                                                                
                                                                                4:  begin
                                                                                    d_reg_we = 1;
                                                                                                                                                                            timer = 0;
                                                                                                                                                                            instruction_ready = 0; 
                                                                                    end
                                                                                endcase
                                            end
                                            
                                    `IMM:   begin
                                    
                                            end
                                            
                                    `DIR:   begin
                                    
                                            end
                                    endcase
                            end
                            
                    `B:     begin
                                case(addr_mode)
                                    `RR:    begin
                                                abus_we = 1;
                                                abus_mux = dest_reg;
                                                pc_we = 1;
                                                timer = 0;
                                                instruction_ready = 0;
                                            end
                                            
                                    `IMM:   begin
                                    
                                            end
                                            
                                    `DIR:   begin
                                    
                                            end
                                    endcase
                            end
                            
                    `BEQ:   begin
                                if (flag_zero) begin
                                case(addr_mode)
                                    `RR:    begin
                                                abus_we = 1;
                                                                                    abus_mux = dest_reg;
                                                                                    pc_we = 1;
                                                                                    timer = 0;
                                                                                    instruction_ready = 0;
                                            end
                                            
                                    `IMM:   begin
                                    
                                            end
                                            
                                    `DIR:   begin
                                    
                                            end
                                    endcase
                                    end
                    
                            end
                    default:begin
                            //Not recognized instruction
                            error = 1;
                            
                            end        
                endcase
                end    
                
        endcase
                
            
    end
    end
    end

    
    
endmodule
