/*
	�Ĵ�����WriteData�˿ڵ�ѡ��������Ӧͼ�����½ǵ�ѡ��������
*/
module WDSelector(
	input ALUM2Reg,
	input [31:0] result,
	input [31:0] DataOut,
	output wire [31:0] writeData
    );
	//ALum2RegΪ1����������DataOut���ڴ棬��������result(ALU)
	assign writeData = ALUM2Reg ? DataOut : result;
endmodule
