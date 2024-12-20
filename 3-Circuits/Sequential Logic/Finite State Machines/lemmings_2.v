module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah
); 
    // State encoding
    parameter LEFT = 2'd0, RIGHT = 2'd1, FALL = 2'd2;
    reg [1:0] state, next_state, prev_state;

    // State transition logic
    always @(posedge clk, posedge areset) begin
        if (areset) begin
            state <= LEFT; // Reset to LEFT state
        end else begin
            state <= next_state;
        end
    end

    // Next state logic
    always @(*) begin
        case (state)
            LEFT:	begin
                		next_state = ground ? (bump_left ? RIGHT : LEFT) : FALL;
                		prev_state = LEFT;
            		end
            RIGHT: 	begin
                		next_state = ground ? (bump_right ? LEFT : RIGHT) : FALL;
                		prev_state = RIGHT;
            		end
            FALL: 	next_state = ground ? prev_state : FALL;
            default: next_state = LEFT; 
        endcase
    end

    // Output logic
    assign walk_left = (state == LEFT);
    assign walk_right = (state == RIGHT);
    assign aaah = (state == FALL);
endmodule
