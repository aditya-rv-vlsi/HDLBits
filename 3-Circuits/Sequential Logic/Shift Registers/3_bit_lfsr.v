module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output [2:0] LEDR);  // Q

    wire d0,d1,d2,xor_temp;    
    assign xor_temp=LEDR[1]^LEDR[2];
    dff_new DFF0(.clk(KEY[0]), .d(d0), .q(LEDR[0]));
    dff_new DFF1(.clk(KEY[0]), .d(d1), .q(LEDR[1]));
    dff_new DFF2(.clk(KEY[0]), .d(d2), .q(LEDR[2]));
    
    mux2x1_new M0(.sel(KEY[1]), .in({SW[0],LEDR[2]}), .out(d0));
    mux2x1_new M1(.sel(KEY[1]), .in({SW[1],LEDR[0]}), .out(d1));
    mux2x1_new M2(.sel(KEY[1]), .in({SW[2],xor_temp}), .out(d2));
endmodule

module dff_new(
    input clk,d,
    output q);
    
    always@(posedge clk)
        q<=d;
endmodule

module mux2x1_new(
    input sel,
    input [1:0]in,
    output out);
    
    assign out = sel?in[1]:in[0];
endmodule
