module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);

    decade_counter DC_U(.clk(clk), .enable(1), .reset(reset), .q(q[3:0]));
    decade_counter DC_T(.clk(clk), .enable(ena[1]), .reset(reset), .q(q[7:4]));
    decade_counter DC_H(.clk(clk), .enable(ena[2]), .reset(reset), .q(q[11:8]));
    decade_counter DC_TH(.clk(clk),.enable(ena[3]), .reset(reset), .q(q[15:12]));
    
    assign ena[1] = (q[3:0]==4'd9);
    assign ena[2] = (q[3:0]==4'd9)&&(q[7:4]==4'd9);
    assign ena[3] = (q[3:0]==4'd9)&&(q[7:4]==4'd9)&&(q[11:8]==4'd9);   
endmodule

module decade_counter (
    input clk,
    input reset,        // Synchronous active-high reset
    input enable,
    output [3:0] q);

    always@(posedge clk)
        if(reset)
            q<=0;
    	else begin
            if(!enable)
                q<=q;
            else
            	q<=(q==4'd9)?0:q+1;
        end
endmodule



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
