module top_module(
    input clk,
    input areset,  // async active-high reset to zero
    input load,
    input ena,
    input [3:0] data,
    output reg [3:0] q); 

    always@(posedge clk or posedge areset)
        if(areset)
            q<=0;
    	else begin
            case({load,ena})
                2'b00:	q<=q;
                2'b01:	q<={1'b0,q[3:1]};
                2'b10:	q<=data;
                2'b11:	q<=data;
            endcase
        end
endmodule
