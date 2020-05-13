`timescale 1ns / 1ps


module half_adder(
    input a,
    input b,
    output s,
    output c
    );
    
    xor x(s,a,b);
    and carr(c,a,b);
endmodule
