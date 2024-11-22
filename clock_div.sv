`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2024 01:42:19 PM
// Design Name: 
// Module Name: clock_div
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


module clock_div #(parameter n = 6)(
input logic clk,
input logic reset_n,
input logic stop,
output logic [$clog2(n) - 1 : 0]count_fpga,
output logic out_clk
    );
    
 logic [$clog2(n) - 1 : 0]count_fp;   
//assign out_clk = 1'b0;
Mod_N_counter #(.N(n)) fpga (.clk(clk), .reset_n(reset_n), .count_m(count_fp));

always @ (posedge clk, negedge reset_n)
    begin
    if(!reset_n) begin
    out_clk <= 0;
    count_fpga = 0;
    end
    else if (stop)
    count_fpga = count_fpga;
    else if (count_fp == n-1)
    begin
        out_clk <= ~out_clk;
        count_fpga = count_fpga +1;
    end
    else if (count_fp == (n/2) - 1)
        out_clk <= ~out_clk;
    end

endmodule
