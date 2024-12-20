module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);

    wire q0,q1,q2;
    always@(posedge clk) begin
        if(!resetn)
        	{q0,q1,q2,out}<=4'd0;
        else begin
            q0<=in;
            q1<=q0;
            q2<=q1;
            out<=q2;
        end
    end
endmodule
