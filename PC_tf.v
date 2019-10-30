
module PC_tf;

	// Inputs
	reg clk;
	reg reset;
	reg PCWre;
	reg [31:0] PCin;

	// Outputs
	wire [31:0] PCOut;

	// Instantiate the Unit Under Test (UUT)
	PC uut (
		.clk(clk), 
		.reset(reset), 
		.PCWre(PCWre), 
		.PCin(PCin), 
		.PCOut(PCOut)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		PCWre = 0;
		PCin = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

