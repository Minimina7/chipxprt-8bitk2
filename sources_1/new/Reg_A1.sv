`timescale 1ns / 1ps


module Reg_A1 # (parameter bits = 8)(
input logic en,
input logic reset,
input logic clk,
input logic [bits - 1 : 0]D,
output logic [bits - 1 : 0]q
    );
always @ (posedge clk or negedge reset)     
begin
    if (!reset)  
        q <= 0;
    else if (en)
        q <= D;   
end
endmodule
