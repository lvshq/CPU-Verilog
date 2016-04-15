`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:08:53 03/17/2016 
// Design Name: 
// Module Name:    PCTest 
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
module PCTest(
	input CLK,
	input Reset,
	output PCin,
	output PCout
    );
	 reg PCWre;
	 reg PCSrc;
	 reg [31:0] extendOut;
	 
	 wire [31:0] PCout;
	 wire [31:0] PCin;
	 
	 initial begin
		PCWre = 1;
		PCSrc = 0;
		extendOut = 0;
	 end
	PC pc(CLK, Reset, PCWre, PCin, PCout);
	PCCalculator PcCalculator(PCSrc, PCout, extendOut, PCin);
endmodule
