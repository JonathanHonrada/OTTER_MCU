`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/23/2019 05:57:57 PM
// Design Name: 
// Module Name: OTTER_ALU
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


module OTTER_ALU(
    input logic [31:0] A,
    input logic [31:0] B,
    input logic [3:0] alu_fun,
    output logic [31:0] out
    );
always_comb
    begin
        case(alu_fun)
            4'b0000: //add
                begin
                out = A + B;
                end
            4'b1000: //sub
                begin
                out = A - B;
                end
            4'b0110: //or
                begin
                out = A | B;
                end
            4'b0111: //and
                begin
                out = A & B;
                end
            4'b0100: //xor
                begin
                out = A ^ B;
                end
            4'b0101: //slr
                begin
                out = A >> B[4:0];
                end
            4'b0001: //sll
                begin
                out = A << B[4:0];
                end
            4'b1101: //sra
                begin
                out = $signed(A) >>> B[4:0];
                end
            4'b0010: //slt SIGNED
                begin
                    out = ($signed(A) < $signed(B))?1 : 0;
                end
            4'b1011: //sltu UNSIGNED
                begin
                out = (A < B)?1 : 0;
                end
            4'b1001: //copy
                begin
                out = A;
                end
            default: //DEFAULT (UNUSUED) STATES JUST OUTPUT A + B
                begin
                out = A + B;
                end
        endcase
    end    

endmodule


    
