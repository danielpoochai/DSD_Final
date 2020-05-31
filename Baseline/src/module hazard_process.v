module hazard_process(
    input [4:0] ID/EX_rt;
    input [4:0] IF/ID_rs1,IF/ID_rs2;
    input [4:0] EX/MEM_rt;
    input EX/MEM_memread;
    input ID/EX_memread;
    input branch_flag;
    output hazard_stall;
    output hazard_flush;
    output stall_lwbranch;
    /*
    beq:{000,1100011}	
    bne:{001,1100011}
    lw:{010,0000011}
    */ 
);

always@(*) begin
    if(ID/EX_memread && (ID/EX_rt == IF/ID_rs1 || ID/EX_rt == IF/ID_rs2) ) begin 
        hazard_stall = 1'b1;
        hazard_flush = 1'b1;
        stall_lwbranch = 1'b0;
    end
    else begin 
        hazard_stall = 1'b0;
        hazard_flush = 1'b0;
        stall_lwbranch = 1'b0;
    end
    if (branch_flag) begin 
        hazard_stall = 1'b0;
        hazard_flush = 1'b1;
        stall_lwbranch = 1'b0;
    end
    else begin
        hazard_stall = 1'b0;
        hazard_flush = 1'b0;
        stall_lwbranch = 1'b0;
    end
    if(EX/MEM_memread && (EX/MEM_rt == IF/ID_rs1 || EX/MEM_rt == IF/ID_rs2) &&  ) begin
        


    end
    
end
