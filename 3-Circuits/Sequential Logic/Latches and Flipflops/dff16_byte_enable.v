module top_module (
    input clk,
    input resetn,
    input [1:0] byteena,
    input [15:0] d,
    output [15:0] q
);

    always@(posedge clk) begin
        if(!resetn)
            q<=0;
        else begin
            case(byteena)
                2'd0:	q<=q;
                2'd1:	q<={q[15:8],d[7:0]};
                2'd2:	q<={d[15:8],q[7:0]};
                2'd3:	q<=d;
            endcase
        end
    end
endmodule
