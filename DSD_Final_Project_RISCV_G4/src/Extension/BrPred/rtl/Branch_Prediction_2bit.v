module Branch_Prediction(
	clk,
	rst_n,
	jump_or_not,
	branch_IF,
	branch_ID,
	PC_add_imm,
	PC_add_4,
	PC_out,
	correct,
	predict_jump,
	stall
	);
/*
This function only runs when the branch signal equal to 1 and it will give out
prediction to branch or not to branch immediately. 
*/
input clk, rst_n;
input jump_or_not; 		// equal == 1 jump, equal == 0 not jump 
input branch_IF; 				// branch siganl 
input branch_ID;
input [31:0] PC_add_4, PC_add_imm ;
output reg [31:0] PC_out; 	// output signal ask the module to jump 
output reg correct ;
output predict_jump ;
input stall ;

reg [1:0] state, state_nxt;
reg [31:0] PC_add_4_n, PC_add_4_nxt ;
reg [31:0] PC_add_imm_n, PC_add_imm_nxt ;
reg predict_jump_n, predict_jump_nxt ;
assign predict_jump = predict_jump_nxt;

localparam take_1     = 2'b00; //jump
localparam take_2     = 2'b01; //jump
localparam not_take_1 = 2'b10; // not jump
localparam not_take_2 = 2'b11; // not jump 

// current state 
always@(*) 
begin
	state_nxt = take_1 ; 
	correct = 1 ;
	if ( branch_ID == 0 || stall == 1 )
	begin
		state_nxt = state ;
		correct = 1 ;
	end
	else if (branch_ID == 1 )
	begin
		//$display("state = 0x%2d" , state);
		if (state == take_1)
		begin
			if (jump_or_not == 1) // jump
			begin
				state_nxt = take_1;
			end
			else 
			begin
				state_nxt = take_2;
				correct = 0 ;
			end
		end
		else if (state == take_2)
		begin
			if (jump_or_not == 1) // jump
			begin
				state_nxt = take_1;
			end
			else 
			begin
				state_nxt = not_take_2;
				correct = 0 ;
			end
		end
		else if (state == not_take_1) 
		begin
			if (jump_or_not == 1) // jump
			begin
				state_nxt = not_take_2;
				correct = 0 ;
			end
			else 
			begin
				state_nxt = not_take_1;
			end
		end
		else if (state == not_take_2) 
		begin
			if (jump_or_not == 1) // jump
			begin
				state_nxt = take_2;
				correct = 0 ;
			end
			else 
			begin
				state_nxt = not_take_1;
			end
		end
		else 
		begin
			state_nxt = take_1;
		end
	end
end

// combination circuit deal with PC_out
always @(*) 
begin
	PC_add_imm_nxt = PC_add_imm_n ;
	PC_add_4_nxt = PC_add_4_n ; 
	PC_out = 0 ;
	predict_jump_nxt = predict_jump_n ;
	if (branch_IF && stall != 1 )  // Beq have the chances to jump
	begin
		PC_add_imm_nxt = PC_add_imm ;
		PC_add_4_nxt = PC_add_4 ;
		// reset
		if (state == take_1 || state == take_2)
		begin
			PC_out = PC_add_imm ;
			predict_jump_nxt = 1 ;
		end
		else 
		begin
			PC_out = PC_add_4;
			predict_jump_nxt = 0 ;
		end
	end
	else if (branch_ID)
	begin
		predict_jump_nxt = 0 ;
		if (correct) //predict correct 
		begin
			if (predict_jump_n == 1)
				PC_out = PC_add_imm_n + 4 ;
			else 
				PC_out = PC_add_4_n + 4;
		end
		else // predict wrong 
		begin
			if (predict_jump_n == 1 )
				PC_out = PC_add_4_n;
			else 
				PC_out = PC_add_imm_n ;
		end
	end
	else 
	begin
		PC_out = PC_add_4 ;
		predict_jump_nxt = predict_jump_n ;
	end
end

// next state 
always @(posedge clk) 
begin
	if (~rst_n) 
	begin
		// reset
		state 			<= not_take_1 ;
		PC_add_imm_n 	<= 0;
		PC_add_4_n 		<= 0;
		predict_jump_n  <= 0;
	end
	else
	begin
		state 			<= state_nxt ;
		PC_add_imm_n 	<= PC_add_imm_nxt ;
		PC_add_4_n 		<= PC_add_4_nxt ;
		predict_jump_n  <= predict_jump_nxt ;
	end
end

endmodule