module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );

    wire [99:0] cout_temp;
    genvar i;
    generate
        for(i=0;i<100;i=i+1)begin: FA_Block
            if(i==0)
                bcd_fadd BFA (.a(a[4*i+3:4*i]), .b(b[4*i+3:4*i]), .cin(cin), .cout(cout_temp[i]), .sum(sum[4*i+3:4*i]));
            else
                bcd_fadd BFA (.a(a[4*i+3:4*i]), .b(b[4*i+3:4*i]), .cin(cout_temp[i-1]), .cout(cout_temp[i]), .sum(sum[4*i+3:4*i]));
        end
    endgenerate
    assign cout=cout_temp[99];
endmodule
