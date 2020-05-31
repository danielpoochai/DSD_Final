module Branch_Prediction(
	clk,
	rst_n,
	equal_or_not,
	opcode,
	branch_or_not
	);

input clk, rst_n;
input equal_or_not; // equal == 1 branch, equal == 0 not branch 
input Beq;
output branch_or_not;

reg state, state_nxt;

localparam take_1     = 2'b00; //jump
localparam take_2     = 2'b01; //jump
localparam not_take_1 = 2'b10; // not jump
localparam not_take_2 = 2'b11; // not jump 

// current state 
always@(*) 
begin
	state_nxt = take_1 ; 
	if (state == take_1)
	begin
		if (equal_or_not == 1) // jump
		begin
			state_nxt = take_1;
		end
		else 
		begin
			state_nxt = take_2;
		end
	end
	else if (state == take_2)
	begin
		if (equal_or_not == 1) // jump
		begin
			state_nxt = take_1;
		end
		else 
		begin
			state_nxt = not_take_2;
		end
	end
	else if (state == not_take_1) 
	begin
		if (equal_or_not == 1) // jump
		begin
			state_nxt = not_take_2;
		end
		else 
		begin
			state_nxt = not_take_1;
		end
	end
	else if (state == not_take_2) 
	begin
		if (equal_or_not == 1) // jump
		begin
			state_nxt = take_2;
		end
		else 
		begin
			state_nxt = not_take_1;
		end
	end
	else 
	begin
		state_nxt = take_1	
	end
end
// combination circuit
always @(*) 
begin
	if (Beq)  // Beq have the chances to jump
	begin
		// reset
		if (state == take_1 || state == take_2)
		begin
			branch_or_not = 1 ;
		end
		else 
		begin
			branch_or_not = 0 ;
		end
	end
	else 
	begin
		branch_or_not = 0 ;
	end
end
// next state 
always @(posedge clk) 
begin
	if (~rst_n) 
	begin
		// reset
		state <= not_take_1 ;
	end
	else
	begin
		state <= state_nxt ;
	end
end

endmodule