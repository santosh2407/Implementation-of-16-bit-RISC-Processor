`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.04.2023 00:44:54
// Design Name: 
// Module Name: PC Unit
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


module pc_unit (
input I_clk,
input [1:0] I_opcode, 
input [15:0] I_pc,
output reg [15:0] o_pc
);
initial begin
     o_pc <= 0;
end
always@(negedge I_clk) begin
	case (I_opcode) 
		2'b00 :  o_pc <= o_pc;
		2'b01 : o_pc <= o_pc + 1;
		2'b10 : o_pc <= I_pc;
		2'b11 : o_pc <= 0;
    endcase
end
endmodule
