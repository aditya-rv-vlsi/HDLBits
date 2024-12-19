module top_module (
    input clk,
    input in, 
    output out);

    wire d_temp;
    xor x1(d_temp,in,out);
    always@(posedge clk)
        out<=d_temp;
endmodule
