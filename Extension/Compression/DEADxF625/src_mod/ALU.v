module ALU(
    src1,
    src2,
    aluctrl,
    result,
    zero
    );
    input signed [31:0] src1;
    input signed [31:0] src2;
    input [3:0] aluctrl;

    output reg signed[31:0] result;
    output zero;

    //assignment
    assign zero = result == 32'd0;

    //type
    localparam AND= 4'b0000;
    localparam OR = 4'b0001;
    localparam ADD= 4'b0010;
    localparam SUB= 4'b0011;
    localparam XOR= 4'b0100;
    localparam SLT= 4'b0101;
    localparam SLL= 4'b0110;
    localparam SRL= 4'b0111;
    localparam SRA= 4'b1000;

    always@(*) begin
        result = 32'd0;
        case(aluctrl)
            AND: result = src1 & src2;
            OR:  result = src1 | src2;   
            ADD: result = $signed(src1) + $signed(src2);
            SUB: result = $signed(src1) - $signed(src2);
            XOR: result = src1 ^ src2; 
            SLT: result = ($signed(src1) < $signed(src2)) ? 32'd1: 32'd0;
            SLL: result = src1 << src2;
            SRL: result = src1 >> src2;
            SRA: result = src1 >>> src2;
            default: result = 0;
        endcase
    end    
endmodule