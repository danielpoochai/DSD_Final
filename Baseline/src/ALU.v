module ALU(
    src1,
    src2,
    ctrl,
    result,
    zero
    );
    input signed [31:0] src1;
    input signed [31:0] src2;
    //input [3:0] ctrl;
    input [2:0] ctrl;

    output reg signed[31:0] result;
    output zero;

    assign zero = ~(result || 32'd0); 

    always@(*) begin
        result = 32'd0;
        case(ctrl)
            3'b000: //4'b0000: //and
            begin
                result = src1 & src2;
            end
            3'b001: //4'b0001: //or
            begin
                result = src1 |  src2;
            end
            3'b010: //4'b0010: //add
            begin
                result = $signed(src1) + $signed(src2);
            end
            3'b011: //4'b0110: //sub
            begin
                result = $signed(src1) - $signed(src2);
            end
            3'b100: //4'b1000: //slt
            begin
                result = ($signed(src1) < $signed(src2)) ? 32'd1: 32'd0;
            end
            default:
            begin
                result = 0;
            end
        endcase
    end    
endmodule