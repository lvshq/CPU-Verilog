
module PC(
	input clk,
	input reset,
	input PCWre, // PCWre表示PC写使能，为1的时候pc等于PCin
	input [31:0] PCin,
	output reg [31:0] PCOut
    );
	 reg [31:0] pc;  // pc暂时保存
	 initial begin
		pc = 2'h00000100;
		PCOut = pc;
	 end
	 
	 always@( posedge clk ) begin
		if (reset == 1)  // reset信号为1表示将PC置零
			pc = 0;
		else
			if (PCWre == 1)
				pc = PCin;
	   PCOut = pc;
	 end
endmodule
