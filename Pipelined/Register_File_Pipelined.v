`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:06:51 04/12/2021 
// Design Name: 
// Module Name:    Register_File_Pipelined 
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
module Register_File_Pipelined(
	input Reset, input [2:0] Read_Reg_Num1, input [2:0] Read_Reg_Num2, input [2:0] Write_Reg_Num,
	input [7:0] Write_Data, input RegWrite, output [7:0] Data1, output [7:0] Data2
    );
	reg [7:0] Reg_Mem [7:0];
	
	assign Data1 = Reg_Mem[Read_Reg_Num1];
	assign Data2 = Reg_Mem[Read_Reg_Num2];
	always @*
	begin
		if(Reset==0)
		begin
			Reg_Mem[0]=0;
			Reg_Mem[1]=1;
			Reg_Mem[2]=2;
			Reg_Mem[3]=3;
			Reg_Mem[4]=4;
			Reg_Mem[5]=5;
			Reg_Mem[6]=6;
			Reg_Mem[7]=7;
		end
		
		else if(RegWrite==1)
			Reg_Mem[Write_Reg_Num] = Write_Data;
		
	end

endmodule
