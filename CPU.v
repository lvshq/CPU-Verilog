`timescale 1ns / 1ps
`include "PC.v"
`include "PCCalculator.v"
`include "InstructionMemory.v"
`include "wireDistributor.v"
`include "RFSelector.v"
`include "RegisterFile.v"
`include "CU.v"
`include "Extend.v"
`include "ALUSelector.v"
`include "ALU.v"
`include "DataMemory.v"
`include "WDSelector.v"

module CPU(
	 input CLK,
	 input Reset,
	 output wire [31:0] PCout, PCin, instruction,
	 output wire [5:0] op,
	 output wire [4:0] rs, rt, rd, RFSelectorOut,
	 output wire [15:0] immediate,
	 output wire zero,
	 output wire RegOut, InsMenRW, ExtSel, DataMenRW, ALUM2Reg, ALUSrcB, PCSrc, RegWre, PCWre, // control unit signal
	 output wire [31:0] result, writeData, dataOut, readData1, readData2, extendOut, PCValue, ALUSelectorOut,
	 output wire [2:0] ALUOp
    );
	
	assign PCValue = PCout;
	
	/*
	CPU处理指令的步骤：
	1.取指令
	2.指令译码
	3.指令执行
	4.存储器访问
	5.结果写回
	*/
	// 取PC
	PC pc(CLK, Reset, PCWre, PCin, PCout);
	// 计算下一个PC
	PCCalculator PcCalculator(PCSrc, PCout, extendOut, PCin);
	// 取指令
	InstructionMemory instructionMemory(InsMenRW, PCout, instruction);
	// 指令存储器IDataOut端口连接的分线模块
	WireDistributor wireDistributor(instruction, op, rs, rt, rd, immediate);
	// 选择需要被写入数值的寄存器（RF表示Register File）
	RFSelector RfSelector(RegOut, rt, rd, RFSelectorOut);
	// 寄存器组
	RegisterFile registerFile(CLK, RegWre, rs, rt, RFSelectorOut, writeData, readData1, readData2);
	// 控制单元
	CU controlUnit(op, zero, RegOut, InsMenRW, ExtSel, DataMenRW, ALUM2Reg, ALUSrcB, PCSrc, RegWre, PCWre, ALUOp);
	// 立即数扩展
	Extend extend(ExtSel, immediate, extendOut);
	// 执行算术或逻辑的第二个操作数，对应ALU模块的B端口
	ALUSelector AluSelector(ALUSrcB, readData2, extendOut, ALUSelectorOut);
	// 算术逻辑单元，执行算术和逻辑运算
	ALU Alu (readData1, ALUSelectorOut, ALUOp, result, zero);
	// 数据存储器，可读出或写入数据
	DataMemory dataMemory(DataMenRW, result, readData2, dataOut);
	// 寄存器组WriteData端口的选择器（对应图中右下角的选择器）（WD表示WireDistributor）
	WDSelector WdSelector(ALUM2Reg, result, dataOut, writeData);
endmodule
