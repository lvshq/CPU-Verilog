
module ALU(
	in1,
	in2,
	ALUC,
	Out,
	Zero
    );
	 
	 /*
		输入：
			ALUC：选择算数运算类型
			in1：算术运算器的第一个输入
			in2：算术运算器的第二个输入
		输出：
			Out：运算结果
			Zero：运算结果是否为0
	 */
	 
	 input [31:0] in1;
	 input [31:0] in2;
	 input [2:0] ALUC;
	 output reg [31:0] Out;
	 output reg Zero;
	 
	 initial begin
		Zero = 0;
	 end
	 
	 always@( in1 or in2 or ALUC ) begin
		case( ALUC )
			3'b000: begin
				Out = in1 + in2;
				//$display( "add" );
			end
			
			3'b010: begin
				Out = (in1 < in2)? 1:0;
				//$display("slt");
			end
			
			3'b100: begin
				Out = in1 & in2;
				//$display("and");
			end
			
			3'b101: begin
				Out =  (in1 < in2)? 1:0;
				//$display("sltI");
			end
		endcase
		
		if( Out == 0 )
			Zero = 1;
		else
			Zero = 0;
		
		/*
		$display( "alu_in1 %d", in1 );
		$display( "alu_in2 %d", in2 );
		$display( "alu_out %d", Out );
		$display( "Zero %d", Zero );
		*/
		
	end
	
	
endmodule
