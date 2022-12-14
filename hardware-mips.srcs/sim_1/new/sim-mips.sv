module testbench();
    logic clk;
    logic reset;
    logic [31:0] writedata, dataadr;
    logic memwrite;
    
    logic [31:0] imemout, pc, pcplus4;
    // instantiate device to be tested
    top dut (clk, reset, writedata, dataadr, memwrite, imemout, pc, pcplus4);

    // initialize test
    initial begin
        reset <= 1; # 22; reset <= 0;
    end

    // generate clock to sequence tests
    always begin
        clk <= 1; # 15; clk <= 0; # 15;
    end
    
    // check results
    always @(negedge clk)
    begin
        if (memwrite) begin
	       if (dataadr === 84 & writedata === 7) begin
		      $display("Simulation succeeded");
		      $stop;
	       end else if (dataadr !== 80) begin
		      $display("Simulation failed");
		      $stop;
	       end
		end
	end
endmodule
