module top_module (
  input [7:0] clk,    
    input d,
  output reg [7:0] q );
    
  always@(posedge clk)
        q<=d;
endmodule
