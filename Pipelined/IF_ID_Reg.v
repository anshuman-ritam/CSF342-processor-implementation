`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:39:29 04/12/2021 
// Design Name: 
// Module Name:    IF_ID_Reg 
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
module IF_ID_Reg(
	input Clk, input Reset, input RegWrite, input SMCtrl, input [7:0] Instruction_Code,
	output reg IF_ID_RegWrite, output reg IF_ID_SMCtrl, output reg [7:0] IF_ID_Instruction_Code
    );
	
	 always@(posedge Clk, negedge Reset)
	 begin
	 if(Reset==0)
		begin
		IF_ID_Instruction_Code <= 0;
		IF_ID_RegWrite <= 0;
		IF_ID_SMCtrl <= 0;
		end
	 else
		begin
		IF_ID_Instruction_Code <= Instruction_Code;
		IF_ID_RegWrite <= RegWrite;
		IF_ID_SMCtrl <= SMCtrl;
		end
	 end

endmodule
