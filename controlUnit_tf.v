`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:13:24 04/13/2016
// Design Name:   CU
// Module Name:   G:/myCPU/myCPU/controlUnit_tf.v
// Project Name:  myCPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module controlUnit_tf;

	// Inputs
	reg [5:0] op;
	reg zero;

	// Outputs
	wire RegOut;
	wire InsMenRW;
	wire ExtSel;
	wire DataMenRW;
	wire ALUM2Reg;
	wire ALUSrcB;
	wire PCSrc;
	wire RegWre;
	wire PCWre;
	wire [2:0] ALUOp;

	// Instantiate the Unit Under Test (UUT)
	CU uut (
		.op(op), 
		.zero(zero), 
		.RegOut(RegOut), 
		.InsMenRW(InsMenRW), 
		.ExtSel(ExtSel), 
		.DataMenRW(DataMenRW), 
		.ALUM2Reg(ALUM2Reg), 
		.ALUSrcB(ALUSrcB), 
		.PCSrc(PCSrc), 
		.RegWre(RegWre), 
		.PCWre(PCWre), 
		.ALUOp(ALUOp)
	);

	initial begin
		// Initialize Inputs
		op = 0;
		zero = 0;

		// Wait 100 ns for global reset to finish
		#100;
         op = 6'b000000;
		#100;
			op = 6'b000001;
		#100;
			op = 6'b010000;
		#100;
			op = 6'b010001;
		#100;
			op = 6'b010010;
		#100;
			op = 6'b100000;
		#100;
			op = 6'b100110;
		#100;
			op = 6'b100111;
		#100;
			op = 6'b110000;
		#100;
			op = 6'b111111;
        
		// Add stimulus here

	end
      
endmodule

