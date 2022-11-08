`timescale 1ns / 1ps

typedef enum {
    ALU_OP_ADD = 2,
    ALU_OP_SUB = 6,
    ALU_OP_AND = 0,
    ALU_OP_OR  = 1,
    ALU_OP_SLT = 7
} ALU_OP;

typedef enum {
    MIPS_OP_ADD = 32,
    MIPS_OP_SUB = 34,
    MIPS_OP_AND = 36,
    MIPS_OP_OR  = 37,
    MIPS_OP_SLT = 42
} MIPS_OP;

module aludec(input  logic [5:0] funct,
              input  logic [1:0] aluop,
              output logic [2:0] aluctl);

    always_comb begin
        case (aluop)
            2'b00: aluctl <= ALU_OP_ADD;
            2'b01: aluctl <= ALU_OP_SUB;

            default:
                case (funct)
                    MIPS_OP_ADD: aluctl <= ALU_OP_ADD;
                    MIPS_OP_SUB: aluctl <= ALU_OP_SUB;
                    MIPS_OP_AND: aluctl <= ALU_OP_AND;
                    MIPS_OP_OR:  aluctl <= ALU_OP_OR;
                    MIPS_OP_SLT: aluctl <= ALU_OP_SLT;
                    default:     aluctl <= 3'bxxx;
                endcase
        endcase
    end
endmodule

module alu(input  logic [31:0] s1, s2,
           input  logic [2:0]  aluctl,
           output logic [31:0] aluout,
           output logic        zero);

    always_comb begin
        case (aluctl)
            ALU_OP_ADD: aluout <= s1 + s2;
            ALU_OP_SUB: aluout <= s1 - s2;
            ALU_OP_AND: aluout <= s1 & s2;
            ALU_OP_OR:  aluout <= s1 | s2;
            ALU_OP_SLT: aluout <= s1 < s2;
            default:    aluout <= 'hxxxx;
        endcase
    end
    
    assign zero = (aluout == 0);
endmodule
