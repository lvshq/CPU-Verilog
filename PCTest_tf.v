`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:13:21 03/17/2016
// Design Name:   PCTest
// Module Name:   C:/Users/huire/Desktop/work/CPU/PCTest_tf.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PCTest
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

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
		forever begin
			#100;
			CLK = !CLK;
		end

	end
      
endmodule

