module Imm_Gen(
    instr,
    immediate
    );
    input [31:0] instr;
    output reg signed [31:0] immediate;

    wire [6:0] opcode; 
    assign opcode = instr[6:0];

    //type 
    localparam ITYPE = 7'b0010011;
    localparam JTYPE = 7'b1101111;
    localparam BTYPE = 7'b1100011;
    localparam STYPE = 7'b0100011; 

    always@(*) begin
        case(opcode)
            ITYPE: //I TYPE
            begin
                immediate[31:11] = {21{instr[31]}};
                immediate[10:5]  = instr[30:25];
                immediate[4:1]   = instr[24:21];
                immediate[0]     = instr[20];
            end
            STYPE: //SW
            begin
                immediate[31:11] = {21{instr[31]}};
                immediate[10:5] = instr[30:25];
                immediate[4:1] = instr[11:8];
                immediate[0] = instr[7];
            end
            BTYPE: //BEQ
            begin
                immediate[31:12] = {20{instr[31]}};
                immediate[11] = instr[7];
                immediate[10:5] = instr[30:25];
                immediate[4:1] = instr[11:8];
                immediate[0] = 0;
            end
            JTYPE: //JAL
            begin
                immediate[31:20] = {12{instr[31]}};
                immediate[19:12] = instr[19:12];
                immediate[11] = instr[20];
                immediate[10:5] = instr[30:25];
                immediate[4:1] = instr[24:21];
                immediate[0] = 0;
            end
            default: //JALR LW RTYPE
            begin
                immediate[31:11] = {21{instr[31]}};
                immediate[10:5] = instr[30:25];
                immediate[4:1] = instr[24:21];
                immediate[0] = instr[20];
            end
        endcase
    end
endmodule