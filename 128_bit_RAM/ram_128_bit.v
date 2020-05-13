/*module ram_128_bit(input [3:0] address,input clkin,input ce,read,write, inout [7:0] data [15:0] );

		//wire [7:0] data;
		reg clk;
		wire [15:0] load,out;
		ramdemux readdata(.sel(address),.read(read),.write(write),.out(out),.inp(load));
		//ramdemux writedata(.sel(address),.out(out));
		//and clkout(clkenable,clk,ce);
		//tristatebufferram inp( .a(data),.active_out(read), .out(enable));
		//tristatebufferram out( .a(enable[7:0]),.active_out(write), .out(data[7:0]));
		
		
		ram_8_bit r1(.load(load[0]),.clk(clk),.data(data),.y(data),.enable(out[0]));
		ram_8_bit r2(.load(load[1]),.clk(clk),.data(data),.y(data),.enable(out[1]));
		ram_8_bit r3(.load(load[2]),.clk(clk),.data(data),.y(data),.enable(out[2]));
		ram_8_bit r4(.load(load[3]),.clk(clk),.data(data),.y(data),.enable(out[3]));
		ram_8_bit r5(.load(load[4]),.clk(clk),.data(data),.y(data),.enable(out[4]));
		ram_8_bit r6(.load(load[5]),.clk(clk),.data(data),.y(data),.enable(out[5]));
		ram_8_bit r7(.load(load[6]),.clk(clk),.data(data),.y(data),.enable(out[6]));
		ram_8_bit r8(.load(load[7]),.clk(clk),.data(data),.y(data),.enable(out[7]));
		ram_8_bit r9(.load(load[8]),.clk(clk),.data(data),.y(data),.enable(out[8]));
		ram_8_bit r10(.load(load[9]),.clk(clk),.data(data),.y(data),.enable(out[9]));
		ram_8_bit r11(.load(load[10]),.clk(clk),.data(data),.y(data),.enable(out[10]));
		ram_8_bit r12(.load(load[11]),.clk(clk),.data(data),.y(data),.enable(out[11]));
		ram_8_bit r13(.load(load[12]),.clk(clk),.data(data),.y(data),.enable(out[12]));
		ram_8_bit r14(.load(load[13]),.clk(clk),.data(data),.y(data),.enable(out[13]));
		ram_8_bit r15(.load(load[14]),.clk(clk),.data(data),.y(data),.enable(out[14]));
		ram_8_bit r16(.load(load[15]),.clk(clk),.data(data),.y(data),.enable(out[15]));
		
		always @ (posedge clk) begin
			if (ce) begin 
			clk<=clkin; end
		end
		assign dataout = data;

endmodule

module tristatebufferram(
	input [7:0] a,
	input active_out,
	output [7:0] out);
	
	and a1(out[0],active_out,a[0]);
	and a2(out[1],active_out,a[1]);
	and a3(out[2],active_out,a[2]);
	and a4(out[3],active_out,a[3]);
	and a5(out[4],active_out,a[4]);
	and a6(out[5],active_out,a[5]);
	and a7(out[6],active_out,a[6]);
	and a8(out[7],active_out,a[7]);

	
endmodule

module ram_8_bit
		(input load,clk,enable,
		input [7:0] data,
		output reg [7:0] y);
	reg [7:0] conn;	
		
	always @ (posedge clk) begin	
	if (load == 1'b1 && enable == 1'b0) begin
			conn <= data;
			end
	else if (load == 1'b0 && enable == 1'b1) begin
			y <= conn;
			end
	else begin
			conn <= conn;
			end
	end
	
	///tristatebufferram trista(.a(conn),.active_out(enable),.out(y));
	
		
endmodule

module ramdemux(
	input [3:0] sel,input read,write,
	output reg [15:0] out,inp);
	
	reg cin = 1'b1;

	
	always  @ (sel or read or write)
	begin
	if (write) begin
		case(sel)
		4'b0000: begin                
					out[0] = cin;
					out[15:1] = 1'b0;
					end
		4'b0001: begin
					out[0] = 1'b0;		
					out[1] = cin;
					out[15:2] = 1'b0;
					end
		4'b0010: begin
					out[1:0] = 1'b0;
					out[2] = cin;
					out[15:3] = 1'b0;
					end
		4'b0011: begin
					out[2:0] = 1'b0;
					out[3] = cin;
					out[15:4] = 1'b0;
					end
		4'b0100: begin 
					out[3:0] = 1'b0;
					out[4] = cin;
					out[15:5] = 1'b0;
					end
		4'b0101: begin
					out[4:0] = 1'b0;
					out[5] = cin;
					out[15:6] = 1'b0;
					end
		4'b0110: begin 
					out[5:0] = 1'b0;
					out[6] = cin;
					out[15:7] = 1'b0;
					end
		4'b0111: begin 
					out[6:0] = 1'b0;
					out[7] = cin;
					out[15:8] = 1'b0;
					end
		4'b1000: begin 
					out[7:0] = 1'b0;
					out[8] = cin;
					out[15:9] = 1'b0;
					end
		4'b1001: begin  
					out[8:0] = 1'b0;
					out[9] = cin;
					out[15:10] = 1'b0;
					end
		4'b1010: begin 
					out[9:0] = 1'b0;
					out[10] = cin;
					out[15:11] = 1'b0;
					end
		4'b1011: begin 
					out[10:0] = 1'b0;
					out[11] = cin;
					out[15:12] = 1'b0;
					end
		4'b1100: begin
					out[11:0] = 1'b0;
					out[12] = cin;
					out[15:13] = 1'b0;
					end
		4'b1101: begin 
					out[12:0] = 1'b0;
					out[13] = cin;
					out[15:14] = 1'b0;
					end
		4'b1110: begin 
					out[13:0] = 1'b0;
					out[14] = cin;
					out[15] = 1'b0;
					end
		default: begin                
					out[15] = cin;
					out[14:0] = 1'b0;
					end
		
		
	endcase
	end
	
	if (read) begin
		case(sel)
		4'b0000: begin                
					inp[0] = cin;
					inp[15:1] = 1'b0;
					end
		4'b0001: begin
					inp[0] = 1'b0;		
					inp[1] = cin;
					inp[15:2] = 1'b0;
					end
		4'b0010: begin
					inp[1:0] = 1'b0;
					inp[2] = cin;
					inp[15:3] = 1'b0;
					end
		4'b0011: begin
					inp[2:0] = 1'b0;
					inp[3] = cin;
					inp[15:4] = 1'b0;
					end
		4'b0100: begin 
					inp[3:0] = 1'b0;
					inp[4] = cin;
					inp[15:5] = 1'b0;
					end
		4'b0101: begin
					inp[4:0] = 1'b0;
					inp[5] = cin;
					inp[15:6] = 1'b0;
					end
		4'b0110: begin 
					out[5:0] = 1'b0;
					out[6] = cin;
					out[15:7] = 1'b0;
					end
		4'b0111: begin 
					out[6:0] = 1'b0;
					out[7] = cin;
					out[15:8] = 1'b0;
					end
		4'b1000: begin 
					inp[7:0] = 1'b0;
					inp[8] = cin;
					inp[15:9] = 1'b0;
					end
		4'b1001: begin  
					inp[8:0] = 1'b0;
					inp[9] = cin;
					inp[15:10] = 1'b0;
					end
		4'b1010: begin 
					inp[9:0] = 1'b0;
					inp[10] = cin;
					inp[15:11] = 1'b0;
					end
		4'b1011: begin 
					out[10:0] = 1'b0;
					out[11] = cin;
					out[15:12] = 1'b0;
					end
		4'b1100: begin
					inp[11:0] = 1'b0;
					inp[12] = cin;
					inp[15:13] = 1'b0;
					end
		4'b1101: begin 
					inp[12:0] = 1'b0;
					inp[13] = cin;
					inp[15:14] = 1'b0;
					end
		4'b1110: begin 
					inp[13:0] = 1'b0;
					inp[14] = cin;
					inp[15] = 1'b0;
					end
		default: begin                
					inp[15] = cin;
					inp[14:0] = 1'b0;
					end
		
		
	endcase
	
	
	end
	else begin inp = 0;
	out= 0;
	end
	end
	
endmodule*/
