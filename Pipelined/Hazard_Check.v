`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:41:13 04/13/2021 
// Design Name: 
// Module Name:    Hazard_Check 
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
module Hazard_Check(
	input [7:0] ID_EX_Data1, input [7:0] EX_WB_Data1, input [7:0] EX_WB_Shift_Result, 
	input [1:0] FwdCtrl, output reg [7:0] Fwd_ID_EX_Data1
    );
	always@*
	begin
		case(FwdCtrl)
		2'b10: Fwd_ID_EX_Data1 = EX_WB_Shift_Result;
		2'b11: Fwd_ID_EX_Data1 = EX_WB_Data1;
		default : Fwd_ID_EX_Data1 = ID_EX_Data1;
		endcase
	end
endmodule
