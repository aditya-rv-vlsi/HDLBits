module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
); 

    wire [3:0] q0,q1,q2;
  	assign c_enable[0] = 1;               // Always enabled for the fastest counter
    assign c_enable[1] = (q0 == 4'd9);    // Enable second counter when first counter reaches 9
    assign c_enable[2] = (q0 == 4'd9) && (q1 == 4'd9); // Enable third counter when first and second counters reach 9

    bcdcount counter0 (.clk(clk), .reset(reset), .enable(c_enable[0]), .Q(q0));
    bcdcount counter1 (.clk(clk), .reset(reset), .enable(c_enable[1]), .Q(q1));
    bcdcount counter2 (.clk(clk), .reset(reset), .enable(c_enable[2]), .Q(q2));

    assign OneHertz = (q0 == 4'd9) && (q1 == 4'd9) && (q2 == 4'd9);
endmodule
