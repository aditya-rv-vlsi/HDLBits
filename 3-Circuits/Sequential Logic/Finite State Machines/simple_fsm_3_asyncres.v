module top_module(
    input clk,
    input in,
    input areset,
    output out); //

    reg [1:0] state,next_state;
    parameter A=0, B=1, C=2, D=3;
    // State transition logic
	always@(*)begin
        case(state)
            2'd0:	next_state = in?B:A;
            2'd1:	next_state = in?B:C;
            2'd2:	next_state = in?D:A;
            2'd3:	next_state = in?B:C;
        endcase
    end
    // State flip-flops with asynchronous reset
    always@(posedge clk or posedge areset)
        if(areset)
            state<=A;
    	else
            state<=next_state;
    // Output logic
    assign out = (state==D);
endmodule
