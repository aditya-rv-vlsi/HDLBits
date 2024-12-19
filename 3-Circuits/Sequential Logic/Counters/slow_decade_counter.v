module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q);

    always@(posedge clk)
        if(reset)
            q<=0;
    	else
            q<=slowena?((q==4'd9)?0:q+1):q;
endmodule
