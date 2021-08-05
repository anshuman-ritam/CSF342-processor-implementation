`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:50:40 04/12/2021 
// Design Name: 
// Module Name:    Shifter_Pipelined 
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
module Shifter_Pipelined(
	 input [2:0] A,
    input [7:0] B,
	 input [7:0] EX_WB_Shift_Result,
	 input [7:0] EX_WB_Data1,
	 input [1:0] FwdCtrl,
    output reg[7:0] Shift_Result
    );
	always@*
	begin
	case(FwdCtrl)
	2'b00:Shift_Result=EX_WB_Shift_Result<<A;
	2'b01:Shift_Result=EX_WB_Data1<<A;
	default : Shift_Result=B<<A;
	endcase
	end
endmodule
