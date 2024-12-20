module top_module (
    input clk,
    input a,
    output [3:0] q );

    always@(posedge clk)
        if(a)
            q<=4'd4;
    	else
            q<=(q==4'd6)?0:q+1;
endmodule
