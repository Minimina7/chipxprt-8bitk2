`timescale 1ns / 1ps


module Memory (
input logic [3: 0]address,
output logic [7: 0]instruction
    );
    
always @ (address)
    case (address) 
        4'b0000: instruction = 8'b00000000;       // to store in RA  as address
        4'b0100: instruction = 8'b00010000;       // to store in RB  as addres
        4'b1000: instruction = 8'b00000100;       // to store in R0  as addres
        4'b1100: instruction = 8'b00010100;       // No operation
        4'b0000: instruction = 8'b00100000;       // to store in RA  as address
        4'b0100: instruction = 8'b000;       // to store in RB  as addres
        4'b1000: instruction = 8'b00000100;       // to store in R0  as addres
        4'b1100: instruction = 8'b00010100;       // No operation
        default: instruction = 8'b00100000;
    endcase
      
endmodule
