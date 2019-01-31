`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/28/2018 01:00:34 AM
// Design Name: 
// Module Name: ProgRom
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


module OTTER_Memory(MEM_ADDR, MEM_CLK,MEM_DIN,MEM_WE,MEM_DOUT);
    parameter ADDR_WIDTH=10;  //15; //32*1024 = 32KB
    input [ADDR_WIDTH-1:0] MEM_ADDR;
    input MEM_CLK;
    input [31:0] MEM_DIN;
    input MEM_WE;
    //input [1:0] MEM_SIZE;
    output logic [31:0] MEM_DOUT;
    
    (* rom_style="{distributed | block}" *)
   logic [31:0] memory [0:2**ADDR_WIDTH];
    
    initial begin
        $readmemh("Memory.mem", memory, 0, 2**ADDR_WIDTH);
    end 
    
    always_ff @(posedge MEM_CLK) begin
        MEM_DOUT <= memory[MEM_ADDR];
    end
              
endmodule