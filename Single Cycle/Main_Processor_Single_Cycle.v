`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:44:47 04/04/2021 
// Design Name: 
// Module Name:    Main_Processor_Single_Cycle 
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
module Main_Processor_Single_Cycle(
	input Clk,
	input Reset
    );
	
	wire [7:0] Instruction_Code, jaddress, Data1, Data2, Write_Result, Shift_Result;
	wire [5:0] partialjaddress;
	wire [2:0] Read_Reg_Num1, Read_Reg_Num2, Write_Reg_Num;
	wire RegWrite, jump, SMCtrl;
	wire [1:0] opcode;
	
	Instruction_Fetch mod1(Clk, Reset, jump, jaddress, Instruction_Code);
	/*jump is a control signal for checking whether the instruction is a jump and jaddress is the sign extended 
	address to which the PC must be added to go to the jump location*/
	
	assign partialjaddress = Instruction_Code[5:0];
	
	Sign_Extend mod2(partialjaddress, jaddress);
	//Sign extends the 6 bit partial address to get the full jump address

	assign Read_Reg_Num1=Instruction_Code[2:0];
	assign Read_Reg_Num2=Instruction_Code[5:3];
	assign Write_Reg_Num=Instruction_Code[5:3];

	Register_File mod3(Reset, Clk, Read_Reg_Num1, Read_Reg_Num2, Write_Reg_Num, Write_Result, RegWrite,
	Data1, Data2);
	
	assign opcode = Instruction_Code[7:6];
	
	Control_Unit mod4(opcode, RegWrite, jump, SMCtrl);
	//jump is the control signal for checking whether the signal is a jump
	//SMControl =1 implies a mov and SMControl = 0 implies a shift. 
	
	Shifter mod5(Read_Reg_Num1, Data2, Shift_Result);
	//Takes immediate data and register data to calculate shift
	
	Writeback mod6(Shift_Result, Data1, SMCtrl, RegWrite, Write_Result);
	/*Checks on the basis of RegWrite whether there should be a write and then checks on the basis of SMControl
	whether the write happens from shift or mov*/

endmodule
