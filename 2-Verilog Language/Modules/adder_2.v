module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);//

    wire cout1,cout2;
    add16 A1(.a(a[15:0]), .b(b[15:0]), .cin(0), .cout(cout1), .sum(sum[15:0]));
    add16 A2(.a(a[31:16]), .b(b[31:16]), .cin(cout1), .cout(cout2), .sum(sum[31:16]));         
endmodule

module add1 ( 
    input a,b,cin,
    output sum,cout );
    assign sum=a^b^cin;
    assign cout=a&b|b&cin|a&cin;
endmodule
