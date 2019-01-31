`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Jack Ribarich
// 
// Create Date: 01/23/2019 11:36:37 AM
// Design Name: 
// Module Name: PCount
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: PC
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//  
//////////////////////////////////////////////////////////////////////////////////


module PCount(input CLK, 
    input RST,
    input [9:0] JALR,
    input [9:0] BRANCH,
    input [9:0] JUMP,
    input [9:0] INTRPT,
    input [2:0] PC_SEL,
    input PC_LD,
    output logic [31:0] OUT
    );
   
wire [9:0] MUX_OUT;
wire [9:0] COUNT;
wire [9:0] ONE;

    PCmux mux(.NEXT_PC(ONE), .JALR(JALR), .BRANCH(BRANCH),
              .JUMP(JUMP), .INTRPT(INTRPT), .SEL(PC_SEL), .OUT(MUX_OUT));
   
   PC pc(.clk(CLK), .RST(RST) , .DATA(MUX_OUT), .PC_LD(PC_LD), .PC_OUT(COUNT));//the actual program counter
   
   OTTER_Memory rom(.MEM_ADDR(COUNT),. MEM_CLK(CLK), .MEM_DIN(32'h0000), .MEM_WE(1'b0), .MEM_DOUT(OUT));
   
   PCp1 plusONE (.COUNT(COUNT), .plus(ONE)); //this module adds 1 to the current count

endmodule
