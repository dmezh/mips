`timescale 1ns / 1ps

module sim(

    );

    logic [2:0] aluctl;
    logic [31:0] s1, s2, aluout;
    logic zero;
    
    alu alu(.aluctl(aluctl), .s1(s1), .s2(s2), .aluout(aluout), .zero(zero)); 
    initial begin
    
    for (int i = 0; i < 8; i += 1) begin
        s1 <= 'h00FFFFF0;
        s2 <= 'hF000000F;
        
        aluctl <= i;
        #20;
    end
    end
endmodule
