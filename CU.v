
module CU(
	input [5:0]op, // ��ʾ��Ҫ������Ĳ���
	input zero,
	output wire RegOut,
	output wire InsMenRW,
	output wire ExtSel,
	output wire DataMenRW,
	output wire ALUM2Reg,
	output wire ALUSrcB,
	output wire PCSrc,
	output wire RegWre,
	output wire PCWre,
	output wire [2:0] ALUOp
    );
	// ָ����볤��Ϊ32�����6λΪ�����룬Ψһ��ʶһ�����ָ��
	reg [5:0] ADD;
	reg [5:0] SUB;
	reg [5:0] ORI;
	reg [5:0] AND;
	reg [5:0] OR;
	reg [5:0] MOVE;
	reg [5:0] SW;
	reg [5:0] LW;
	reg [5:0] BEQ;
	reg [5:0] HALT;
	reg [5:0] SLT;
	reg [5:0] SLTI;
	
	reg i_add;
	reg i_sub;
	reg i_ori;
	reg i_and;
	reg i_or;
	reg i_move;
	reg i_sw;
	reg i_lw;
	reg i_beq;
	reg i_halt;
	reg i_slt;
	reg i_slti;
	
	initial begin
		i_add = 0;
		i_sub = 0;
		i_ori = 0;
		i_and = 0;
		i_or = 0;
		i_move = 0;
		i_sw = 0;
		i_lw = 0;
		i_beq = 0;
		i_halt = 0;
		i_slt =0;
		i_slti =0;
	end
	
	// ������1 �����źŵ����á������ݱ�������д�����ź��߼����ʽ���ó�����ֵ��䣨��ʱ��ӳ���źŵı仯��Ϊ��wire��ֵ
	assign ALUSrcB = i_ori || i_sw || i_lw || i_slti;
	assign ALUM2Reg = i_lw;
	assign RegWre = i_add || i_sub || i_ori || i_and || i_or || i_move || i_lw || i_slt || i_slti;
	assign DataMenRW = i_sw;
	assign ExtSel = i_sw || i_lw || i_beq;
	assign PCSrc = i_beq && zero;
	assign RegOut = i_add || i_sub || i_and || i_or || i_move ||i_slt;
	assign PCWre = !i_halt;
	assign ALUOp[2] = i_and || i_slti;
	assign ALUOp[1] = i_ori || i_or || i_slt;
	assign ALUOp[0] = i_sub || i_ori || i_or || i_beq || i_slti;
	assign InsMenRW = 0;
	
	// ÿ����Ҫ������Ĳ������͸ı䣬����zero�ź�Ϊ1ʱ���жϲ��ı��������ֵ
	always@(op or zero) begin
	   // ��ʼ����ָ��Ĳ����롣
		ADD = 6'b000000;
		AND = 6'b010001;
		SLT = 6'b101010;
		SLTI =6'b001010;
		HALT =6'b111111;
		
		i_add = 0;
		i_sub = 0;
		i_ori = 0;
		i_and = 0;
		i_or = 0;
		i_move = 0;
		i_sw = 0;
		i_lw = 0;
		i_beq = 0;
		i_halt = 0;
		i_slti =0;
		i_slt =0;
		
		// ��������� ��ΪADD�Ѿ�����ʼ��
		case (op)
			ADD: begin
				i_add = 1;
			end
			AND: begin
				i_and = 1;
			end
			SLT: begin
				i_slt = 1;
			end
			SLTI: begin
				i_slti = 1;
			end
			HALT: begin
				i_halt = 1;
			end
		endcase
	end

endmodule
