
module PCTest_tf;

	// Inputs
	reg CLK;
	reg Reset;

	// Outputs
	wire [31:0] PCin;
	wire [31:0] PCout;

	// Instantiate the Unit Under Test (UUT)
	PCTest uut (
		.CLK(CLK), 
		.Reset(Reset), 
		.PCin(PCin), 
		.PCout(PCout)
	);

	initial begin
		Reset = 1;
		CLK = 0;
		
		#100;
		CLK = !CLK;

		Reset = 0;
		
		// Initialize Inputs
		//
		forever begin
			#100;
			CLK = !CLK;
		end

	end
      
endmodule

