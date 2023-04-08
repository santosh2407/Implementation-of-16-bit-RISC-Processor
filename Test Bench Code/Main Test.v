`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.04.2023 00:48:12
// Design Name: 
// Module Name: Main Test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module main_test();
reg clk;
reg reset;
reg we = 0;
reg [15:0] dataI = 0;
wire [2:0] selA;
wire [2:0] selB;
wire [2:0] selD;
wire [15:0] dataA;
wire [15:0] dataB;
wire [15:0] dataD;
wire [4:0] aluop;
wire [7:0] imm;
wire [15:0] dataO;
wire [1:0] opcode;
wire [15:0] pcO;
wire shldBranch;
wire enfetch;
wire enalu;
wire endec;
wire enmem;
wire enrgrd;
wire enrgwr;
    assign opcode = (reset) ? 2'b11 : ((shldBranch ? 2'b10 : ((we) ? 2'b01 : 2'b00)));
		reg_file main_reg(
		clk,
		en,
		we,
		selA,
		selB,
		selD,
		dataD,
		// outputs
		dataA,
		dataB
		);
inst_dec main_inst(
		clk,
		en,
		inst,
		aluop,
		selA,
		selB,
		selD,
		imm,
		regwe
		);
alu main_alu(
		clk,
		en, 
		aluop,
		dataA,
		dataB,
		imm,	
		// Outputs
		dataResult,
		shldBranch
		);
ctrl_unit main_ctri(
		clk,
		reset,
		enfetch,
		endec, 
		enrgrd,
		enalu,
		enrgwr,
		enmem
		);
pc_unit pc_main(
		clk,
		opcode,
		dataD,
		pcO
		);
fake_ram main_ram(
		clk,
		we,
		addr,
		dataI,
		// Outputs
		dataO
		);
initial begin
	clk = 0;
	reset = 1;
	#20
	reset = 0;
end
always begin
	#5;
	clk =  ~clk;
end
endmodule

