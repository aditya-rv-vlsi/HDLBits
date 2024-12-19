module top_module(
    input a,
    input b,
    input sel_b1,
    input sel_b2,
    output wire out_assign,
    output reg out_always   ); 

    assign out_assign = sel_b1?(sel_b2?b:a):a;
    
    always@(*)
        case({sel_b1,sel_b2})
            2'd0:	out_always<=a;
            2'd1:	out_always<=a;
            2'd2:	out_always<=a;
            2'd3:	out_always<=b;
        endcase
endmodule
