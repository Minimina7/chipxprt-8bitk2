`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2024 12:53:30 PM
// Design Name: 
// Module Name: data_mem
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


module data_mem # (parameter bits = 8)(
input logic [bits -1 :0] datain,
input logic [2:0] address,
input logic en,
input logic clk,
input logic reset,
output logic [bits - 1:0] dataout 
    );

    logic [bits-1:0] ram [7:0];    
    always @(posedge clk)
    begin
        if(!reset)
        begin
            ram[0] <= 0; 
            ram[1] <= 0; 
            ram[2] <= 0; 
            ram[3] <= 0;
            ram[4] <= 0; 
            ram[5] <= 0; 
            ram[6] <= 0; 
            ram[7] <= 0;
        end
         else if (en)
            ram[address]=datain; 
         else 
            dataout=ram[address];     
        end
endmodule
