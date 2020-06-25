module ALUCtrl(
    aluop,
    funct3,
    funct7,
    aluctrl
    );
    input [1:0] aluop;
    input [2:0] funct3;
    input funct7;

    output reg [3:0] aluctrl;

    //TYPE  
    localparam RTYPE            = 2'b00;
    localparam ITYPE            = 2'b01;
    localparam LOAD_SAVE_BTYPE  = 2'b10; //with Branch
    localparam JTYPE            = 2'b11;

    localparam AND = 4'b0000;
    localparam OR  = 4'b0001;
    localparam ADD = 4'b0010;
    localparam SUB = 4'b0011;
    localparam XOR = 4'b0100;
    localparam SLT = 4'b0101;
    localparam SLL = 4'b0110;
    localparam SRL = 4'b0111;
    localparam SRA = 4'b1000;

    always@(*) begin
        case(aluop)
            RTYPE:
            begin
                if(funct7) aluctrl = SUB;
                else begin
                    case(funct3) 
                        3'b000: aluctrl = ADD;
                        3'b010: aluctrl = SLT;
                        3'b100: aluctrl = XOR;
                        3'b110: aluctrl = OR;
                        3'b111: aluctrl = AND;
                        default: aluctrl = 0;
                    endcase
                end
            end
            ITYPE:
            begin
                if(funct7 && (funct3 == 3'b101)) aluctrl = SRA;
                else begin
                    case(funct3)
                        3'b000: aluctrl = ADD;
                        3'b010: aluctrl = SLT;
                        3'b100: aluctrl = XOR;
                        3'b110: aluctrl = OR;
                        3'b111: aluctrl = AND;
                        3'b001: aluctrl = SLL;
                        3'b101: aluctrl = SRL;
                        default: aluctrl = 0;
                    endcase
                end
            end
            LOAD_SAVE_BTYPE:
            begin
                if(funct3[1]) aluctrl = ADD;
                else aluctrl = SUB;
            end
            JTYPE:
            begin
                aluctrl = ADD;
            end
            default:
            begin
                aluctrl = ADD;
            end
        endcase
    end
endmodule