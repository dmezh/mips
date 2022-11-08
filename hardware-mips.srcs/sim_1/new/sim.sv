`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/08/2022 12:59:49 PM
// Design Name: 
// Module Name: sim
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


module sim(

    );
    
    reg [7:0] leds;
    reg sysclk = 0;
    
    led_rotator rotator(.leds_out(leds), .clk(sysclk));
    initial begin
    for (int i = 0; i < 64; i += 1) begin
        sysclk = !sysclk;
        #20;
    end
    end
endmodule
