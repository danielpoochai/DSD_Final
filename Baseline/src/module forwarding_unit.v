module forwarding_unit(
    input [31:0] ID/EX_rs1;
    input [31:0] ID/EX_rs2;
    input [31:0] EX/MEM_rd;
    input [31:0] MEM/WB_rd;
    input EX/MEM_regwrite;
    input MEM/WB_regwrite;
    output [1:0] EX/MEM_rs1_control;
    output [1:0] EX/MEM_rs2_control;
);

always@(*) begin
    if()




end