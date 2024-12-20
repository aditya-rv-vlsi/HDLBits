module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 32'h1
    output [31:0] q
); 

    integer i;
    
    always@(posedge clk)begin
        if(reset)
            q<=5'd1;
        else begin
            for(i=31;i>=0;i=i-1)begin
                if(i==21|i==1|i==0)
                    q[i] <= q[i+1]^q[0];
                else if(i==31)
                    q[i] <= q[0];
                else
                    q[i] <= q[i+1];
            end
        end
    end
endmodule