`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2024 09:05:38 AM
// Design Name: 
// Module Name: N_bit_counter
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


module N_bit_counter #(int bits = 100)(
input logic clk,
input logic reset_n,
input logic resetcount,
output logic [bits - 1 : 0] count
    );
    
 always  @(posedge clk or negedge reset_n)
    begin
    if (!reset_n | resetcount)  
        count <= 0;
     else 
        count <= count + 1;
    end

endmodule
