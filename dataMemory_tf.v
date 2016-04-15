`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:45:59 03/17/2016
// Design Name:   DataMemory
// Module Name:   C:/Users/huire/Desktop/work/CPU/dataMemory_tf.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: DataMemory
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

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

