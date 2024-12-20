module top_module (
    input clk,
    input shift_ena,
    input count_ena,
    input data,
    output [3:0] q);

    always@(posedge clk)
        case({shift_ena,count_ena})
            2'd1:	q<=q-1;
            2'd2:	q<={q[2:0],data};
            default:	q<=q;
        endcase
endmodule
