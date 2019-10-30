
module PC(
	input clk,
	input reset,
	input PCWre, // PCWre��ʾPCдʹ�ܣ�Ϊ1��ʱ��pc����PCin
	input [31:0] PCin,
	output reg [31:0] PCOut
    );
	 reg [31:0] pc;  // pc��ʱ����
	 initial begin
		pc = 2'h00000100;
		PCOut = pc;
	 end
	 
	 always@( posedge clk ) begin
		if (reset == 1)  // reset�ź�Ϊ1��ʾ��PC����
			pc = 0;
		else
			if (PCWre == 1)
				pc = PCin;
	   PCOut = pc;
	 end
endmodule
