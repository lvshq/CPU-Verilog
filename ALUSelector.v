
module ALUSelector(
	input ALUSrcB,
	input [31:0] out2,
	input [31:0] extendOut,
	output wire [31:0]ALUSelectorOut
    );
	 
	// ALUSrcBΪ0ʱ��ʾALU��B�˿ڽ������ԼĴ�����data2���
	// Ϊ1ʱ��ʾ��������sign��zero��չ��������
	assign ALUSelectorOut = ALUSrcB ? extendOut : out2;
endmodule
