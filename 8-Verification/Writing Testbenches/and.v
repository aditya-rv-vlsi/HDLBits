module top_module();

    wire out;
    reg a,b;
    
    andgate A1(.in({a,b}),.out(out));
    
    initial begin
        #0; a=0; b=0;
        #10; a=0;b=1;
        #10; a=1;b=0;
        #10; a=1;b=1;
    end
endmodule
