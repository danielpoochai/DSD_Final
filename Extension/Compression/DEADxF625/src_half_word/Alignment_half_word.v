`include "Decompressor.v"

module Alignment(
	clk,
	rst_n,
	stall,
	cache_input,
	instruction_o,
	is_compress_o,
	hazard_flush,
	jump
	);
	
	//inout
	input clk;
	input rst_n;
	input stall;
	input hazard_flush;
	input jump;
	input [15:0] cache_input;
	output [31:0] instruction_o;
	output is_compress_o;

	//internal signal
	reg [15:0] buffer_r, buffer_w;
	reg [31:0] instruction_r, instruction_w;
	reg is_compress_r, is_compress_w;
	// reg counter_r, counter_w;
	reg with_buffer_r, with_buffer_w;
	// reg align_stall_r, align_stall_w;

	wire [15:0] instruction_i;
	reg [15:0] orig_instr_reg;

	wire [15:0] orig_instr;
	wire [31:0] decomp_instr;

	//assignment output
	assign instruction_o= instruction_w;
	assign is_compress_o= is_compress_w;
	assign instruction_i= { cache_input[7:0], cache_input[15:8]};
	assign orig_instr 	= orig_instr_reg;

	//Decompressor
	Decompressor decompressor(.orig_instr(orig_instr), .decomp_instr(decomp_instr));

	always@(*) begin
		buffer_w 		= buffer_r;
		//counter_w 		= counter_r;
		with_buffer_w 	= with_buffer_r;
		instruction_w 	= instruction_r;
		is_compress_w 	= is_compress_r;
		//align_stall_w 	= 0;
		if(stall) begin
			buffer_w 		= buffer_r;
			//counter_w 		= counter_r;
			with_buffer_w 	= with_buffer_r;
			instruction_w 	= instruction_r;
			is_compress_w 	= is_compress_r;
			//align_stall_w 	= 0;
		end
		else if(jump) 
		begin
			buffer_w 		= 0;
			//counter_w 		= 0;
			with_buffer_w 	= 0;
			is_compress_w 	= is_compress_r;
		end
		else 
		begin
		/*
			if(counter_r == 0) begin 
				if(instruction_i[1:0] == 2'b11 || instruction_i == 32'd0) begin
					instruction_w = instruction_i;
					is_compress_w = 1'd0 ;
					with_buffer_w = 1'd0 ;
				end
				else begin //compressed instruction
					orig_instr_reg 	= instruction_i[15:0];
					instruction_w 	= decomp_instr;
					counter_w 		= 1'd1;
					is_compress_w 	= 1'd1;
				end
			end
			else begin // counter == 1 
		*/
				if(with_buffer_r) begin //32 bit instruction
					instruction_w 	= { instruction_i , buffer_r};
					buffer_w 		= 16'd0;
					with_buffer_w 	= 1'b0;
					is_compress_w 	= 1'b0; 
					// counter_w		= 1'b1;
					// align_stall_w 	= 1'b0;
				end
				else begin
					if(instruction_i[1:0] == 2'b11 || instruction_i == 16'd0 ) begin //need to stall a cycle to fetch upper 16 bits instruction 
						instruction_w 	= 32'd0;
						buffer_w 		= instruction_i;
						with_buffer_w 	= 1'b1;
						is_compress_w 	= is_compress_r;
						// counter_w 		= counter_r ;
					end
					else begin //compressed instruction 
						orig_instr_reg= instruction_i;
						instruction_w = decomp_instr;
						is_compress_w = 1'b1;
						// counter_w 	  = 1'd0;
						with_buffer_w = 1'd0 ;
					end
				end
			
		end
	end

	always@(posedge clk) begin
		if(~rst_n) begin
			buffer_r 		<= 16'd0;
			instruction_r 	<= 32'd0;
			is_compress_r 	<= 1'd0;
			//counter_r 		<= 1'd0;
			with_buffer_r 	<= 1'd0;
			//align_stall_r 	<= 1'd0;
		end
		else begin
			buffer_r 		<= buffer_w;
			instruction_r 	<= instruction_w;
			is_compress_r 	<= is_compress_w;
			//counter_r 		<= counter_w;
			with_buffer_r 	<= with_buffer_w;
			//align_stall_r 	<= align_stall_w;
		end
	end
endmodule