
module CPU_tf;
	parameter tck = 10; ///< clock tick
	
	// Inputs
	reg CLK;
	reg Reset;

	// Outputs
	wire zero;
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
	wire [31:0] PCin;
	wire [31:0] PCout;
	wire [31:0] instruction;
	wire [5:0] op;
	wire [4:0] rs;
	wire [4:0] rt;
	wire [4:0] rd;
	wire [15:0] immediate;
	wire [4:0] RFSelectorOut;
	wire [31:0] extendOut;
	wire [31:0] readData1;
	wire [31:0] readData2;
	wire [31:0] ALUSelectorOut;
	wire [31:0] result;
	wire [31:0] dataOut;
	wire [31:0] writeData;
	wire [31:0] PCValue;
	// Instantiate the Unit Under Test (UUT)
	CPU uut (
		.CLK(CLK), 
		.Reset(Reset),
		.PCout(PCout), 
		.PCin(PCin),
		.instruction(instruction),
		
		.op(op),
		.rs(rs),
		.rt(rt),
		.rd(rd),
		.immediate(immediate),
		
		.zero(zero),
		.RegOut(RegOut),
		.InsMenRW(InsMenRW),
		.ExtSel(ExtSel),
		.DataMenRW(DataMenRW),
		.ALUM2Reg(ALUM2Reg),
		.ALUSrcB(ALUSrcB),
		.ALUSelectorOut(ALUSelectorOut),
		.PCSrc(PCSrc),
		.RegWre(RegWre),
		.RFSelectorOut(RFSelectorOut),
		.PCWre(PCWre),
		.result(result),
	   .writeData(writeData),
		.dataOut(dataOut),
		.readData1(readData1),
		.readData2(readData2),
		.extendOut(extendOut),
		.ALUOp(ALUOp),
		.PCValue(PCValue)
	);

	integer num_iter = 0 ;
	always #(tck/2) CLK <= ~CLK; // clocking device

	initial begin
		Reset = 0;
		CLK = 0;
		$dumpfile("cpu_ah.vcd");
		$dumpvars(-1, uut);
	
		// Wait 50 ns for global reset to finish
		// #10;
		// Reset = 0;
		
		// Initialize Inputs
		// forever begin
		// 	#10;
		// 	CLK = !CLK;
		// end
	
		// #(tck*2);
		
		// Reset = 1;
		// #(tck*2);
		
		// Reset = 0;
		// #(tck*2);
	end
	
	always @(posedge CLK) begin
		num_iter = num_iter + 1;
		if (num_iter > 10)
			$finish;
	end
      
endmodule

