`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.04.2023 00:44:01
// Design Name: 
// Module Name: Instruction Decoder
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


module inst_dec(
	input I_clk,
	input I_en,
	input [15:0] I_inst,
	
	output reg O_aluop,
	output reg [3:0] O_selA,
	output reg [3:0] O_selB,
	output reg [3:0] O_selD,
	output reg [15:0] O_imm,
	output reg O_regwe
);
	//initial block
	initial
	begin
		O_aluop = 0;
		O_selA = 0;
		O_selB = 0;
		O_selD = 0;
		O_imm = 0;
		O_regwe = 0;
	end 	
	//Instruction decoder block
	always@(negedge I_clk)
	begin
		if(I_en) begin
			O_aluop <= I_inst[15:11];   // opcode
			O_selA  <= I_inst[10:8];	//reg A
			O_selB  <= I_inst[7:5];		//reg B
			O_selD  <= I_inst[4:2];		//regD 
			O_imm  <= I_inst[7:0];		//Imm Data
		//reg write enable
		case(I_inst[15:12])	
			4'b0111: O_regwe <= 0;
			4'b1100: O_regwe <= 0;
			4'b1101: O_regwe <= 0;
			default: O_regwe <= 1;
		endcase
	end
	end
endmodule	

