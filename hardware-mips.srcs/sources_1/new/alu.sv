`timescale 1ns / 1ps

module led_rotator(leds_out, clk);
    output logic [7:0] leds_out;
    input logic clk;
    
    logic [7:0] leds = 'hFF;
    assign leds_out = leds;
    
    logic [2:0] position = 0;
    always @(posedge clk) begin
        position += 1;
        leds <= 255 - (1 << position);
    end
endmodule
