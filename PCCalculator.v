`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SYSU
// Engineer: Shuangquan Lyu
// 
// Create Date:    21:57:08 03/15/2016 
// Design Name: 
// Module Name:    PCCalculator 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

/*
 计算PC下一次的地址
*/
module PCCalculator(
	input PCSrc,
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
