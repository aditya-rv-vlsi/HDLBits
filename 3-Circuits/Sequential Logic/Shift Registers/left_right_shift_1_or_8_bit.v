module top_module(
    input clk,
    input load,
    input ena,
    input [1:0] amount,
    input [63:0] data,
    output reg [63:0] q); 

    always@(posedge clk)begin
        case({load,ena})
            2'b00:	q<=q;
            2'b01:	begin
                		case(amount)
                            2'b00:  q<={q[62:0],1'b0};
                            2'b01:  q<={q[55:0],{8{1'b0}}};
                            2'b10:  begin
                                		if(q[63]==1)
                                    		q<={1'b1,q[63:1]};
                                		else
                                            q<={1'b0,q[63:1]};
                            		end
                            2'b11:  begin
                                		if(q[63]==1)
                                    		q<={{8{1'b1}},q[63:8]};
                                		else
                                            q<={{8{1'b0}},q[63:8]};
                            		end
                        endcase
            		end
        	2'b10:	q<=data;
            2'b11:	q<=data;
        endcase
    end
endmodule
