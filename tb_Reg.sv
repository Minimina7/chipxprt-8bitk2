`timescale 1ns / 1ps

module test_the_block #(parameter bits = 8); 
logic en;
logic reset;
logic clk;
logic [bits - 1 : 0]D;
logic [bits - 1 : 0]q;

Reg_A1  #(.bits(bits)) rege (.en(en), .reset(reset), .clk(clk), .D(D), .q(q));

always #5 clk = ~clk;
initial begin
#5
    clk = 1'b0;
    reset = 1'b1;
    en = 1'b1;
#5
    reset = 1'b0;
#5
    reset = 1'b1;
#5
    reset = 1'b0;
    D = 8'b00000000;
#5
    D = 8'b00101000;
    en = 1'b1;
#5
    D = 8'b00111000;
#5
    D = 8'b01111110;
    en = 1'b1;
#5
    D = 8'b00000000;  

#100
$finish;
end
endmodule
