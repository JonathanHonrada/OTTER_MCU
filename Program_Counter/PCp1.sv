`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/23/2019 11:15:45 AM
// Design Name: 
// Module Name: PCp1
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


module PCp1(
    input [9:0] COUNT,
    output logic [9:0] plus
    );
    
    always_comb
        begin
        
            plus = COUNT + 1;
        end 
endmodule
