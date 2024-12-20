module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    output walk_left,
    output walk_right); //  

    parameter LEFT=0, RIGHT=1;
    reg state, next_state;

    always @(posedge clk, posedge areset) begin
        if(areset)
            state=LEFT;
        else
            state=next_state;
    end
    
    always@(*)begin
        case(state)
            0:	next_state = bump_left?RIGHT:(bump_right?LEFT:LEFT);
            1:	next_state = bump_right?LEFT:(bump_left?RIGHT:RIGHT);
        endcase
    end
            
    // Output logic
    assign walk_left = (state == LEFT);
    assign walk_right = (state == RIGHT);
endmodule