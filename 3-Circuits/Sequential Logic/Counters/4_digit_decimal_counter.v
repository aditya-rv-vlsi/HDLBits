/*The Code is not fully correct in HDLBits*/

module top_module (
    input clk,        // Clock input
    input reset,      // Synchronous reset
    output [15:0] q,  // 16-bit counter output
    output [3:1] ena  // Enable signals for hundreds, tens, and thousands
);

    reg [3:0] ones, tens, hundreds, thousands;  // 4-bit registers for each digit (ones, tens, hundreds, thousands)
    reg [3:0] q_reg [3:0];  // Array for holding the counter values (q[15:0])

    always @(posedge clk) begin
        if (reset) begin
            ones <= 4'b0000;
            tens <= 4'b0000;
            hundreds <= 4'b0000;
            thousands <= 4'b0000;
        end else begin
            // Ones digit logic
            if (ones == 9) begin
                ones <= 4'b0000; // Reset ones to 0
                ena[1] <= 1;  // Enable tens to increment
            end else begin
                ones <= ones + 1;  // Increment ones digit
                ena[1] <= 0;  // Disable tens increment
            end

            // Tens digit logic
            if (ones == 9 && tens == 9) begin
                tens <= 4'b0000; // Reset tens to 0
                ena[2] <= 1;  // Enable hundreds to increment
            end else if (ones == 9) begin
                tens <= tens + 1;  // Increment tens digit
                ena[2] <= 0;  // Disable hundreds increment
            end

            // Hundreds digit logic
            if (ones == 9 && tens == 9 && hundreds == 9) begin
                hundreds <= 4'b0000;  // Reset hundreds to 0
                ena[3] <= 1;  // Enable thousands to increment
            end else if (ones == 9 && tens == 9) begin
                hundreds <= hundreds + 1;  // Increment hundreds digit
                ena[3] <= 0;  // Disable thousands increment
            end

            // Thousands digit logic
            if (ones == 9 && tens == 9 && hundreds == 9 && thousands == 9) begin
                thousands <= 4'b0000;  // Reset thousands to 0
            end else if (ones == 9 && tens == 9 && hundreds == 9) begin
                thousands <= thousands + 1;  // Increment thousands digit
            end
        end
    end

    // Assign counter values to q[15:0]
    assign q = {thousands, hundreds, tens, ones};  // Concatenate the 4 digits to form q[15:0]
endmodule
