`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2024 07:50:38 PM
// Design Name: 
// Module Name: tb_K2
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


module tb_K2;

logic reset;
logic clk = 0;
logic [7:0] result;
//logic [7:0] instructions;
//logic [3:0] counter;
//logic [3:0] enReg;
logic [7:0] RAout;
logic [7:0] RBout;
//logic enmux1;
//logic carry;
//logic [7:0] datamemout;

K2_process DUT(
.reset(reset),
.clk(clk),
.result(result),
//.instructions(instructions),
//.enmux1(enmux1),
//.carryff(carry),
//.enReg(enReg),
.RAout(RAout),
.RBout(RBout)
//.datamemout(datamemout),
//.counter(counter)
    );
    
    
always #5 clk = ~clk;

initial begin
    reset= 1'b0;
#8    
    reset= 1'b1;


#10000000
$finish;
end
endmodule

