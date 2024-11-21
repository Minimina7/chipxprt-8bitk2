`timescale 1ns / 1ps


module ALU_A1 #(parameter bits = 8)(
input logic [bits : 0]RA,
input logic [bits : 0]RB,
input logic s,
output logic [bits-1 : 0]out,
output logic carry_out,
output logic zero_flag
    );
    
always @ (s)
begin
    if (s==1)
    begin
        out = RA + RB ;
        if (out[bits] == 1'b1)
            carry_out = 1;
        else
            carry_out = 0;
    end
    else if (s==0)
    begin
        out = RA - RB ;
        if (out == 0)
            zero_flag = 1;
        else
            zero_flag = 0;
    end
end


endmodule
