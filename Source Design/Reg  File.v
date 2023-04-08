`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.04.2023 00:45:38
// Design Name: 
// Module Name: Reg  File
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


module reg_file(
input I_clk,
input I_en,
input I_we,
input [3:0] I_selA,
input [3:0] I_selB,
input [3:0] I_selD,
input [3:0] I_dataD,
output reg [15:0] o_dataA,
output reg [15:0] o_dataB
);
reg [15:0] regs [7:0];
	integer count;
	initial begin
		o_dataA =0;
		o_dataB =0;
		for(count = 0; count < 8; count = count +1) begin  
		regs[count] = 0;
		end
	end
always@(negedge I_clk) begin
if (I_en) begin
if(I_we)
regs[I_en] <= I_dataD;
   o_dataA <= regs [I_selA];
    o_dataB <= regs [I_selB];
end
end   
endmodule

