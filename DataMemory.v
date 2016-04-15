`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SYSU
// Engineer: Shuangquan Lyu
// 
// Create Date:    20:35:21 03/15/2016 
// Design Name: 
// Module Name:    DataMemory 
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
module DataMemory(
	input RW,
	input [31:0] DAddr,
	input [31:0] DataIn,
	output reg [31:0] DataOut
    );
	 
	 /*
	   输入：
			DAddr：读取或者写入数据的地址
			Datain：需要写入的数据
			RW：能否写入数据
		输出：
			DataOut：读取的数据
	 */
	 
	 // 要用8位宽（字节）形式来保存数据存储器中的数据
	 reg [7:0] DataMem [511:0];
	 
	 initial begin
		$readmemb("dataMemory.txt", DataMem, 0, 511);
		DataOut = 16'h0000;
	 end
	
	 always@ ( DAddr or RW ) begin
		 // 按字节对应赋值
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
