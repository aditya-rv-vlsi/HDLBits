module top_module (
    input clk,
    input reset,   // Active-high synchronous reset that forces the counter to 1
    input enable,  // Enable signal to allow counting
    output [3:0] Q, // 4-bit counter output (1-12)
    output c_enable,  // Control signal for enabling the counter
    output c_load,    // Control signal for loading the counter
    output [3:0] c_d  // Data to load into the counter
);

    reg [3:0] count;
    wire [3:0] c_d_internal;
    assign c_d = 4'b0001;
    
    count4 counter(.clk(clk), .enable(c_enable), .load(c_load), .d(c_d), .Q(Q));

    always @(*) begin
        c_enable = 0;  // Disable the counter by default
        c_load = 0;    // Don't load the counter by default
        
        if (reset) begin
            c_load = 1;  // Load the value 1
        end else if (enable) begin
            c_enable = 1;
            if (Q == 4'b1100) begin
                c_load = 1;  // Load 1 into the counter
            end
        end
    end
endmodule
