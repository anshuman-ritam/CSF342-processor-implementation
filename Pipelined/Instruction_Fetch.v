`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:41:04 04/04/2021 
// Design Name: 
// Module Name:    Instruction_Fetch 
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
module Instruction_Fetch(
	 input Clk,
    input Reset,
	 input jump,
	 input [7:0] jaddress,
    output [7:0] Instruction_Code
    );
	 
	reg [7:0] PC;
	Instruction_Mem IMem(PC,Reset,Instruction_Code);
	always@(posedge Clk, negedge Reset)
		begin
		if(Reset==0)
		PC<=0;
		else
			begin
			if(jump==1)
			PC<=PC+jaddress;
			else
			PC<=PC+1;
			end
		end

endmodule
