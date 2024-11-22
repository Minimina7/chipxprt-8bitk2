`timescale 1ns / 1ps


module ALU_A1 #(parameter bits = 8)(
input logic [bits: 0]RA,
input logic [bits: 0]RB,
input logic s,
output logic [bits : 0]out,
output logic carry_out,
output logic zero_flag
    );
    

    
always @ (*)
begin
    if (s==0)
    begin
        out = RA + RB ;
        carry_out = out[bits];
        if (out[bits - 1:0] == 0)
            zero_flag = 1;
        else 
            zero_flag = 0;
    end
    else if (s==1)
    begin
        out = RA - RB ;
        carry_out = 0;
        if (out[bits - 1:0] == 0)
            zero_flag = 1;
        else
            zero_flag = 0;
    end

end


endmodule
