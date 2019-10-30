
module Extend(
	input ExtSel,
	input [15:0] data,
	output wire [31:0] extendOut
    );
	integer i;
	// ��16λ��Ϊԭ��������
	assign extendOut[15:0] = data;
	// ��16λ���ݵ�16λ������չ��ExtSelΪ0ʱ��ʾ0��չ��Ϊ1ʱ��ʾ������չ
	assign extendOut[31:16] = ExtSel ? (data[15] ? 16'hffff : 16'h0000) : 16'h0000;
endmodule
