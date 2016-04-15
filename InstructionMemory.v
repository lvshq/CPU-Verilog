`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SYSU
// Engineer: Shuangquan Lyu
// 
// Create Date:    20:27:18 03/15/2016 
// Design Name: 
// Module Name:    InstructionMemory 
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
module InstructionMemory(
	input RW,
	input [31:0] IAddr,
	output [31:0] IDataOut
    );
	 reg [7:0] InsMEM [127:0];
	
	/*
	将指令代码初始化到指令存储器中，直接写入。
	将下方12条注释中的具体指令，按照各指令的格式，翻译成对应二进制
	*/
	
	initial begin
		//ORI $1 $0 10
		InsMEM[0] = 8'b01000000;
		InsMEM[1] = 8'b00000001;
		InsMEM[2] = 8'b00000000;
		InsMEM[3] = 8'b00001010;
		
		//ORI $2 $0 12
		InsMEM[4] = 8'b01000000;
		InsMEM[5] = 8'b00000010;
		InsMEM[6] = 8'b00000000;
		InsMEM[7] = 8'b00001100;
		
		//ADD $3 $1 $2
		InsMEM[8]  = 8'b00000000;
		InsMEM[9]  = 8'b00100010;
		InsMEM[10] = 8'b00011000;
		InsMEM[11] = 8'b00000000;
		
		//SUB $5 $2 $1
		InsMEM[12] = 8'b00000100;
		InsMEM[13] = 8'b01000001;
		InsMEM[14] = 8'b00101000;
		InsMEM[15] = 8'b00000000;
		
		//AND $4 $1 $2
		InsMEM[16] = 8'b01000100;
		InsMEM[17] = 8'b00100010;
		InsMEM[18] = 8'b00100000;
		InsMEM[19] = 8'b00000000;
		
		//OR $8 $1 $2
		InsMEM[20] = 8'b01001000;
		InsMEM[21] = 8'b00100010;
		InsMEM[22] = 8'b01000000;
		InsMEM[23] = 8'b00000000;
		
		//BEQ $1 $2 4
		InsMEM[24] = 8'b11000000;
		InsMEM[25] = 8'b00100010;
		InsMEM[26] = 8'b00000000;
		InsMEM[27] = 8'b00000100;
		
		//MOVE $11 $8
		InsMEM[28] = 8'b10000001;
		InsMEM[29] = 8'b00000000;
		InsMEM[30] = 8'b01011000;
		InsMEM[31] = 8'b00000000;
		
		//SW $2 300($1)
		InsMEM[32] = 8'b10011000;
		InsMEM[33] = 8'b00100010;
		InsMEM[34] = 8'b00000001;
		InsMEM[35] = 8'b00101100;
		
		//LW $1 298($2)
		InsMEM[36] = 8'b10011100;
		InsMEM[37] = 8'b01000001;
		InsMEM[38] = 8'b00000001;
		InsMEM[39] = 8'b00101010;
		
		//BEQ $1 $2 -5
		InsMEM[40] = 8'b11000000;
		InsMEM[41] = 8'b00100010;
		InsMEM[42] = 8'b11111111;
		InsMEM[43] = 8'b11111011;
		
		//HALT
		InsMEM[44] = 8'b11111100;
		InsMEM[45] = 8'b00000000;
		InsMEM[46] = 8'b00000000;
		InsMEM[47] = 8'b00000000;
		
	end

		assign IDataOut = { InsMEM[IAddr], InsMEM[IAddr + 1], InsMEM[IAddr + 2], InsMEM[IAddr+ 3] };

endmodule
