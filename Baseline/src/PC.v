module PC(
    clk,
    rst_n,
    pc_in,
    pc_out,
    stall_pc
    );
    input clk;
    input rst_n;
    input [31:0] pc_in;
    input stall_pc;

    output reg [31:0] pc_out;
    reg [31:0] pc_out_n;

    always@(*) begin
        if(stall_pc) pc_out_n = pc_in;
        else pc_out_n = pc_out;
    end

    always@(posedge clk)begin
        if(~rst_n) pc_out <= 0;
        else begin
            pc_out <= pc_out_n;
        end
    end
endmodule