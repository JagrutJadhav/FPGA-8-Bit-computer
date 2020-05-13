module alu(
	 input [7:0] a,b,
	 input [1:0] sel,
	 output [7:0] out);
	 
	 wire [15:0] wire1;
	 wire [7:0] wiresub,wireadd, wiremul;
	 wire cin,cout;
	
	
	aludemux demux(.b(b), .sel(sel), .out(wire1),.cin(cin));
	substract sub(.b(wire1[7:0]),.cin(cin),.subout(wiresub));
	adder_8_bit adder(.a(a),.b(wiresub),.cin(cin),.sum(wireadd),.carry(cout));
	
	multiplier  mul(.a(a[3:0]),.b(wire1[11:8]),.out(wiremul));
	alumux mux(.a(wiremul),.b(wireadd), .sel(sel), .out(out));
	 
endmodule


module aludemux(
	input [7:0] b,
	input [1:0] sel,
	output reg [15:0] out,
	output reg cin);
	
	initial cin = 1'b0;

	
	always  @ (b or sel)
	begin
		case(sel)
		2'b00: begin                //multiplication
					out[15:8] = b;
					cin = 1'b0;
					out[7:0] = 8'bzzzzzzzz;
				end
		2'b01: begin                // addition
					out[7:0] = b;
					cin = 1'b0;
					out[15:8]=8'bzzzzzzzz;
				end
		2'b10: begin               //substraction
					out[7:0] = b;
					cin = 1'b1;
					out[15:8]=0;
				end
		default: begin 
					out[15:8] = 8'bzzzzzzzz;
					out[7:0] = 8'bzzzzzzzz;
					cin = 1'bz;
				end
		
	endcase
	end
	
endmodule

module alumux(
	input [7:0] b,a,
	input [1:0] sel,
	output reg [7:0] out);
	
	
	
	always  @ (b or a or sel)
	begin
		case(sel)
		2'b00: begin                //multiplication
					out = a;
					
				end
		2'b01: begin                // addition
					out= b;
					
				end
		2'b10: begin               //substraction
					out= b;
					
				end
		default: begin 
					out = 8'bzzzzzzzz;
					
				end
		
		endcase
	end
	
endmodule