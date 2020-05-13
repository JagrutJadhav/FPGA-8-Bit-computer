module reg_1_bit
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


