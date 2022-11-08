`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/08/2022 12:33:24 PM
// Design Name: 
// Module Name: memory
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


module instruction_memory(
        input logic [5:0] addr,
        output logic [31:0] content
    );
    
    logic [31:0] memblock [63:0];
    
    initial begin
        $readmemh("test_routine.mem", memblock);
        $display(memblock);
    end
    
    assign content = memblock[addr];
endmodule

module data_memory(input logic          clk, we,
                   input logic [31:0]   a, wd,
                   output logic [31:0]  rd);

    logic [31:0] memblock[63:0];
    
    assign rd = memblock[a[31:2]];
    
    always_ff @(posedge clk) begin
        if (we)
            memblock[a[31:2]] <= wd;
    end
                   
endmodule