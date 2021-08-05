# Introduction
The code for the above implementation of the processors has been done in Xilinx ISE.  The single cycle and the pipelined  supports data transfer (mov), shift left logical (sll) and unconditional jump (J) instructions only. The PC(Program Counter) register is assumed to be of 8-bits. The address and data size is allso of 8-bits. 
# Description of Files
Both the Single Cycle and Pipelined implementation folders contain some common files like the Instruction_Fetch.v, Instruction_Mem.v, Sign_Extend etc. The Pipelined folder contains additional files like Forwarding_Unit and Hazard_Check in orer to avoid pipelining hazards. It also contains the pipelining registers. 
# Verifying Results
The Instruction_Mem.v file has been initialized with some predefined instructions, the output of which can be verified by running the files and observing the waveforms. The register file has also been loaded with the predefined values of the registers. 
The instructions that have been loaded in the Instruction_Mem are:
mov R6,R3
sll R6,1
mov R3,R6
j L1
sll R3,3
mov R3,R3
where the register file is initialized such that R0 = 0, R1 = 1, R2 = 2, R3 = 3 …etc. 
