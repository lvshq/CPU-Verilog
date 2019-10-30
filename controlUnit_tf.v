
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

		// Wait 100 ns for global reset to finish。？
		#100;
        	op = 6'b000000;//add
        #100;
			op = 6'b010001;//and
		#100;
			op = 6'b101010;//slt
		#100;
			op = 6'b001010;//slti

		#100;
			op = 6'b111111;//hali
        
		// Add stimulus here

		reg i_add;
	reg i_sub;
	reg i_ori;
	reg i_and;
	reg i_or;
	reg i_move;
	reg i_sw;
	reg i_lw;
	reg i_beq;
	reg i_halt;
	reg i_slt;
	reg i_slti;

	end
      
endmodule

