`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////


module fulladder(
    input a,
    input b,
    input c,
    output s,
    output carr
    );
    
    wire d,e,f;
    
    half_adder h1(.a(a),.b(b),.s(d),.c(e));
    half_adder h2(.a(d),.b(c),.s(s),.c(f));
    or (carr,e,f);
   
endmodule
