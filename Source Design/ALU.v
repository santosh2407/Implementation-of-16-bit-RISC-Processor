`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.04.2023 00:38:59
// Design Name: 
// Module Name: ALU
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


module alu(
	//Inputs
	input I_clk,
	input I_en,
	input [4:0] I_aluop,
	input [15:0] I_dataA,
	input [15:0] I_dataB,
	input [7:0] I_imm,
	//Outputs
	output [15:0] O_dataResult,
	output reg O_shlBranch
	
);
	//Reg Declaration
	reg [17:0] int_result;
	wire op_lsb;
	wire [3:0] opcode; 
	//Parameter Decleration
	localparam Add   = 0,
				  Sub   = 1,
				  OR    = 2,
				  AND   = 3,
				  XOR   = 4,
				  NOT   = 5,
				  Load  = 8,
				  Cmp   = 9,
				  SHL   = 10,
				  SHR   = 11,
				  JMPA  = 12,
				  JMPR  = 13;	
	//Initial Blocks
	initial begin
      	int_result <= 0;
	end
	//Assigning Values
	assign op_lsb = I_aluop[0];
	assign op_lsb = I_aluop[4:1];
	//ALU Operations
	always@(negedge I_clk) begin
		if(I_en) begin
			case(opcode)
				Add : begin
						  int_result <= (op_lsb ? ($signed(I_dataA) + $signed(I_dataB)) : (I_dataA + I_dataB) );
						  O_shlBranch <= 0;
						end
				Sub : begin	
							int_result <= (op_lsb ? ($signed(I_dataA) - $signed(I_dataB)) : (I_dataA - I_dataB) );
							O_shlBranch <= 0;
						end		
				OR  : begin
							int_result <= I_dataA | I_dataB;
							O_shlBranch <= 0;
						end 	
				AND :	begin 
							int_result <= I_dataA & I_dataB;	
							O_shlBranch <= 0;	
						end
				XOR :	begin 
							int_result <= I_dataA ^ I_dataB;	
							O_shlBranch <= 0;	
						end		
				NOT :	begin 
							int_result <= ~I_dataA;	
							O_shlBranch <= 0;	
						end			
				Load :  begin
							int_result <= (op_lsb ? ({I_imm, 8'h00}) : ({8'h00, I_imm}) );
							O_shlBranch <= 0;
			           	     end 
 				SHL : begin 
 				       int_result <= I_dataA << (I_dataB[3:0]);		
 				       end 	
				SHR : begin 		
					   int_result <= I_dataA >> (I_dataB[3:0]);
					   O_shlBranch <= 0;			
						end	
				JMPA : begin 
						int_result <= (op_lsb ? I_dataA : I_imm);
						O_shlBranch <= 1;
						 end 
				JMPR : begin
							int_result <= I_dataA;
	                        O_shlBranch <= I_dataB[{op_lsb , I_imm[1:0]}];			
						 end
			          
				endcase 
		 end 
	end  		 
endmodule
