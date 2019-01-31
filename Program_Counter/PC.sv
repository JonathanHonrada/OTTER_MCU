`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/23/2019 10:48:08 AM
// Design Name: 
// Module Name: PC
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


module PC(input clk, 
    input RST,
    input logic [9:0] DATA,
    input PC_LD,
    output reg [9:0] PC_OUT
    );
    
 reg [9:0] PC = 10'd0;
    always @ (posedge clk)
        begin 
        
            if (RST == 1) PC = 10'd0; //synchronous reset
            else if (PC_LD == 1) PC = DATA; //synchronous load
            else PC = PC + 1; // defaultcounting functionality
            
        end
assign PC_OUT = PC;             
endmodule
