module top_module (
    input clk,
    input j,
    input k,
    output Q); 

    always@(posedge clk)
        case({j,k})
            2'd0:	Q<=Q;
            2'd1:	Q<=0;
            2'd2:	Q<=1;
            2'd3:	Q<=~Q;
        endcase
endmodule
