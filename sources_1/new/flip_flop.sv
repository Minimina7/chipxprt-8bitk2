`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/23/2024 02:54:27 PM
// Design Name: 
// Module Name: flip_flop
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


module flip_flop(
input logic clk,
input logic reset,
input logic d,
output logic q
    );
    
    always @(posedge clk , negedge reset)
    begin
        if(!reset)
            q <= 0;
        else
            q <= d;
    end
endmodule
