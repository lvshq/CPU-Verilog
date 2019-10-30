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
	CPU����ָ��Ĳ��裺
	1.ȡָ��
	2.ָ������
	3.ָ��ִ��
	4.�洢������
	5.���д��
	*/
	// ȡPC
	PC pc(CLK, Reset, PCWre, PCin, PCout);
	// ������һ��PC
	PCCalculator PcCalculator(PCSrc, PCout, extendOut, PCin);
	// ȡָ��
	InstructionMemory instructionMemory(InsMenRW, PCout, instruction);
	// ָ��洢��IDataOut�˿����ӵķ���ģ��
	WireDistributor wireDistributor(instruction, op, rs, rt, rd, immediate);
	// ѡ����Ҫ��д����ֵ�ļĴ�����RF��ʾRegister File��
	RFSelector RfSelector(RegOut, rt, rd, RFSelectorOut);
	// �Ĵ�����
	RegisterFile registerFile(CLK, RegWre, rs, rt, RFSelectorOut, writeData, readData1, readData2);
	// ���Ƶ�Ԫ
	CU controlUnit(op, zero, RegOut, InsMenRW, ExtSel, DataMenRW, ALUM2Reg, ALUSrcB, PCSrc, RegWre, PCWre, ALUOp);
	// ��������չ
	Extend extend(ExtSel, immediate, extendOut);
	// ִ���������߼��ĵڶ�������������ӦALUģ���B�˿�
	ALUSelector AluSelector(ALUSrcB, readData2, extendOut, ALUSelectorOut);
	// �����߼���Ԫ��ִ���������߼�����
	ALU Alu (readData1, ALUSelectorOut, ALUOp, result, zero);
	// ���ݴ洢�����ɶ�����д������
	DataMemory dataMemory(DataMenRW, result, readData2, dataOut);
	// �Ĵ�����WriteData�˿ڵ�ѡ��������Ӧͼ�����½ǵ�ѡ��������WD��ʾWireDistributor��
	WDSelector WdSelector(ALUM2Reg, result, dataOut, writeData);
endmodule
