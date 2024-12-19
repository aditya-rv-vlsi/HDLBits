module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//

    wire [7:0] temp1,temp2;
    assign temp1 = a<b?a:b;
    assign temp2 = c<temp1?c:temp1;
    assign min = d<temp2?d:temp2;
endmodule
