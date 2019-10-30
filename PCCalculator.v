
//����PC��һ�εĵ�ַ
module PCCalculator(
	input PCSrc,//�����ź�
	input [31:0] prePC,
	input [31:0] extendOut,
	output wire [31:0] postPC
    );
	/*
	PCÿ��ָ����һ����ַ����32λ��4�ֽڣ�����ÿ��PC��Ҫ��4
	��PCSrcΪ1������չ��������4���PC��ӣ�����ΪPC+4
	*/ 
	assign postPC = PCSrc ? prePC + 4 + (extendOut << 2) : prePC + 4;
endmodule
