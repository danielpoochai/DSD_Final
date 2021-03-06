module hazard_process(
    ID_EX_rt,
    IF_ID_rs1,IF_ID_rs2,
    EX_MEM_rt,
    MEM_WB_rt,
    EX_MEM_memread,
    ID_EX_memread,
    MEM_WB_memread,
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


localparam BTYPE = 7'b1100011;

// always@(*) begin
//     hazard_stall= 1'b0;
//     hazard_flush= 1'b0;
//     hazard_mux  = 1'b0;
//     if(ID_EX_memread) begin
//         if(jal) begin
//             hazard_stall= 1'b0;
//             hazard_flush= 1'b0;
//             hazard_mux  = 1'b0;
//         end
//         else if(jalr) begin
//             if(ID_EX_rt == IF_ID_rs1) begin
//                 hazard_stall= 1'b1;
//                 hazard_flush= 1'b1;
//                 hazard_mux  = 1'b1;
//             end
//         end
//         else begin
//             if(ID_EX_rt == IF_ID_rs1 || ID_EX_rt == IF_ID_rs2) begin
//                 hazard_stall= 1'b1;
//                 hazard_flush= 1'b1;
//                 hazard_mux  = 1'b1;
//             end
//         end
//     end
//     else if(branch_flag) begin
//         hazard_stall= 1'b0;
//         hazard_flush= 1'b1;
//         hazard_mux  = 1'b0;
//     end
//     else if(IF_ID_op == BTYPE) begin
//         if(EX_MEM_memread) begin
//             if(EX_MEM_rt == IF_ID_rs1 || EX_MEM_rt == IF_ID_rs2) begin
//                 hazard_stall= 1'b1;
//                 hazard_flush= 1'b1;
//                 hazard_mux  = 1'b1;
//             end
//         end
//         else if(MEM_WB_memread) begin
//             if(MEM_WB_rt == IF_ID_rs1 || MEM_WB_rt == IF_ID_rs1) begin
//                 hazard_stall= 1'b1;
//                 hazard_flush= 1'b1;
//                 hazard_mux  = 1'b1;
//             end
//         end
//     end
//     else begin
//         hazard_stall= 1'b0;
//         hazard_flush= 1'b0;
//         hazard_mux  = 1'b0;
//     end
// end
always@(*) 
begin
    if(ID_EX_memread && ~jalr && ~jal && (ID_EX_rt == IF_ID_rs1 || ID_EX_rt == IF_ID_rs2) ) // only for load harzard 
    begin 
        hazard_stall = 1'b1;
        hazard_flush = 1'b1;
        hazard_mux = 1'b1;
    end
    else if(ID_EX_memread && jalr  && ID_EX_rt == IF_ID_rs1 ) // only for load harzard 
    begin 
        hazard_stall = 1'b1;
        hazard_flush = 1'b1;
        hazard_mux = 1'b1;
    end
    else if(ID_EX_memread && jal) 
    begin 
        hazard_stall = 1'b0;
        hazard_flush = 1'b0;
        hazard_mux   = 1'b0;
    end
    else if (branch_flag) // branch , jal, jalr 
    begin 
        hazard_stall = 1'b0;
        hazard_flush = 1'b1;
        hazard_mux   = 1'b0;
    end
    // else if(EX_MEM_memread && (EX_MEM_rt == IF_ID_rs1 ||  EX_MEM_rt == IF_ID_rs2) && IF_ID_op == 7'b1100011 ) 
    // begin
    //     hazard_stall = 1'b1;
    //     hazard_mux = 1'b1;
    //     hazard_flush = 1'b1;
    // end
    // else if(MEM_WB_memread && (MEM_WB_rt == IF_ID_rs1 ||  MEM_WB_rt == IF_ID_rs2)  && IF_ID_op == 7'b1100011 ) 
    // begin
    //     hazard_stall    = 1'b1;
    //     hazard_mux      = 1'b1;
    //     hazard_flush    = 1'b1;
    // end
    else 
    begin
        hazard_stall = 1'b0;
        hazard_flush = 1'b0;
        hazard_mux = 1'b0;
    end
    
end
endmodule