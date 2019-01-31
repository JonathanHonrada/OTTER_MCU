`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/23/2019 10:48:08 AM
// Design Name: 
// Module Name: PCmux
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module PCmux( 
    input [9:0] NEXT_PC,
    input [9:0] JALR,
    input [9:0] BRANCH,
    input [9:0] JUMP,
    input [9:0] INTRPT,
    input [2:0] SEL,
   output reg [9:0] OUT
    );
    
    always_comb
        case(SEL)
        
            3'b000: OUT = NEXT_PC;
            3'b001: OUT = JALR;
            3'b010: OUT = BRANCH;
            3'b011: OUT = JUMP;
            3'b100: OUT = INTRPT; 
            default OUT = NEXT_PC;
            
        endcase
endmodule
