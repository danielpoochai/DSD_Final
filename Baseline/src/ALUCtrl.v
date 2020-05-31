module ALUCtrl(
    op,
    funct3,
    funct7,
    aluctrl
    );
    input [6:0] op;
    input [2:0] funct3;
    input funct7;

    //output reg [3:0] aluctrl;
    output reg [2:0] aluctrl;

    always@(*) begin
        case(op)
            7'b1101111: aluctrl = 3'b010; //4'b0010; //JAL
            7'b1100111: aluctrl = 3'b010; //4'b0010; //JALR
            7'b1100011: aluctrl = 3'b011; //4'b0110; //BEQ
            7'b0000011: aluctrl = 3'b010; //4'b0010; //LW
            7'b0100011: aluctrl = 3'b010; //4'b0010; //SW
            7'b0110011: 
            begin
                case(funct3)
                    //3'b000: aluctrl = funct7 ? 4'b0110: 4'b0010;
                    3'b000: aluctrl = funct7 ? 3'b011: 3'b010;
                    3'b010: aluctrl = 3'b100; //4'b1000;
                    3'b110: aluctrl = 3'b001; //4'b0001;
                    3'b111: aluctrl = 3'b000; //4'b0000;
                    default: aluctrl = 3'b000; //4'b0000;
                endcase
            end
            default:
                aluctrl = 3'b000; //4'b0000;
        endcase
    end
endmodule