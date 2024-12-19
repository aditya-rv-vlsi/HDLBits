module top_module( 
    input [2:0] in,
    output [1:0] out );

    integer i,temp_out;
    always@(*) begin
        temp_out=0;
        for (i=0;i<3;i=i+1)begin
        	if(in[i]==1)
        	     temp_out=temp_out+1;
        	out=temp_out;
    	end
    end
endmodule
