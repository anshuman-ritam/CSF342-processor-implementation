`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:48:47 04/12/2021 
// Design Name: 
// Module Name:    ID_EX_Reg 
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
module ID_EX_Reg(
	input Clk, input Reset, input IF_ID_RegWrite, input IF_ID_SMCtrl, input [2:0] Read_Reg_Num1, 
	input [2:0] Read_Reg_Num2,	input [7:0] Data1, input [7:0]  Data2, input [2:0] Write_Reg_Num, 
	output reg ID_EX_RegWrite, output reg ID_EX_SMCtrl, output reg [2:0] ID_EX_Read_Reg_Num1, 
	output reg [2:0] ID_EX_Read_Reg_Num2, output reg [7:0] ID_EX_Data1, 
	output reg [7:0] ID_EX_Data2, output reg [2:0] ID_EX_Write_Reg_Num
    );

	always@(posedge Clk,negedge Reset)
	begin
	if(Reset==0)
		begin
		ID_EX_RegWrite<=0;
		ID_EX_SMCtrl<=0;
		ID_EX_Read_Reg_Num1 <= 0;
		ID_EX_Read_Reg_Num2 <= 0;
		ID_EX_Data1<=0;
		ID_EX_Data2<=0;
		ID_EX_Write_Reg_Num <= 0;
		end
	else
		begin
		ID_EX_RegWrite <= IF_ID_RegWrite;
		ID_EX_SMCtrl <= IF_ID_SMCtrl;
		ID_EX_Read_Reg_Num1 <= Read_Reg_Num1;
	   ID_EX_Read_Reg_Num2 <= Read_Reg_Num2;
		ID_EX_Data1 <= Data1;
		ID_EX_Data2 <= Data2;
		ID_EX_Write_Reg_Num <= Write_Reg_Num;
		end
	end

endmodule
