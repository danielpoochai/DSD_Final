module hazard_process(
    input [4:0] ID_EX_rt,
    input [4:0] IF_ID_rs1,IF_ID_rs2,
    input [4:0] EX_MEM_rt,
    input [4:0] MEM_WB_rt,
    input EX_MEM_memread,
    input  ID_EX_memread,
    input MEM_WB_memread,
    input branch_flag,
    input [6:0] IF_ID_op,
    output reg hazard_stall,
    output reg hazard_flush,
    output reg hazard_mux

);


always@(*) begin
    if(ID_EX_memread && (ID_EX_rt == IF_ID_rs1 || ID_EX_rt == IF_ID_rs2) ) begin 
        hazard_stall = 1'b1;
        hazard_flush = 1'b1;
        hazard_mux = 1'b1;
    end
    else begin 
        hazard_stall = 1'b0;
        hazard_flush = 1'b0;
        hazard_mux = 1'b0;

    end
    if (branch_flag) begin 
        hazard_stall = 1'b0;
        hazard_flush = 1'b1;
        hazard_mux = 1'b1;

    end
    else begin
        hazard_stall = 1'b0;
        hazard_flush = 1'b0;
        hazard_mux = 1'b0;

    end
    if(EX_MEM_memread && (EX_MEM_rt == IF_ID_rs1 ||  EX_MEM_rt == IF_ID_rs2) && IF_ID_op == 7'b1100011 ) begin
        hazard_stall = 1'b1;
        hazard_mux = 1'b1;
        hazard_flush = 1'b0;

    end
    else begin
        hazard_stall = 1'b0;
        hazard_flush = 1'b0;
        hazard_mux = 1'b0;
    end
    if(MEM_WB_memread && (MEM_WB_rt == IF_ID_rs1 ||  MEM_WB_rt == IF_ID_rs2)  && IF_ID_op == 7'b1100011 ) begin
        hazard_stall = 1'b1;
        hazard_mux = 1'b1;
        hazard_flush = 1'b0;

    end
    else begin
        hazard_stall = 1'b0;
        hazard_flush = 1'b0;
        hazard_mux = 1'b0;
    end
end
endmodule