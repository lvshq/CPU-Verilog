/*
	RegisterFile selector
*/

module RFSelector(
	input RegOut,
	input [4:0] rt,
	input [4:0] rd,
	output wire [4:0] RfSelectorOut
    );
	 // �ڼĴ������Write Reg�˿��ϣ��������Կ��Ƶ�Ԫ���źŵĿ��ơ���RegOutΪ1����д��Write Reg��Ϊָ��洢�������ָ���е�rd������Ϊrt
	 assign RfSelectorOut = RegOut ? rd : rt;
endmodule
