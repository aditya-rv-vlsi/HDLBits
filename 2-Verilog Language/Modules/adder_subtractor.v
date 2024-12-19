module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);

    wire [15:0] cout1,cout2;
    wire [31:0] b_temp;
    assign b_temp = b^{32{sub}};
    add16 A1(.a(a[15:0]), .b(b_temp[15:0]), .cin(sub), .sum(sum[15:0]), .cout(cout1));
    add16 A2(.a(a[31:16]), .b(b_temp[31:16]), .cin(cout1), .sum(sum[31:16]), .cout(cout2));
endmodule
