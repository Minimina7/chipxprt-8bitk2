`timescale 1ns / 1ps


module tb_PC #(parameter bits = 8);
logic clk;
logic [2:0]imm;
logic en;
logic reset;
logic [bits - 1 : 0] count;


progran_counter #(.bits(bits)) pc (.en(en), .reset(reset), .clk(clk), .imm(imm), .count(count));

always #5 clk = ~clk;

initial begin
#5
    clk = 1'b0;
    reset = 1'b1;
    imm = 3'b101;
    en = 1'b0;
#20
    reset = 1'b0;
#20
    reset = 1'b1;
#20
    reset = 1'b0;
#20
    imm = 3'b101;

#5
    imm = 3'b101;
#5
    imm = 3'b010;
#5
    en = 1'b1;            
 #5
    en = 1'b0;   

#400
$finish;
end
endmodule

