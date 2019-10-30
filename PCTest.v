
module PCTest(
	input CLK,
	input Reset,
	output PCin,
	output PCout
    );
	 reg PCWre;
	 reg PCSrc;
	 reg [31:0] extendOut;
	 
	 wire [31:0] PCout;
	 wire [31:0] PCin;
	 
	 initial begin
		PCWre = 1;
		PCSrc = 0;
		extendOut = 0;
	 end
	PC pc(CLK, Reset, PCWre, PCin, PCout);
	PCCalculator PcCalculator(PCSrc, PCout, extendOut, PCin);
endmodule
