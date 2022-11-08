`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/08/2022 12:04:05 PM
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


//module cpu(
//    input sysclk,
//    output [7:0] leds
//    );

//    /////////////// Clocking
//    logic coreclk;
//    coreclockdiv#(21) clk_div(.sysclk(sysclk), .coreclk(coreclk));
    
//    /////////////// IO
//    led_rotator rotator(.leds_out(leds), .clk(coreclk));
    
//    /////////////// ALU
//    logic [31:0] s1 = 0, s2 = 0, aluout;
//    logic [2:0] aluctl = 0;
//    logic zero;
//    alu alu(.s1(s1), .s2(s2), .aluout(aluout), .aluctl(aluctl), .zero(zero));
     
//endmodule

module top(input logic clk, reset,
           output logic [31:0] writedata, dataadr,
           output logic memwrite,
           output logic [31:0] imemout,
           output logic [31:0] pc_out, pcplus4_out);

    logic [31:0] pc, instr, readdata;

    mips mips(clk, reset, pc, instr, memwrite, dataadr, writedata, readdata, pcplus4_out);
    instruction_memory instruction_memory(pc[7:2], instr);
    data_memory data_memory(clk, memwrite, dataadr, writedata, readdata);
    
    assign imemout = instr;
    assign pc_out = pc;
endmodule

module mips(input  logic clk, reset,
            output logic [31:0] pc,
            input  logic [31:0] instr,
            output logic memwrite,
            output logic [31:0] aluout, writedata,
            input  logic [31:0] readdata,
            output logic [31:0] pcplus4_out);
            
    logic memtoreg, alusrc, regdst, regwrite, jump, pcsrc, zero;
    logic [2:0] alucontrol;
    controller c(instr[31:26], instr[5:0], zero,memtoreg, memwrite, pcsrc, alusrc, regdst, regwrite, jump, alucontrol);
    
    datapath dp(clk, reset, memtoreg, pcsrc, alusrc, regdst, regwrite, jump, alucontrol, zero, pc, instr, aluout, writedata, readdata, pcplus4_out);
endmodule
