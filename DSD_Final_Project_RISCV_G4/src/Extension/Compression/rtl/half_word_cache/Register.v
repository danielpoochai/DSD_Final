module Registers(
    clk,
    rst_n,
    regwrite,
    rs1,
    rs2,
    rd,
    rd_data,
    rs1_data,
    rs2_data
    );
    input clk;
    input rst_n;
    input regwrite;
    input [4:0] rs1;
    input [4:0] rs2;
    input [4:0] rd;
    input [31:0] rd_data;

    output signed [31:0] rs1_data;
    output signed [31:0] rs2_data;

    reg signed [31:0] REGISTER_BANK[0:31], REGISTER_BANK_NXT[0:31];

    assign rs1_data = REGISTER_BANK_NXT[rs1];
    assign rs2_data = REGISTER_BANK_NXT[rs2];

    integer i,k;
    always@(*) begin
        REGISTER_BANK_NXT[0] =32'd0;
        for(i=1; i<=31; i=i+1) REGISTER_BANK_NXT[i] = REGISTER_BANK[i];
        case(regwrite)
            1'b1: 
            begin
                if(rd == 0) begin
                    REGISTER_BANK_NXT[rd] = 32'd0;
                end
                else begin
                    REGISTER_BANK_NXT[rd] = rd_data;
                end
            end
            default:
            begin
                REGISTER_BANK_NXT[0] =32'd0;
                for(k=1; k<=31; k=k+1) REGISTER_BANK_NXT[k] = REGISTER_BANK[k];
            end
        endcase
    end

    integer j;
    always@(posedge clk) begin
        if(~rst_n) begin
            for(j=0; j<=31; j=j+1) REGISTER_BANK[j] <= 32'd0;
        end
        else begin
            for(j=0; j<=31; j=j+1) REGISTER_BANK[j] <= REGISTER_BANK_NXT[j];
        end
    end
endmodule