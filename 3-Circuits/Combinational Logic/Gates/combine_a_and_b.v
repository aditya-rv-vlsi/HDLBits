module simple_circuit_A (input x, input y, output z);
    assign z = (x^y)&x;
endmodule

module simple_circuit_B ( input x, input y, output z );
    assign z = ~(x^y);
endmodule

module top_module (input x, input y, output z);
    wire za1,za2,zb1,zb2,x1,x2;
    simple_circuit_A ZA1(.x(x), .y(y), .z(za1));
    simple_circuit_A ZA2(.x(x), .y(y), .z(za2));
    simple_circuit_B ZB1(.x(x), .y(y), .z(zb1));
    simple_circuit_B ZB2(.x(x), .y(y), .z(zb2));
    
    or o1(x1,za1,zb1);
    and a1(x2,za2,zb2);
    xor xo1(z,x1,x2);
endmodule
