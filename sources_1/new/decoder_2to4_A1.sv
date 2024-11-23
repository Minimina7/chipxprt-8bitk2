`timescale 1ns / 1ps


module decoder_2to4_A1(
input logic [1:0]D,
output logic [3:0]en
    );
    
always @ (D)
    case (D)
        2'b00: en = 4'b0001;   // to store in RA  as address
        2'b01: en = 4'b0010;   // to store in RB  as addres
        2'b10: en = 4'b0100;   // to store in R0  as addres
        default: en = 4'b1000;
    endcase
    
endmodule
