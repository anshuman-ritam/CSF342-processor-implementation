`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:59:11 04/10/2021 
// Design Name: 
// Module Name:    Sign_Extend 
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
module Sign_Extend(
	input [5:0] partialjaddress,
	output [7:0] jaddress
    );
	 
	assign jaddress[5:0] = partialjaddress[5:0];
	assign jaddress[7:6] = {2{partialjaddress[5]}}; 

endmodule
