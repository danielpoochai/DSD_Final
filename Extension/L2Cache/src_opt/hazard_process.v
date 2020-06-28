module hazard_process(
    ID_EX_rt,
    IF_ID_rs1,IF_ID_rs2,
    EX_MEM_rt,
    MEM_WB_rt,
    EX_MEM_memread,
    ID_EX_memread,
    MEM_WB_memread,
    jump_flag,
    branch_flag,          // real branch_or_not or jal or jalr 
    // input branch_predict;    // branch prediction 
    IF_ID_op,       // read in OP code 
    jal,
    jalr,
    hazard_stall,
    hazard_flush,
    hazard_mux
);
input [4:0] ID_EX_rt;
input [4:0] IF_ID_rs1,IF_ID_rs2;
input [4:0] EX_MEM_rt;
input [4:0] MEM_WB_rt;
input EX_MEM_memread;
input ID_EX_memread;
input MEM_WB_memread;
input jump_flag;
input branch_flag;          // real branch_or_not or jal or jalr 
// input branch_predict;    // branch prediction 
input [6:0] IF_ID_op;       // read in OP code 
input jal;
input jalr;
output reg hazard_flush, hazard_stall, hazard_mux ;
/*
This function used to detect hazard below.
1. load hazard (stall one cycle)
2. prediction miss hazard (stall one cycle)
3. load followed by a branch (stall two cycle)
*/

always@(*) 
begin
    if(branch_flag) 
    begin
        hazard_stall = 1'b0;
        hazard_flush = 1'b1;
        hazard_mux   = 1'b1; 
    end
    else if(ID_EX_memread && ~jalr && ~jal && (ID_EX_rt == IF_ID_rs1 || ID_EX_rt == IF_ID_rs2) ) // only for load harzard 
    begin 
        hazard_stall = 1'b1;
        hazard_flush = 1'b1;
        hazard_mux   = 1'b0;
    end
    else if(ID_EX_memread && jalr  && ID_EX_rt == IF_ID_rs1 ) // only for load harzard 
    begin 
        hazard_stall = 1'b1;
        hazard_flush = 1'b1;
        hazard_mux = 1'b1;
    end
    else if(jump_flag) //jal, jalr 
    begin 
        hazard_stall = 1'b0;
        hazard_flush = 1'b1;
        hazard_mux   = 1'b0;
    end
    else 
    begin
        hazard_stall = 1'b0;
        hazard_flush = 1'b0;
        hazard_mux = 1'b0;
    end
    
end
endmodule