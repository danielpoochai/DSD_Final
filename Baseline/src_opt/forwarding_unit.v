module forwarding_unit(
    input [4:0] ID_EX_rs1,
    input [4:0] ID_EX_rs2,
    input [4:0] ID_EX_rd,
    input [4:0] EX_MEM_rd,
    input [4:0] MEM_WB_rd,
    input [4:0] rs1,
    input [4:0] rs2,
    input jalr,
    input ID_EX_regwrite,
    input EX_MEM_regwrite,
    input MEM_WB_regwrite,
    output reg rs1_select,
    output reg is_mem,
    output reg is_ex,
    output reg [1:0] EX_MEM_rs1_control,
    output reg [1:0] EX_MEM_rs2_control
);

always@(*) begin //deal with jalr branch right after JTYPE
    is_mem  = 1'd0;
    is_ex   = 1'd0; 
    rs1_select = 1'd0;
    if(jalr) begin
        if(ID_EX_regwrite && (ID_EX_rd != 5'd0) && (ID_EX_rd == rs1)) begin
            is_ex = 1'b1;
            rs1_select = 1'b1;
        end
        else if(EX_MEM_regwrite && (EX_MEM_rd != 5'd0) && (EX_MEM_rd == rs1)) begin
            is_mem = 1'b1;
            rs1_select = 1'b1;
        end
        else if (MEM_WB_regwrite && (MEM_WB_rd != 5'd0) && MEM_WB_rd == rs1) begin  //&& !(EX_MEM_regwrite && EX_MEM_rd != 5'd0 && EX_MEM_rd == rs1)
            is_mem = 1'b0;
            rs1_select = 1'b1;
        end
    end
    else begin
        is_mem = 1'b0;
        rs1_select = 1'b0;
    end 
end

always@(*) begin
    if(EX_MEM_regwrite && (EX_MEM_rd != 5'd0) && (EX_MEM_rd == ID_EX_rs1)) 
    begin
        EX_MEM_rs1_control = 2'b10;
    end
    else if (MEM_WB_regwrite && MEM_WB_rd != 5'd0 && MEM_WB_rd == ID_EX_rs1)
        EX_MEM_rs1_control = 2'b01;
    else EX_MEM_rs1_control = 2'b00;
    
    if(EX_MEM_regwrite && EX_MEM_rd != 5'd0 && EX_MEM_rd == ID_EX_rs2) begin
        EX_MEM_rs2_control = 2'b10;
    end
    else if (MEM_WB_regwrite && MEM_WB_rd != 5'd0 && MEM_WB_rd == ID_EX_rs2)
        EX_MEM_rs2_control = 2'b01;
    else EX_MEM_rs2_control = 2'b00;

end

endmodule 