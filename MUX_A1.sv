`timescale 1ns / 1ps


module MUX_A1 #(parameter bits = 8)(
input logic S_reg,                             // for imm or store in Reg
input logic [bits - 1 : 0]out,                 // which is from the ALU
input logic [bits - 1 : 0]custom_input,        // imm
output logic [bits - 1 : 0]mux_out
    );
    
always @ (S_reg, out, custom_input)
begin 
    if (S_reg)
       mux_out = custom_input;
    else   
       mux_out = out;
end

endmodule
