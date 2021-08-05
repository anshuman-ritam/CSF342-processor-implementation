`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:50:21 04/10/2021
// Design Name:   Main_Processor_Single_Cycle
// Module Name:   F:/My Programs/Verilog/CA_Assignment_F/Test_Main_Processor_Single_Cycle.v
// Project Name:  CA_Assignment_F
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Main_Processor_Single_Cycle
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test_Main_Processor_Single_Cycle;

	// Inputs
	reg Clk;
	reg Reset;

	// Instantiate the Unit Under Test (UUT)
	Main_Processor_Single_Cycle uut (
		.Clk(Clk), 
		.Reset(Reset)
	);

	initial begin
		// Initialize Inputs
		Reset = 1'b1;
		#2 Reset = 1'b0;
		#2 Reset = 1'b1;
	end		
	initial begin
		// Initialize Inputs
		Clk = 1'b0;
		repeat(20)
		#5 Clk = ~Clk;
		$finish;
	end
		    
endmodule

