`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:54:41 04/12/2021 
// Design Name: 
// Module Name:    EX_WB_Reg 
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
module EX_WB_Reg(input Clk, input Reset, input [7:0] Shift_Result, input [7:0] ID_EX_Data1, 
	input ID_EX_RegWrite, input ID_EX_SMCtrl, input [2:0] ID_EX_Write_Reg_Num, 
	output reg [7:0] EX_WB_Shift_Result, output reg [7:0] EX_WB_Data1, output reg EX_WB_RegWrite, 
	output reg EX_WB_SMCtrl, output reg [2:0] EX_WB_Write_Reg_Num //input [1:0] FwdCtrl
    );
	//reg [7:0] Fwd;
	always@(posedge Clk,negedge Reset)
	begin
	if(Reset==0)
		begin
		EX_WB_Shift_Result <= 0;
		EX_WB_Data1 <= 0;
		EX_WB_RegWrite <= 0;
		EX_WB_SMCtrl <= 0;
		EX_WB_Write_Reg_Num <= 0;
		end 
	else
		begin
		/*case(FwdCtrl)
		2'b10: begin
				 Fwd= EX_WB_Shift_Result;
				 //ID_EX_Data1 = Fwd;
				 EX_WB_Shift_Result = Fwd;
				 end
		2'b11: begin
				 Fwd= EX_WB_Data1;
				 //ID_EX_Data1 = Fwd;
				 EX_WB_Data1 = Fwd;
				 end
		default : begin
					 EX_WB_Shift_Result = Shift_Result;
					 EX_WB_Data1 = ID_EX_Data1;
					 end
		endcase*/
		EX_WB_Shift_Result <= Shift_Result;
		EX_WB_Data1 <= ID_EX_Data1;
		EX_WB_RegWrite <= ID_EX_RegWrite;
		EX_WB_SMCtrl <= ID_EX_SMCtrl;
		EX_WB_Write_Reg_Num <= ID_EX_Write_Reg_Num;
		end
	end 

endmodule
