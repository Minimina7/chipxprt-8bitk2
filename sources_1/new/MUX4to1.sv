`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2024 03:42:00 PM
// Design Name: 
// Module Name: MUX4to1
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


module MUX4to1#(parameter bits = 8)(
input logic [1:0] S_reg,                             // for imm or store in Reg
input logic [bits - 1 : 0]firstIn,                 // which is from the ALU
input logic [bits - 1 : 0]SecondIn,
input logic [bits - 1 : 0]ThirdIN,
input logic [bits - 1 : 0]FourthIn,        // imm
output logic [bits - 1 : 0]mux_out
    );
    
always @ (*)
begin 
    if (S_reg == 2'b00)
       mux_out = firstIn;
    else if (S_reg == 2'b01)
       mux_out = SecondIn;
     else if (S_reg == 2'b10)
       mux_out = ThirdIN;
     else 
       mux_out = FourthIn;
end


endmodule
