`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:08:08 03/17/2016
// Design Name:   PC
// Module Name:   C:/Users/huire/Desktop/work/CPU/PC_tf.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PC
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

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

