`timescale 1ns / 1ps

module signext32(input  logic [15:0] a,
                 output logic [31:0] y);

    assign y = {{16{a[15]}}, a};   
endmodule

module sl2_32(input  logic [31:0] a,
              output logic [31:0] y);

    assign y = {a[29:0], 2'b00};
endmodule

module adder32(input  logic [31:0] a, b,
               output logic [31:0] ay);

    assign y = a + b;
endmodule
