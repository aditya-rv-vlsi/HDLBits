//SOP
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 

    assign out = (a)|(c&~b);    
endmodule

//POS
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 

    assign out = (c|a)&(a|~b);    
endmodule
