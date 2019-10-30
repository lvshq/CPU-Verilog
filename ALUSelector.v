
module ALUSelector(
	input ALUSrcB,
	input [31:0] out2,
	input [31:0] extendOut,
	output wire [31:0]ALUSelectorOut
    );
	 
	// ALUSrcB为0时表示ALU的B端口接受来自寄存器堆data2输出
	// 为1时表示接受来自sign或zero扩展的立即数
	assign ALUSelectorOut = ALUSrcB ? extendOut : out2;
endmodule
