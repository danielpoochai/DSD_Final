module PC(
    clk,
    rst_n,
    pc_in,
    pc_out,
    hazard_stall
    );

    input clk;
    input rst_n;
    input [31:0] pc_in;
    input hazard_stall;

    output reg [31:0] pc_out;
    reg [31:0] pc_out_n;

    always@(*) begin
        if(hazard_stall) pc_out_n = pc_out;
        else pc_out_n = pc_in;
    end

    always@(posedge clk)begin
        if(~rst_n) pc_out <= 0;
        else begin
            pc_out <= pc_out_n;
        end
    end
endmodule