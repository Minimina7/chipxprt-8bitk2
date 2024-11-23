module sev_seg_top(
    input wire CLK100MHZ,    // using the same name as pin names
    input wire CPU_RESETN,
    input wire BTNC, 
    input wire BTNU, 
    output wire CA, CB, CC, CD, CE, CF, CG, DP,
    output wire [7:0] AN,    
    input wire [15:0] SW     
);


logic reset_n;
logic clk;
logic enab = 1'b1;
assign reset_n = CPU_RESETN;
assign clk = CLK100MHZ;

// Seven segments Controller
wire [6:0] Seg;
wire [3:0] digits[0:7];
wire [7:0] out_SW1;
wire [7:0] RAout;
wire [7:0] RBout;
wire [29:0] SW2_ou;
wire clk1hz;

clock_div #(.n(100000000)) clkdiv(.clk(clk), .reset_n(reset_n), .count_fpga(SW2_ou) , .out_clk(clk1hz));
K2_process #(.bits(8)) K2(.clk(clk1hz), .reset(reset_n), .RAout(RAout), .RBout(RBout), .result(out_SW1));


assign digits[0] = RAout[3:0];
assign digits[1] = RAout[7:4];
assign digits[2] = RBout[3:0];
assign digits[3] = RBout[7:4];
assign digits[4] = out_SW1[3:0];
assign digits[5] = out_SW1[7:4];
assign digits[6] = 4'b0000;
assign digits[7] = 4'b0000;


sev_seg_controller ssc(
    .clk(clk),
    .resetn(reset_n),
    .digits(digits),
    .Seg(Seg),
    .AN(AN)
);


assign CA = Seg[0];
assign CB = Seg[1];
assign CC = Seg[2];
assign CD = Seg[3];
assign CE = Seg[4];
assign CF = Seg[5];
assign CG = Seg[6];
assign DP = 1'b1; // turn off the dot point on seven segs


endmodule : sev_seg_top