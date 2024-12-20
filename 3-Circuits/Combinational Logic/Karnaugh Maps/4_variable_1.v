module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 

    assign out=(~b&~c)|(~d&~a)|(a&d&c)|(c&b&d);
endmodule
