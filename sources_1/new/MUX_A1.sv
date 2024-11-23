`timescale 1ns / 1ps


module MUX_A1 #(parameter bits = 8)(
input logic S_reg,                             // for imm or store in Reg
input logic [bits - 1 : 0]firstIn,                 // which is from the ALU
input logic [bits - 1 : 0]SecondIn,        // imm
output logic [bits - 1 : 0]mux_out
    );
    
always @ (S_reg, firstIn, SecondIn)
begin 
    if (S_reg)
       mux_out = SecondIn;
    else   
       mux_out = firstIn;
end

endmodule
