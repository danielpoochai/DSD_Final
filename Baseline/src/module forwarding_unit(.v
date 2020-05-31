module forwarding_unit(
    input [4:0] ID/EX_rs1;
    input [4:0] ID/EX_rs2;
    input [4:0] EX/MEM_rd;
    input [4:0] MEM/WB_rd;
    input EX/MEM_regwrite;
    input MEM/WB_regwrite;
    output [1:0] EX/MEM_rs1_control;
    output [1:0] EX/MEM_rs2_control;

);

always@(*) begin
    if(EX/MEM_regwrite && (EX/MEM_rd != 5'd0) && (EX/MEM_rd == ID/EX_rs1)) begin
        EX/MEM_rs1_control = 2'b10;
    end
    else if (MEM/WB_regwrite && MEM/WB_rd != 5'd0 && !(EX/MEM_regwrite && EX/MEM_rd != 5'd0 && EX/MEM_rd == ID/EX_rs1) && MEM/WB_rd == ID/EX_rs1  )
        EX/MEM_rs1_control = 2'b01;
    else EX/MEM_rs1_control = 2'b00;


    if(EX/MEM_regwrite && EX/MEM_rd != 5'd0 && EX/MEM_rd == ID/EX_rs2) begin
        EX/MEM_rs2_control = 2'b10;
    end
    else if (MEM/WB_regwrite && MEM/WB_rd != 5'd0 && !(EX/MEM_regwrite && EX/MEM_rd != 5'd0 && EX/MEM_rd == ID/EX_rs2) && MEM/WB_rd == ID/EX_rs2  )
        EX/MEM_rs2_control = 2'b01;
    else EX/MEM_rs2_control = 2'b00;


    


end