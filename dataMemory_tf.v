
module dataMemory_tf;

	// Inputs
	reg RW;
	reg [31:0] DAddr;
	reg [31:0] Datain;

	// Outputs
	wire [31:0] DataOut;

	// Instantiate the Unit Under Test (UUT)
	DataMemory uut (
		.RW(RW), 
		.DAddr(DAddr), 
		.Datain(Datain), 
		.DataOut(DataOut)
	);

	initial begin
		// Initialize Inputs
		RW = 0;
		DAddr = 0;
		Datain = 0;

		// Wait 100 ns for global reset to finish
		#100;
      RW = 0;
		DAddr = 1;
		Datain = 32'hffff;
		// Add stimulus here
		#100 $stop;
	end
      
endmodule

