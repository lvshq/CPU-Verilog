
//计算PC下一次的地址
module PCCalculator(
	input PCSrc,//控制信号
	input [31:0] prePC,
	input [31:0] extendOut,
	output wire [31:0] postPC
    );
	/*
	PC每次指向下一个地址。共32位（4字节），故每次PC需要加4
	若PCSrc为1，则将扩展后的数与加4后的PC相加；否则为PC+4
	*/ 
	assign postPC = PCSrc ? prePC + 4 + (extendOut << 2) : prePC + 4;
endmodule
