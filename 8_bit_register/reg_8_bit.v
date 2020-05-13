module reg_8_bit
		(input load,clk,
		input [7:0] data,
		output reg [7:0] y);
		
		
	always @ (posedge clk) begin	
	if (load == 1'b1) begin
			y <= data;
			end
	else begin
			y <= y;
			end
	end
		
endmodule

module instruction_reg_8_bit
		(input load,clk,
		input [7:0] data,
		output reg [3:0] instruction,address);
		
		
	always @ (posedge clk) begin	
	if (load == 1'b1) begin
			{instruction,address} <= data;
			end
	else begin
			{instruction,address} <= {instruction,address};
			end
	end
	
	
	
endmodule
