module top_module (
    input clk,
    input reset,        // Synchronous active-high reset
    output [3:0] q);

    always@(posedge clk)
        if(reset)
            q<=1;
    	else
            q<=(q==4'd10)?4'd1:q+1;
endmodule
