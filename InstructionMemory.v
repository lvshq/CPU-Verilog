
module InstructionMemory(
	input RW,
	input [31:0] IAddr,//PC
	output [31:0] IDataOut //输出指令
    );
	reg [7:0] InsMEM [127:0];
	
	/*
	将指令代码初始化到指令存储器中，直接写入。
	将下方注释中的具体指令，按照各指令的格式，翻译成对应二进制
	*/
	
	initial begin
		//ADD $3 $1 $2 
		//00000000 00100010 00011000 00000000
		//op=000000 rs=00001 rt=00010 rd=00000
		InsMEM[0] = 8'b00000000; //op
		InsMEM[1] = 8'b00100010; 
		InsMEM[2] = 8'b00011000;
		InsMEM[3] = 8'b00000000;

		//AND $4 $1 $2 
		//01000100 00100010 00100000 00000000
		//op=010001 rs=00001 rt=000010 rd=00100

		InsMEM[4] = 8'b01000100;
		InsMEM[5] = 8'b00100010;
		InsMEM[6] = 8'b00100000;
		InsMEM[7] = 8'b00000000;

		//SLT $4 $2 $3
		InsMEM[8]  = 8'b10101000;
		InsMEM[9]  = 8'b01000011;
		InsMEM[10] = 8'b00100000;
		InsMEM[11] = 8'b00000000;
		
		//SLTI $4 $5 #0
		InsMEM[12] = 8'b00101000;
		InsMEM[13] = 8'b10100100;
		InsMEM[14] = 8'b00000000;
		InsMEM[15] = 8'b00000000;

		//OR $8 $1 $2
		InsMEM[16] = 8'b01001000;
		InsMEM[17] = 8'b00100010;
		InsMEM[18] = 8'b01000000;
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
