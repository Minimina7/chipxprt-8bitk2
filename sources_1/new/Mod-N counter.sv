`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2024 08:59:24 AM
// Design Name: 
// Module Name: Mod-N counter
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


module Mod_N_counter #(parameter N=100)(
input logic clk,
input logic reset_n,
output logic [$clog2(N) - 1 : 0]count_m
    ); 
logic resetcount;

N_bit_counter #(.bits($clog2(N))) c1 (.clk(clk), .reset_n(reset_n), .count(count_m), .resetcount(resetcount));

always @(*)
begin
    if (count_m == N-1)
        resetcount = 1;
    else
        resetcount = 0;    
end

endmodule
