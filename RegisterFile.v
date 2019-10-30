
module RegisterFile(
	input clk,
	input RegWrite,
	input [4:0] read1,
	input [4:0] read2,
	input [4:0] write,
	input [31:0] writeData,
	output wire [31:0] out1,
	output wire [31:0] out2
    );
	 
	 /*
		���룺
			RegWrite�����Կ��Ƶ�Ԫ���źţ�ָʾ�Ĵ������ܷ�д��
			read1����ȡ�ĵ�һ���Ĵ���
			read2����ȡ�ĵڶ����Ĵ���
			write����ȡ��Ҫ��д����ֵ�ļĴ���
			writeData����Ҫд�������
		�����
			out1����ȡ�ĵ�һ���Ĵ�����ֵ
			out2����ȡ�ĵڶ����Ĵ�����ֵ
		�ڲ�����
			registers���Ĵ�����
	 */
	reg [31:0] registers [31:0];  // ����32��32λ�Ĵ����Ĵ洢��
	
	integer file;
	integer i;

	// ��ȡ�Ĵ������ڵ����ݣ����ļ�"registerFile.txt"��ȡ
	initial begin
		$readmemb( "registerFile.txt", registers, 0, 31 );
	end
	
	// read1��read2��ʾҪ��ȡ�ļĴ����ĵ�ַ��ȡֵ��Χ��Ϊ[0, 31]��
	assign out1 = registers[read1];
	assign out2 = registers[read2];	
	
	always@( negedge clk ) begin
		//�Ĵ���д�����
		//��д���Ŀ��Ĵ������ǼĴ���0����RegWrite=1����ʾ�Ĵ����ܹ�д��ʱ������Ч
		if ( ( write != 0 ) && ( RegWrite == 1 ) ) begin
   			registers[write] = writeData;           // д�洢��
			$display("write %d", write);
			$display("RegWrite %d", RegWrite);
			$display("writeData %d", writeData);
		end
	 end
	 
endmodule
