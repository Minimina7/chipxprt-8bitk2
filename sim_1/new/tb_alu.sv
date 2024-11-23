`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2024 07:24:46 PM
// Design Name: 
// Module Name: tb_alu
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


module tb_alu;

logic [7 : 0]RA;
logic [7: 0]RB;
logic s;
logic [7: 0]out;
logic carry_out;
logic zero_flag;

ALU_A1 DUT(
.RA(RA),
.RB(RB),
.s(s),
.out(out),
.carry_out(carry_out),
.zero_flag(zero_flag)
    );
 

initial begin
    RA = 144;
    RB = 89;
    s = 1'b0;
#8
    RA = 8'b0000_1010;
    RB = 8'b0000_1010;
    s = 1'b0;
#15
    RA = 8'b1111_0000;
    RB = 8'b1111_0000;
    s = 1'b1;
#15
    RA = 8'b0000_0100;
    RB = 8'b0000_0010;
    s = 1'b1;
#15
    RA = 8'b1111_11111;
    RB = 8'b0001_0001;
    s = 1'b1;
    #15
    RA = 8'b0000_0111;
    RB = 8'b0000_1010;
    s = 1'b1;
#100
$finish;
end


endmodule
