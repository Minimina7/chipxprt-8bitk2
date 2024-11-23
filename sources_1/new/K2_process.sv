`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2024 12:55:07 PM
// Design Name: 
// Module Name: K2_process
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


module K2_process # (parameter bits = 8)(
input logic reset,
input logic clk,
//output logic [7:0] instructions,
//output logic [3:0] counter,
//output logic [bits-1:0] datamemout,
output logic [bits-1:0] RAout,
output logic [bits-1:0] RBout,
output logic [bits-1:0] result
    );
    logic  zero, enMEM, J, notSreg, zeroff, carry, enmux1, carryff;
    logic [2:0] immediate;
    logic [3:0] enReg, counter;
    logic [7:0] instructions;
    logic [bits -1 :0] ALUout, MUXimalu, MUXmem, datamemout;// RAout, RBout;
    
    progran_counter #(.bits(bits)) PC(.clk(clk), .reset(reset), .en(enmux1), .imm(immediate), .count(counter));
    Memory ROM (.address(counter), .instruction(instructions));
    assign immediate = instructions[2:0];
    MUX_A1 #(.bits(bits)) MUXimmorALU(.S_reg(instructions[3]), .firstIn(ALUout), .SecondIn({{bits-3{1'b0}}, immediate}), .mux_out(MUXimalu));
    MUX_A1 #(.bits(bits)) MUXdatamemor(.S_reg(instructions[3] & instructions[7] ), .firstIn(MUXimalu), .SecondIn(datamemout), .mux_out(MUXmem));
    decoder_2to4_A1 decod(.D(instructions[5:4]) , .en(enReg));
    assign enMEM = (~(instructions[7] | instructions[6])) & enReg[3];
    Reg_A1 #(.bits(bits)) RA(.clk(clk), .reset(reset), .en(enReg[0]), .D(MUXmem), .q(RAout));
    Reg_A1 #(.bits(bits)) RB(.clk(clk), .reset(reset), .en(enReg[1]), .D(MUXmem), .q(RBout));
    Reg_A1 #(.bits(bits)) RO(.clk(clk), .reset(reset), .en(enReg[2]), .D(RAout), .q(result));
    data_mem #(.bits(bits)) RAM(.datain(RAout), .address(instructions[2:0]), .en(enMEM), .clk(clk), .reset(reset), .dataout(datamemout));
    ALU_A1 #(.bits(bits)) ALU(.RA(RAout), .RB(RBout), .s(instructions[2]), .out(ALUout), .carry_out(carry), .zero_flag(zero));
    flip_flop carry1(.clk(clk), .reset(reset), .d(carry), .q(carryff));
    flip_flop zero1(.clk(clk), .reset(reset), .d(zero), .q(zeroff));
    assign notSreg = ~instructions[3];
    assign J = notSreg & instructions[7];
    MUX4to1 #(.bits(1)) MUXjump(.S_reg(instructions[7:6]), .firstIn(1'b0), .SecondIn(carryff), .ThirdIN(J), .FourthIn(zeroff), .mux_out(enmux1));
    

endmodule
