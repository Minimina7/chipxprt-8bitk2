`timescale 1ns / 1ps



module tb_decoder;

logic [1:0]D;
logic [3:0]en;

decoder_2to4_A1 d1 (.D(D), .en(en));

initial begin
#5
    D = 2'b00;
#5
    D = 2'b10;    
#5
    D = 2'b11;
#5
    D = 2'b01;   
#100
$finish;
end

endmodule
