
module DataMemory(
	input RW,
	input [31:0] DAddr,
	input [31:0] DataIn,
	output reg [31:0] DataOut
    );
	 
	 /*
	   ���룺
			DAddr����ȡ����д�����ݵĵ�ַ
			Datain����Ҫд�������
			RW���洢���ܷ�д������
		�����
			DataOut����ȡ������
	 */
	 
	 // Ҫ��8λ���ֽڣ���ʽ���������ݴ洢���е�����
	 reg [7:0] DataMem [511:0];
	 
	 initial begin
		$readmemb("dataMemory.txt", DataMem, 0, 511);
		DataOut = 16'h0000;
	 end
	
	 always@ ( DAddr or RW ) begin
		 // ���ֽڶ�Ӧ��ֵ
		 if (RW == 0) begin
		    DataOut[31:24] = DataMem[DAddr];
			 DataOut[23:16] = DataMem[DAddr+1];
			 DataOut[15:8] = DataMem[DAddr+2];
			 DataOut[7:0] = DataMem[DAddr+3];
		 end
		 
		 if (RW == 1) begin
			 DataMem[DAddr] = DataIn[31:24];
			 DataMem[DAddr+1] = DataIn[23:16];
			 DataMem[DAddr+2] = DataIn[15:8];
			 DataMem[DAddr+3] = DataIn[7:0];
			 
			 $display("DAddr %d", DAddr);
			 $display("DaraMenRW %d", RW);
			 $display("DataOut %d", DataOut);
			 $display("DataMem[DAddr]", DataMem[DAddr+3]);
		 end
	 end

endmodule
