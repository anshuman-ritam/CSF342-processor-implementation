`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:13:32 04/04/2021 
// Design Name: 
// Module Name:    Control_Unit 
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
module Control_Unit(
	input [1:0] opcode,
	output reg RegWrite,
	output reg jump,
	output reg SMControl
    );

	always@(opcode)
	begin
	case(opcode)
	2'b00: begin
			 SMControl=1;//Mov
			 jump=0;
			 RegWrite=1;
			 end
	2'b01: begin
			 SMControl=0;//sll
			 jump=0;
			 RegWrite=1;
			 end
	2'b11: begin
			 jump=1;
			 RegWrite=0;
			 end
	endcase
	end
endmodule
