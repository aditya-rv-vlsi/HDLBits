module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

    wire [15:0] cout1,cout2,cout3;
    wire [15:0]alt_sum1, alt_sum2;
    add16 adder1(.a(a[15:0]), .b(b[15:0]), .cin(0), .sum(sum[15:0]), .cout(cout1));
    add16 adder_sel1(.a(a[31:16]), .b(b[31:16]), .cin(0), .sum(alt_sum1), .cout(cout2));
    add16 adder_sel2(.a(a[31:16]), .b(b[31:16]), .cin(1), .sum(alt_sum2), .cout(cout3));
    
    always @(cout1, alt_sum1, alt_sum2) begin
        case(cout1)
            0 : sum[31:16] = alt_sum1;
            1 : sum[31:16] = alt_sum2;
        endcase
    end 
endmodule

module add1 ( 
    input a,b,cin,
    output sum,cout );
    assign sum=a^b^cin;
    assign cout=a&b|b&cin|a&cin;
endmodule
