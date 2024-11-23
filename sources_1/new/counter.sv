`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2024 02:52:51 PM
// Design Name: 
// Module Name: counter
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


module counter(
input logic [3:0] D,
input logic reset,
input logic clk,
output logic [3:0] count,
input logic load,
input logic en,
input logic addsub
    );
logic w1;  
logic w2;
logic w3;
logic w4;
logic w5;
logic [3:0]ww;

logic s1;
logic s2;
logic s3;

logic res;
logic res1;

and n1 (w1, count[0], count[1]);  
and n2 (w2, count[2], w1); 
xor x1 (w3, count[3], res1);
xor x2 (w4, count[2], res);
xor x3 (w5, count[1], count[0]);

//down
xor(s1,addsub,w5);
nor(s2,count[0],count[1]);
nor(s3,count[0],count[1] , count[2]);


two_one_Mux M1(.S(load), .Z(ww[0]), .B(~count[0]), .A(D[0]));
two_one_Mux M2(.S(load), .Z(ww[1]), .B(s1), .A(D[1]));
two_one_Mux M3(.S(load), .Z(ww[2]), .B(w4), .A(D[2]));
two_one_Mux M33(.S(addsub), .Z(res), .B(s2), .A(w1));
two_one_Mux M4(.S(load), .Z(ww[3]), .B(w3), .A(D[3]));
two_one_Mux M44(.S(addsub), .Z(res1), .B(s3), .A(w2));

//regDF f1 (.CLK(clk), .reset(reset), .D(ww), .Q(count), .en(en));   
regBV f1 (.CLK(clk), .reset(reset), .D(ww), .Q(count), .en(en));   
    
endmodule
