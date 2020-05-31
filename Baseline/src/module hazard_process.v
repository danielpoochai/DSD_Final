module hazard_process(
    input [4:0] ID/EX_rt;
    input [4:0] IF/ID_rs1,IF/ID_rs2;
    input  ID/EX_memread;
    input branch_flag;
    output stall_pc;
    output flush_IF/ID;

    /*
    beq:{000,1100011}	
    bne:{001,1100011}
    lw:{010,0000011}
    */ 

);
always@(*) begin
    if(ID/EX_memread && (ID/EX_rt == IF/ID_rs1 || ID/EX_rt == IF/ID_rs2) ) begin 
        stall_pc = 1'b1;
        flush_IF/ID = 1'b1;
    end
    else begin 
        stall_pc = 1'b0;
        flush_IF/ID = 1'b0;
    end
    if (branch_flag) begin 
        stall_pc = 1'b1;
        flush_IF/ID = 1'b1;
    end
    else begin
        stall_pc = 1'b0;
        flush_IF/ID = 1'b0;
    end
end