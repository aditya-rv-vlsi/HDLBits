module top_module (
    input clk,
    input x,
    output z
); 

    wire d1,d2,d3,q1,q2,q3;
    
    xor x1(d1,x,q1);
    and a1(d2,x,~q2);
    or o1(d3,x,~q3);
    
    always@(posedge clk)begin
        q1<=d1;
        q2<=d2;
        q3<=d3;
    end
    assign z=~(q1|q2|q3);
endmodule
