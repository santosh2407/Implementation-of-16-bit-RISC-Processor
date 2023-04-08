`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.04.2023 00:47:00
// Design Name: 
// Module Name: Decoder UT
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


module decoder_unitests();
    reg I_Clk;
    reg I_En;
	reg [15:0] I_Inst;
//Wires 
	wire [4:0] O_Aluop;
	wire [3:0] O_SelA;
	wire [3:0] O_SelB;
	wire [3:0] O_SelD;
	wire [15:0] O_Imm;
	wire O_Regwe;
inst_dec inst_unit(
		I_Clk,
		I_En,
		I_Inst,
		O_Aluop,
		O_SelA,
		O_SelB,
		O_SelD,
		O_Imm,
		O_Regwe
		);
	 initial begin
		I_Clk = 0;
		I_En = 0;
		I_Inst = 0;
		#10;
		I_Inst = 16'b0001011100000100;
		#10;
		I_En = 1;
end
always begin
		#5;
		I_Clk = ~I_Clk;
end
endmodule
