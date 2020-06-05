module hazard_process(
    input [4:0] ID_EX_rt,
    input [4:0] IF_ID_rs1,IF_ID_rs2,
    input [4:0] EX_MEM_rt,
    input [4:0] MEM_WB_rt,
    input EX_MEM_memread,
    input ID_EX_memread,
    input MEM_WB_memread,
    input branch_flag,          // real branch_or_not or jal or jalr 
    // input branch_predict;    // branch prediction 
    input [6:0] IF_ID_op,       // read in OP code 
    output reg hazard_stall,
    output reg hazard_flush,
    output reg hazard_mux
);

/*
This function used to detect hazard below.
1. load hazard (stall one cycle)
2. prediction miss hazard (stall one cycle)
3. load followed by a branch (stall two cycle)
*/
always@(*) 
begin
    if(ID_EX_memread && (ID_EX_rt == IF_ID_rs1 || ID_EX_rt == IF_ID_rs2) ) // only for load harzard 
    begin 
        hazard_stall = 1'b1;
        hazard_flush = 1'b1;
        hazard_mux = 1'b1;
    end
    else if (branch_flag) 
    begin 
        hazard_stall = 1'b0;
        hazard_flush = 1'b1;
        hazard_mux   = 1'b0;
    end
    else if(EX_MEM_memread && (EX_MEM_rt == IF_ID_rs1 ||  EX_MEM_rt == IF_ID_rs2) && IF_ID_op == 7'b1100011 ) 
    begin
        hazard_stall = 1'b1;
        hazard_mux = 1'b1;
        hazard_flush = 1'b1;
    end
    else if(MEM_WB_memread && (MEM_WB_rt == IF_ID_rs1 ||  MEM_WB_rt == IF_ID_rs2)  && IF_ID_op == 7'b1100011 ) 
    begin
        hazard_stall    = 1'b1;
        hazard_mux      = 1'b1;
        hazard_flush    = 1'b1;
    end
    else begin
        hazard_stall = 1'b0;
        hazard_flush = 1'b0;
        hazard_mux = 1'b0;
    end
    
end
endmodule