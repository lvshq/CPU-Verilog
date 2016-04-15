`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SYSU
// Engineer: Shuangquan Lyu
// 
// Create Date:    23:24:06 03/15/2016 
// Design Name: 
// Module Name:    WireDistributor 
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
module WireDistributor(
	input [31:0] instruction,
	output wire [5:0] op,
	output wire [4:0] rs,
	output wire [4:0] rt,
	output wire [4:0] rd,
	output wire [15:0] immediate
    );
	 
	 // ����MIPS32��ָ���ʽ����ָ�ͬ�ֶλ��ֿ�������ֵ����Ӧwire������ע��rd���������ɹ���������ͬ�ֶΡ�
	 assign op = instruction[31:26];
	 assign rs = instruction[25:21];
	 assign rt = instruction[20:16];
	 assign rd = instruction[15:11];
	 assign immediate = instruction[15:0];
endmodule