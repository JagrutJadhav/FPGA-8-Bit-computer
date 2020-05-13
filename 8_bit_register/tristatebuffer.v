`timescale 1ns/1ns

module tristatebuffer(
	input [7:0] a,
	input active_out,
	output [7:0] out);
	
	assign out = active_out ? a: 8'bzzzzzzzz;
	
endmodule

module tristatebufferIR(
	input [3:0] a,
	input active_out,
	output [3:0] out);
	
	assign out = active_out ? a: 4'bzzzz;
	
endmodule

/*module tristate_simulation();

	reg [7:0] a;
	reg active;
	wire [7:0] out;
	
	tristatebuffer tria(.a(a),.active_out(active),.out(out));
	
	initial begin 
		a = 0;
		active = 1'b0;
		end
	initial 	
	$monitor( "a(%b) ,, active(%b)  = out sum(%b)", a, active, out);
	
	
	always @ (a or active) begin
	
		integer i;
		for (i=0 ; i <= 10 ; i=i+1)
		begin 
			a=a+i;		
			#5;
			
		end
		
		active = 1'b1;
		
		for (i=0 ; i <= 10 ; i=i+1)
		begin 
			a=a+i;		
			#5;
			
		end
		
	$stop;
	end
	
endmodule*/
		
	