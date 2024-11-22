`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2024 11:05:51 AM
// Design Name: 
// Module Name: shift_reg
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
    

module shift_reg(
input logic BTNC, 
input logic reset_n,
input logic serial_in, 
output logic serial_out,
input logic en,
output logic [7:0] parallel_out
);
logic clk;
assign clk = BTNC;

always@(posedge clk or negedge reset_n)
begin
    if(!reset_n)   
        parallel_out <= 8'b00000000;
    else if (en)
    begin
        parallel_out[7] <= serial_in;
        parallel_out[6] <= parallel_out[7];
        parallel_out[5] <= parallel_out[6];
        parallel_out[4] <= parallel_out[5];
        parallel_out[3] <= parallel_out[4];   
        parallel_out[2] <= parallel_out[3];
        parallel_out[1] <= parallel_out[2]; 
        parallel_out[0] <= parallel_out[1]; 
        serial_out <= parallel_out[0];
    end
end
endmodule
