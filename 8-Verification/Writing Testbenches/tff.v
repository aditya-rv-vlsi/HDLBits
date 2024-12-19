module top_module ();

    reg clk,reset,t;
    wire q;
    
    tff T1(.clk(clk), .reset(reset), .t(t), .q(q));
    
    initial begin
        clk=0;
        reset=1;
        t=0;
    end
    always #5 clk=~clk;
    
    initial begin
        #10 reset=0;
        #15 t=1;
    end
endmodule
