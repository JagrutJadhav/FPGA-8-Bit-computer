module substract(
	 input [7:0] b,
	 input cin,
	 output [7:0] subout);
	 
	 
	
	 xor xo(subout[0],b[0],cin);
	 xor x1(subout[1],b[1],cin);
	 xor x2(subout[2],b[2],cin);
	 xor x3(subout[3],b[3],cin);
	 xor x4(subout[4],b[4],cin);
	 xor x5(subout[5],b[5],cin);
	 xor x6(subout[6],b[6],cin);
	 xor x7(subout[7],b[7],cin);
	 
	 
	
	 
	 
endmodule