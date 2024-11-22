`timescale 1ns / 1ps

module tb_ALU #(parameter bits = 8);

logic [bits: 0]RA;
logic [bits: 0]RB;
logic s;
logic [bits : 0]out;
logic carry_out;
logic zero_flag;

ALU_A1 #(.bits(bits)) alu (.RA(RA), .RB(RB), .s(s), .out(out), .carry_out(carry_out), .zero_flag(zero_flag));

initial begin
#5
    RA = 9'b000111000;
    RB = 9'b000000111;
    s = 1'b0;
#5
    RA = 9'b000000000;
    RB = 9'b000000000;
    s = 1'b0;
#5
    RA = 9'b011111111;
    RB = 9'b000000001;
    s = 1'b0;
#5
    RA = 9'b000111000;
    RB = 9'b000111000;
    s = 1'b1;
#5
    RA = 9'b000111000;
    RB = 9'b000000111;
    s = 1'b1;
#5
    RA = 9'b001011000;
    RB = 9'b000000010;
    s = 1'b1;

#500
$finish;
end
endmodule
