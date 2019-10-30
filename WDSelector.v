/*
	寄存器组WriteData端口的选择器（对应图中右下角的选择器）。
*/
module WDSelector(
	input ALUM2Reg,
	input [31:0] result,
	input [31:0] DataOut,
	output wire [31:0] writeData
    );
	//ALum2Reg为1，数据来自DataOut即内存，否则来自result(ALU)
	assign writeData = ALUM2Reg ? DataOut : result;
endmodule
