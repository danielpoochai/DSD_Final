module Decoder(
    hazard_mux,
    opcode,
    jalr,
    jal,
    branch,
    memread,
    memtoreg,
    memwrite,
    alusrc,
    regwrite,
    flush,
    aluop
    );
    input hazard_mux;
    input [6:0] opcode;

    output reg jalr;
    output reg jal;
    output reg branch;
    output reg memread;
    output reg memtoreg;
    output reg memwrite;
    output reg alusrc;
    output reg regwrite;
    output reg flush;
    output reg [1:0] aluop;

    //TYPE
    localparam RTYPE = 7'b0110011;
    localparam ITYPE = 7'b0010011;
    localparam LOAD  = 7'b0000011;
    localparam SAVE  = 7'b0100011;
    localparam BTYPE = 7'b1100011;
    localparam JTYPE = 7'b1101111;
    localparam JRTYPE= 7'b1100111;

    always@(*) begin
        jalr    = 0;
        jal     = 0;
        branch  = 0;
        memread = 0;
        memtoreg= 0;
        memwrite= 0;
        alusrc  = 0;
        regwrite= 0;
        flush   = 0;
        aluop   = 0;
        if(~(hazard_mux)) begin 
            case(opcode)
                RTYPE: 
                begin
                    jalr    = 0;
                    jal     = 0;
                    branch  = 0;
                    memread = 0;
                    memtoreg= 0;
                    memwrite= 0;
                    alusrc  = 0;
                    regwrite= 1;
                    flush   = 0;
                    aluop   = 2'b00;
                end
                ITYPE: 
                begin
                    jalr    = 0;
                    jal     = 0;
                    branch  = 0;
                    memread = 0;
                    memtoreg= 0;
                    memwrite= 0;
                    alusrc  = 1;
                    regwrite= 1;
                    flush   = 0;
                    aluop   = 2'b01;
                end
                LOAD:
                begin
                    jalr    = 0;
                    jal     = 0;
                    branch  = 0;
                    memread = 1;
                    memtoreg= 1;
                    memwrite= 0;
                    alusrc  = 1;
                    regwrite= 1;
                    flush   = 0;
                    aluop   = 2'b10;
                end
                SAVE:
                begin
                    jalr    = 0;
                    jal     = 0;
                    branch  = 0;
                    memread = 0;
                    memtoreg= 0;
                    memwrite= 1;
                    alusrc  = 1;
                    regwrite= 0;
                    flush   = 0;
                    aluop   = 2'b10;
                end
                BTYPE:
                begin
                    jalr    = 0;
                    jal     = 0;
                    branch  = 1;
                    memread = 0;
                    memtoreg= 0;
                    memwrite= 0;
                    alusrc  = 0;
                    regwrite= 0;
                    flush   = 0;
                    aluop   = 2'b00;
                end
                JTYPE:
                begin
                    jalr    = 0;
                    jal     = 1;
                    branch  = 0;
                    memread = 0;
                    memtoreg= 0;
                    memwrite= 0;
                    alusrc  = 0;
                    regwrite= 1;
                    flush   = 1;
                    aluop   = 2'b11;
                end
                JRTYPE:
                begin
                    jalr    = 1;
                    jal     = 0;
                    branch  = 0;
                    memread = 0;
                    memtoreg= 0;
                    memwrite= 0;
                    alusrc  = 1;
                    regwrite= 1;
                    flush   = 1;
                    aluop   = 2'b11;
                end
                default:
                begin
                    jalr    = 0;
                    jal     = 0;
                    branch  = 0;
                    memread = 0;
                    memtoreg= 0;
                    memwrite= 0;
                    alusrc  = 0;
                    regwrite= 0;
                    flush   = 0;
                    aluop   = 0;
                end
            endcase
        end
    end
endmodule
