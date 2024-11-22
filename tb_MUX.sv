`timescale 1ns / 1ps



module tb_MUX #(parameter bits = 8);
logic S_reg;                           // for imm or store in Reg
logic [bits - 1 : 0]out;                 // which is from the ALU
logic [bits - 1 : 0]custom_input;        // imm
logic [bits - 1 : 0]mux_out;

MUX_A1 #(.bits(bits)) m1 (.S_reg(S_reg), .out(out), .custom_input(custom_input), .mux_out(mux_out));

initial begin
#5
    custom_input = 8'b00110011 ;
    out = 8'b11001100 ;
    S_reg = 1'b1 ;
#5
    custom_input = 8'b11100110 ;
    out = 8'b11110001 ;
    S_reg = 1'b1 ;
#5
    custom_input = 8'b00110011 ;
    out = 8'b11001100 ;
    S_reg = 1'b0 ;
#5
    custom_input = 8'b11100010 ;
    out = 8'b00000000 ;
    S_reg = 1'b0 ;
#5
    custom_input = 8'b11111111 ;
    out = 8'b10101010 ;
    S_reg = 1'b0 ;
    
#100
$finish;
end
endmodule
