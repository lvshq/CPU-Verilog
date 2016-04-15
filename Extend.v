`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SYSU
// Engineer: Shuangquan Lyu
// 
// Create Date:    20:33:25 03/15/2016 
// Design Name: 
// Module Name:    Extend 
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
module Extend(
	input ExtSel,
	input [15:0] data,
	output wire [31:0] extendOut
    );
	integer i;
	// 低16位仍为原来的数据
	assign extendOut[15:0] = data;
	// 高16位根据第16位进行扩展。ExtSel为0时表示0扩展；为1时表示符号扩展
	assign extendOut[31:16] = ExtSel ? (data[15] ? 16'hffff : 16'h0000) : 16'h0000;
endmodule
