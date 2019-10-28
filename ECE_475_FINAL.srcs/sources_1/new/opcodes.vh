//Definitions of Instructions
`define NOP 8'b0000_0000
`define LDR 8'b0000_0001
`define STR 8'b0000_0010

`define ZERS 8'b0001_0000
`define ONES 8'b0001_0001
`define MVA 8'b0001_0010
`define MVB 8'b0001_0011
`define AND 8'b0001_0100
`define OR 8'b0001_0101
`define EOR 8'b0001_0110
`define INV 8'b0001_0111
`define SHR 8'b0001_1000
`define SHL 8'b0001_1001
`define ADD 8'b0001_1010
`define ADDC 8'b0001_1011
`define SUB 8'b0001_1100
`define INCR 8'b0001_1101
`define DECR 8'b0001_1110
`define CMP 8'b0001_1111

`define B 8'b0010_0000
`define BEQ 8'b0010_0001

`define SDINIT
`define SDRD
`define SDWR

`define PRGM
`define END



//Definitions of Addressing Modes
`define RR 4'b0000
`define IMM 4'b0001
`define DIR 4'b0010



//Definitions of mux IDs
`define R0 5'b0_0000
`define R1 5'b0_0001
`define R2 5'b0_0010
`define R3 5'b0_0011
`define R4 5'b0_0100
`define R5 5'b0_0101
`define R6 5'b0_0110
`define R7 5'b0_0111
`define R8 5'b0_1000
`define R9 5'b0_1001
`define R10 5'b0_1010
`define R11 5'b0_1011
`define R12 5'b0_1100
`define R13 5'b0_1101
`define R14 5'b0_1110
`define R15 5'b0_1111
`define PC  5'b1_0000


//Definitions of Debug control signals