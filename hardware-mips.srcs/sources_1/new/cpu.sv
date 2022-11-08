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


module cpu(
    input sysclk,
    output leds
    );

    /////////////// Clocking
    wire sysclk;
    wire coreclk;
    coreclockdiv clk_div(.sysclk(sysclk), .coreclk(coreclk));
    
    /////////////// IO
    wire [7:0] leds;
    led_rotator rotator(.leds_out(leds), .clk(coreclk));
     
endmodule
