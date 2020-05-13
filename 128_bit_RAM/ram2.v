module ram2
(
	input [7:0] data,
	input [3:0] addr,
	input we, clk,re,
	output [7:0] q
);
	reg [7:0] ram[15:0];
	reg [7:0] out;
	
	reg [3:0] addr_reg;
	
	always @ (posedge clk)
	begin
	// Write
	addr_reg <= addr;
		if (we)
			ram[addr] <= data;
		else if (re)
			out <= ram[addr_reg];
		else out <= 8'bzzzzzzzz;	
	end	
	assign q = out;
	
endmodule
