`timescale 1ns / 1ps


module progran_counter #(parameter bits = 100)(
input logic clk,
input logic [2:0]imm,
input logic en,
input logic reset,
output logic [bits - 1 : 0] count
    );
    
always  @(posedge clk or negedge reset or en)
begin
    if (reset)  
        count <= 0;
    else if (!en)
        count <= count + 1;
    else
        count<= count + imm;
end

endmodule
