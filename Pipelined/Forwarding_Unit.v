`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:38:12 04/12/2021 
// Design Name: 
// Module Name:    Forwarding_Unit 
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
module Forwarding_Unit(
	input [2:0] ID_EX_Read_Reg_Num1, input [2:0] ID_EX_Read_Reg_Num2, input [2:0] EX_WB_Write_Reg_Num,
	input [7:0] EX_WB_Data1, input [7:0] EX_WB_Shift_Result, input ID_EX_SMCtrl, input EX_WB_SMCtrl,
	output reg [1:0] FwdCtrl 
	);
	reg [4:0] counter = 5'b00000;
	always@*
	begin
	if (counter>=2)
	begin
	if(ID_EX_Read_Reg_Num2 == EX_WB_Write_Reg_Num) 
		begin
		case({ID_EX_SMCtrl,EX_WB_SMCtrl})
		2'b00: FwdCtrl = 2'b00;//route from EX_WB_Shift_Result to ID_EX_Data2
		2'b01: FwdCtrl = 2'b01;//route from exwbdata1 to ID_EX_Data2
		endcase
		end
	else if(ID_EX_Read_Reg_Num1 == EX_WB_Write_Reg_Num)
		begin
		case({ID_EX_SMCtrl,EX_WB_SMCtrl})
		2'b10: FwdCtrl = 2'b10;//route from EX_WB_Shift_Result to ID_EX_Data1
		2'b11: FwdCtrl = 2'b11;//route from EX_WB_Data1 to ID_EX_Data1
		endcase
		end
	else FwdCtrl = 2'bxx;
	end
	counter=counter+1;
	end
endmodule
