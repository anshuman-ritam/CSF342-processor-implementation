`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:01:04 04/09/2021 
// Design Name: 
// Module Name:    Shifter 
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
module Shifter(
	 input [2:0] A,
    input [7:0] B,
    output reg[7:0] Shift_Result
    );
	always@(A,B)
	begin
	Shift_Result=B<<A;
	end
endmodule
