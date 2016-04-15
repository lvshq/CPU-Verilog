`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SYSU
// Engineer: Shuangquan Lyu
// 
// Create Date:    20:38:26 03/15/2016 
// Design Name: 
// Module Name:    RFSelector 
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
	RegisterFile selector
*/

module RFSelector(
	input RegOut,
	input [4:0] rt,
	input [4:0] rd,
	output wire [4:0] RfSelectorOut
    );
	 // 在寄存器组的Write Reg端口上，接受来自控制单元的信号的控制。若RegOut为1，则写入Write Reg的为指令存储器输出的指令中的rd；否则为rt
	 assign RfSelectorOut = RegOut ? rd : rt;
endmodule
