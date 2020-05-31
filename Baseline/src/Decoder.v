module Decoder(
    opcode,
    jalr,
    jal,
    branch,
    memread,
    memtoreg,
    memwrite,
    alusrc,
    regwrite
    );
    input [6:0] opcode;

    output reg jalr;
    output reg jal;
    output reg branch;
    output reg memread;
    output reg memtoreg;
    output reg memwrite;
    output reg alusrc;
    output reg regwrite;

    always@(*) begin
        jalr = 0;
        jal = 0;
        branch = 0;
        memread = 0;
        memtoreg = 0;
        memwrite = 0;
        alusrc = 0;
        regwrite = 0;
        case(opcode)
            7'b0110011: //RTYPE
            begin
                jalr = 0;
                jal = 0;
                branch = 0;
                memread = 0;
                memtoreg = 0;
                memwrite = 0;
                alusrc = 0;
                regwrite = 1;
            end
            7'b0000011: //LW
            begin
                jalr = 0;
                jal = 0;
                branch = 0;
                memread = 1;
                memtoreg = 1;
                memwrite = 0;
                alusrc = 1;
                regwrite = 1;
            end
            7'b1100111: //JALR
            begin
                jalr = 1;
                jal = 0;
                branch = 0;
                memread = 0;
                memtoreg = 0;
                memwrite = 0;
                alusrc = 1;
                regwrite = 1;
            end
            7'b0100011: //SW
            begin
                jalr = 0;
                jal = 0;
                branch = 0;
                memread = 0;
                memtoreg = 0;
                memwrite = 1;
                alusrc = 1;
                regwrite = 0;
            end
            7'b1100011: //Beq
            begin
                jalr = 0;
                jal = 0;
                branch = 1;
                memread = 0;
                memtoreg = 0;
                memwrite = 0;
                alusrc = 0;
                regwrite = 0;
            end
            7'b1101111: //Jal
            begin
                jalr = 0;
                jal = 1;
                branch = 0;
                memread = 0;
                memtoreg = 0;
                memwrite = 0;
                alusrc = 0;
                regwrite = 1;
            end
            default:
            begin
                jalr = 0;
                jal = 0;
                branch = 0;
                memread = 0;
                memtoreg = 0;
                memwrite = 0;
                alusrc = 0;
                regwrite = 0;
            end
        endcase
    end
endmodule