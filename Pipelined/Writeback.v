`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:14:41 04/07/2021 
// Design Name: 
// Module Name:    Writeback 
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
	module Writeback(
	input [7:0] Shift_Res,
	input [7:0] Data1,
	input opcode_6,
	input RegWrite,
	output reg [7:0] Write_Reg
    );
	
	always@(opcode_6)
	begin
	if(RegWrite==1)
		begin
		if(opcode_6==0)
		Write_Reg <= Shift_Res;
		else
		Write_Reg <= Data1;
		end
	end

endmodule
