`include "Decompressor.v"

module Alignment(
	clk,
	rst_n,
	cache_input,
	instruction_o,
	is_compress
	);
/*
This module is used to deal with the alignment before decompressor. 
*/
input clk;
input rst_n;
input  [31:0] cache_input;
output reg [31:0] instruction_o;
output reg is_compress;


reg [31:0] buffer_nxt;
reg [31:0] buffer ;
wire [31:0] instruction_i ;
assign instruction_i = {{cache_input[7:0]}, {cache_input[15:8]} , {cache_input[23:16]}, {cache_input[31:24]}};

reg counter , counter_nxt ;
reg [15:0] orig_instr ; 
reg with_buffer , with_buffer_nxt;
wire [31:0] decomp_instr ;


Decompressor decompressor(.orig_instr(orig_instr), .decomp_instr(decomp_instr));
// deal wtih next state
always@(*)
begin
	is_compress = 0 ;
	instruction_o = 0 ;
	orig_instr = 0 ;
	counter_nxt = counter;
	buffer_nxt = buffer;
	with_buffer_nxt = 0 ; 
	if (counter == 0)
	begin
		if (instruction_i[1:0] == 2'b11 || instruction_i == 32'd0) // 32 bits 
		begin
			instruction_o = instruction_i ;
		end
		else  // i6 bits instruction 
		begin
			orig_instr 		= instruction_i[15:0] ;
			instruction_o 	= decomp_instr ;
			counter_nxt 	= counter + 1 ;
			is_compress 	= 1 ;
		end
	end
	else  // counter == 1  still have a 16 bits instruction 
	begin
		if (with_buffer == 0)
		begin
			if (instruction_i[17:16] == 2'b11) // have to stall a cycle because it have a 32 bits instruction 
			begin
				buffer_nxt 		= instruction_i[31:16] ;
				instruction_o 	= 0 ;
				with_buffer_nxt = 1 ; 
			end
			else // do not have to stall 
			begin
				counter_nxt 	= 0 ;
				orig_instr 		= instruction_i[31:16] ;
				instruction_o 	= decomp_instr ;
				is_compress 	= 1 ;
			end
		end
		else
		begin
			instruction_o 	= {instruction_i[15:0], buffer};
			with_buffer_nxt = 0 ; 
		end
	end
end

always@(posedge clk)
begin
	if (~rst_n)
	begin
		buffer <= 0 ;
		counter <= 0 ;
		with_buffer <= 0 ;
	end
	else 
	begin
		buffer <= buffer_nxt ;
		counter <= counter_nxt ;
		with_buffer <= with_buffer_nxt ;
	end
end

endmodule