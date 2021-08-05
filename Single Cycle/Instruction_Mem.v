`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:44:56 04/04/2021 
// Design Name: 
// Module Name:    Instruction_Mem 
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
module Instruction_Mem(
	 input [7:0] PC,
    input Reset,
    output [7:0] Instruction_Code
    );
reg [7:0] Mem [10:0];

assign Instruction_Code=Mem[PC];

always @(Reset)
begin
if (Reset==0)
	begin
	Mem[0]=8'h33; //mov R6,R3 
	Mem[1]=8'h71; //sll R6,1 
	Mem[2]=8'h1e; //mov R3,R6 
	Mem[3]=8'hc2; //j L1 
	Mem[4]=8'h5b; //sll R3,3 
	Mem[5]=8'h1b; //L1: mov R3,R3 
	end
end

endmodule
