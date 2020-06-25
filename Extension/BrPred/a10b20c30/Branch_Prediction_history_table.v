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
integer i ;

reg [31:0] PC_add_4_n, PC_add_4_nxt ;
reg [31:0] PC_add_imm_n, PC_add_imm_nxt ;
reg predict_jump_n, predict_jump_nxt ;
assign predict_jump = predict_jump_nxt;
reg in_table, in_table_nxt;
reg [3:0] table_index, table_index_nxt ;

reg [36:0] history_table [15:0];
reg [36:0] history_table_nxt [15:0];
reg [3:0] counter, counter_nxt ;

always@(*)
begin
	in_table_nxt = in_table ;	
	predict_jump_nxt = predict_jump_n ;  // default is to jump 
	for(i = 0; i<=15; i = i+1) 
	begin
		history_table_nxt[i] = history_table[i] ;
	end
	counter_nxt = counter ;
	table_index_nxt = table_index ; 

	if (branch_IF && stall != 1) // read table
	begin
		in_table_nxt = 0 ;
		predict_jump_nxt = 1 ;
		for(i = 0; i<=15; i = i+1) 
		begin
			if (history_table[i][32:1] == (PC_add_4)  )
			begin
				in_table_nxt = 1 ;
				table_index_nxt = i ;
				if (history_table[i][0] == 1'b1 )
					predict_jump_nxt = 1 ;
				else 
				begin
					predict_jump_nxt = 0 ;	
				end
			end
		end
	end
	else if (branch_ID && stall != 1) // write table
	begin
		if (in_table == 0) // need to write
		begin
			history_table_nxt[counter] = {{counter}, {PC_add_4_n}, jump_or_not};
			counter_nxt = counter + 1 ;
		end
		else 
		begin
			history_table_nxt[table_index][0] = jump_or_not ;
		end
	end
end

// current state 
always @(*) 
begin 
	correct = 1 ;
	if ( branch_ID == 0 || stall == 1 )
	begin
		correct = 1 ;
	end
	else 
	begin
		if (predict_jump_n == jump_or_not )
			correct = 1 ;
		else 
			correct = 0 ;
	end
end

// combination circuit deal with PC_out
always @(*) 
begin
	PC_add_imm_nxt = PC_add_imm_n ;
	PC_add_4_nxt = PC_add_4_n ; 
	PC_out = 0 ;
	//predict_jump_nxt = predict_jump_n ;
	if (branch_IF && stall != 1 )  // Beq have the chances to jump
	begin
		PC_add_imm_nxt = PC_add_imm ;
		PC_add_4_nxt = PC_add_4 ;

		if (predict_jump_nxt == 1) 
			PC_out = PC_add_imm ;
		else 
		begin
			PC_out = PC_add_4 ;	
		end
	end
	else if (branch_ID && stall != 1)
	begin
		//predict_jump_nxt = 0 ;
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
		//predict_jump_nxt = predict_jump_n ;
	end
end

// next state 
always @(posedge clk) 
begin
	if (~rst_n) 
	begin
		// reset
		for(i = 0; i<=15; i = i+1) begin
            history_table[i]  <= 154'd0;
        end
		PC_add_imm_n 	<= 0;
		PC_add_4_n 		<= 0;
		predict_jump_n  <= 0;
		counter 		<= 0;
		in_table 		<= 0;
		table_index     <= 0 ;
	end
	else
	begin
		for(i = 0; i<=15; i = i+1) begin
            history_table[i]  <= history_table_nxt[i];
        end
		PC_add_imm_n 	<= PC_add_imm_nxt ;
		PC_add_4_n 		<= PC_add_4_nxt ;
		predict_jump_n  <= predict_jump_nxt ;
		counter 		<= counter_nxt ;
		in_table 		<= in_table_nxt ;
		table_index     <= table_index_nxt ;
	end
end

endmodule