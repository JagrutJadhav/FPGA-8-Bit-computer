module program_counter(
	input jump,CE,counter_out,
	inout wire [3:0] count);
	
	reg [3:0] i;
	wire [3:0] inp,out;
	initial begin
	 i =0;
	 end
	
	
	always @ (CE or jump ) begin
		if (CE ) begin
			i <= i+1;
		end
		
		else if (jump) begin
			i <= count;
		end
		else i <= i;
	end
	
		tristatebufferIR tristout(.a(i),.active_out(counter_out),.out(count));
		//tristatebuffer tristinp(.a(count),.active_out(jump),.out(i));

endmodule
