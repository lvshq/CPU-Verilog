`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SYSU
// Engineer: Shuangquan Lyu
// 
// Create Date:    20:40:47 03/15/2016 
// Design Name: 
// Module Name:    ALUSelector 
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
module ALUSelector(
	input ALUSrcB,
	input [31:0] out2,
	input [31:0] extendOut,
	output wire [31:0]ALUSelectorOut
    );
	 
	// ALUSrcB为0时表示ALU的B端口接受来自寄存器堆data2输出；为1时表示接受来自sign或zero扩展的立即数
	assign ALUSelectorOut = ALUSrcB ? extendOut : out2;
endmodule
