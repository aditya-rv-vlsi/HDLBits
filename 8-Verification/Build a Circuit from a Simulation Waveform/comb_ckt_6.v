module top_module (
    input [2:0] a,
    output [15:0] q ); 

    always@(*)begin
        case(a)
            0 : q = 16'h1232;
            1 : q = 16'hAEE0;
            2 : q = 16'h27D4;
            3 : q = 16'h5A0E;
            4 : q = 16'h2066;
            5 : q = 16'h64CE;
            6 : q = 16'hC526;
            7 : q = 16'h2F19;
        endcase
    end
endmodule
