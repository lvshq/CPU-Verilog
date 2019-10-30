
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
		输入：
			RegWrite：来自控制单元的信号，指示寄存器堆能否被写入
			read1：读取的第一个寄存器
			read2：读取的第二个寄存器
			write：读取需要被写入数值的寄存器
			writeData：需要写入的数据
		输出：
			out1：读取的第一个寄存器的值
			out2：读取的第二个寄存器的值
		内部变量
			registers：寄存器堆
	 */
	reg [31:0] registers [31:0];  // 具有32个32位寄存器的存储器
	
	integer file;
	integer i;

	// 读取寄存器堆内的数据，从文件"registerFile.txt"读取
	initial begin
		$readmemb( "registerFile.txt", registers, 0, 31 );
	end
	
	// read1和read2表示要读取的寄存器的地址，取值范围均为[0, 31]。
	assign out1 = registers[read1];
	assign out2 = registers[read2];	
	
	always@( negedge clk ) begin
		//寄存器写入操作
		//当写入的目标寄存器不是寄存器0并且RegWrite=1（表示寄存器能够写入时）才有效
		if ( ( write != 0 ) && ( RegWrite == 1 ) ) begin
   			registers[write] = writeData;           // 写存储器
			$display("write %d", write);
			$display("RegWrite %d", RegWrite);
			$display("writeData %d", writeData);
		end
	 end
	 
endmodule
