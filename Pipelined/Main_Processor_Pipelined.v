`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:57:11 04/12/2021 
// Design Name: 
// Module Name:    Main_Processor_Pipelined 
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
module Main_Processor_Pipelined(
	input Clk,
	input Reset
    );

	wire [7:0] Instruction_Code, IF_ID_Instruction_Code, jaddress, Data1, ID_EX_Data1, Fwd_ID_EX_Data1,
	EX_WB_Data1, Data2, ID_EX_Data2, Shift_Result, EX_WB_Shift_Result, Final_Write_Result;
	wire [5:0] partialjaddress;
	wire [2:0] Read_Reg_Num1, ID_EX_Read_Reg_Num1, Read_Reg_Num2, ID_EX_Read_Reg_Num2, Write_Reg_Num,
	ID_EX_Write_Reg_Num, EX_WB_Write_Reg_Num;
	wire RegWrite, IF_ID_RegWrite, ID_EX_RegWrite, EX_WB_RegWrite,
	jump, SMCtrl, IF_ID_SMCtrl, ID_EX_SMCtrl, EX_WB_SMCtrl ;
	wire [1:0] opcode, FwdCtrl;
	
	Instruction_Fetch mod1(Clk, Reset, jump, jaddress, Instruction_Code);
	/*jump is a control signal for checking whether the instruction is a jump and jaddress is the sign extended 
	address to which the PC must be added to go to the jump location*/
	
	assign partialjaddress = Instruction_Code[5:0];
	
	Sign_Extend mod2(partialjaddress, jaddress);
	//sign extends the 6 bit partial address to get the full jump address

	assign opcode = Instruction_Code[7:6];
	
	Control_Unit mod3(opcode, RegWrite, jump, SMCtrl);
	
	IF_ID_Reg mod4(Clk, Reset, RegWrite, SMCtrl, Instruction_Code,
	IF_ID_RegWrite, IF_ID_SMCtrl, IF_ID_Instruction_Code); 
	//Pipeline register 

	assign Read_Reg_Num1=IF_ID_Instruction_Code[2:0];
	assign Read_Reg_Num2=IF_ID_Instruction_Code[5:3];

	Register_File_Pipelined mod5(Reset, Read_Reg_Num1, Read_Reg_Num2, EX_WB_Write_Reg_Num, Final_Write_Result,
	EX_WB_RegWrite, Data1, Data2);
	//Pipelined Register has no clk inputs
	
	
	assign Write_Reg_Num = IF_ID_Instruction_Code [5:3];
	ID_EX_Reg mod6(Clk, Reset, IF_ID_RegWrite, IF_ID_SMCtrl, Read_Reg_Num1, Read_Reg_Num2, Data1, Data2,
	Write_Reg_Num, ID_EX_RegWrite, ID_EX_SMCtrl, ID_EX_Read_Reg_Num1, ID_EX_Read_Reg_Num2,
	ID_EX_Data1, ID_EX_Data2, ID_EX_Write_Reg_Num
	);
	//Pipeline Register
	
	Shifter_Pipelined mod7(ID_EX_Read_Reg_Num1, ID_EX_Data2, EX_WB_Shift_Result, EX_WB_Data1,FwdCtrl, Shift_Result);
	/*Pipelined shifter takes the immediate data and register data from the ID/EX register and and also takes
	the shift-result and data1 from EX/WB register in order to determine which input to take for calculating
	shift. It decides the input on the basis of the forward signals sent by the forwarding unit*/
	
	Forwarding_Unit mod8(ID_EX_Read_Reg_Num1, ID_EX_Read_Reg_Num2, EX_WB_Write_Reg_Num,
	EX_WB_Data1, EX_WB_Shift_Result, ID_EX_SMCtrl, EX_WB_SMCtrl, FwdCtrl);
	/*The forwarding unit takes inputs from ID/EX registers as well as EX/WB registers and then decides which 
	input will be taken for shifting in case of hazards. It sends appropriate the control signals according to the 
	hazard conditions*/
	
	Hazard_Check mod9(ID_EX_Data1, EX_WB_Data1, EX_WB_Shift_Result, FwdCtrl,Fwd_ID_EX_Data1);
	/*This unit can be called as an extension of the forwading unit. It decides which input to be moved in case
	there is a data-dependency from a previous instruction*/
	
	/*In essence the forwarding unit resolves hazards for the shift instruction which are currently in EX stage
	and Hazard_Check unit resolves hazards for the mov instructions which are currenlt in the EX stage*/
	
	EX_WB_Reg mod10(Clk, Reset, Shift_Result, Fwd_ID_EX_Data1, ID_EX_RegWrite, ID_EX_SMCtrl,
	ID_EX_Write_Reg_Num, EX_WB_Shift_Result, EX_WB_Data1, EX_WB_RegWrite, EX_WB_SMCtrl, EX_WB_Write_Reg_Num);
	//Pipeline Register
	
	Writeback mod11(EX_WB_Shift_Result, EX_WB_Data1, EX_WB_SMCtrl, EX_WB_RegWrite, Final_Write_Result);
	/*Checks on the basis of RegWrite whether there should be a write and then checks on the basis of SMControl
	whether the write happens from shift or mov*/


endmodule
