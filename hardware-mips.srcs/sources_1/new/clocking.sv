`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/08/2022 11:57:49 AM
// Design Name: 
// Module Name: clocking
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


module coreclockdiv#(parameter DIV=22)
                    (sysclk, coreclk);
    input logic sysclk;
    output logic coreclk;
    
    logic [DIV:0] scaler;
    
    always @(posedge sysclk) begin
        scaler += 1;
    end
    
    assign coreclk = scaler[DIV];
endmodule
