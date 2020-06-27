module cache_L2(
    clk,
    proc_reset, 
    //I cache interface
    // L2_read_I,
    L2_addr_I,
    L2_rdata_I,
    L2_ready_I,
    //D cache interface
    L2_read,
    L2_write,
    L2_addr,
    L2_rdata,
    L2_wdata,
    L2_ready,
    //I_mem
    mem_read_I,
    mem_rdata_I,
    mem_addr_I,
    mem_ready_I,
    //D_mem
    mem_read_D,
    mem_rdata_D,
    mem_write_D,
    mem_wdata_D,
    mem_addr_D,
    mem_ready_D
);
    
//==== input/output definition ============================
    input          clk;
    // processor interface
    input          proc_reset;
    // I cache interface
    // input L2_read_I;
    input [29:0] L2_addr_I;
    output [31:0] L2_rdata_I;
    output L2_ready_I;

    // D cache interface
    input L2_read;
    input L2_write;
    input [29:0] L2_addr;
    input [31:0] L2_wdata;
    output [31:0] L2_rdata;
    output L2_ready;

    //I memory interface
    input  [127:0] mem_rdata_I;
    input          mem_ready_I;
    output         mem_read_I;
    output  [27:0] mem_addr_I;

    //D memory interface
    input  [127:0] mem_rdata_D;
    input          mem_ready_D;
    output mem_read_D;
    output mem_write_D;
    output [27:0]  mem_addr_D;
    output [127:0] mem_wdata_D;
//====parameters   ========================================
    localparam IDLE             = 2'd0;
    localparam READ_STALL       = 2'd1;
    localparam WRITE_STALL_WRITE= 2'd2;

    localparam IDLE_I           = 1'd0;
    localparam READ_STALL_I     = 1'd1;
//==== wire/reg definition ================================
    //cache reg 8 x (25+ 32x4) = 8 x 153 
    reg [152:0] cache_r[0:63] ,cache_w[0:63]; //format: dirty/v/I or D/tag/word3/word2/word1/word0
    //state reg
    reg [1:0] I_state_r, I_state_w; //for I L1 cache
    reg [1:0] D_state_r, D_state_w; //for D L1 cache
    //output reg for I cache
    reg L2_ready_I_r, L2_ready_I_w;
    reg [31:0] L2_rdata_I;
    //output reg for D cache
    reg L2_ready_r, L2_ready_w;
    reg [31:0] L2_rdata; 

    reg mem_read_I_r, mem_read_I_w;
    reg mem_read_D_r, mem_read_D_w;
    reg mem_write_D_r, mem_write_D_w;
    reg [27:0] mem_addr_I_r, mem_addr_I_w;
    reg [27:0] mem_addr_D_r, mem_addr_D_w;
    reg [127:0] mem_wdata_D_r, mem_wdata_D_w;

    //index tag wire                                     
    wire [5:0] index_I, index_D;
    wire [24:0] tag_I, tag_D, tag_in_cache_I, tag_in_cache_D;
    wire valid_in_cache_I, dirty_in_cache_I, which_in_cache_I;
    wire valid_in_cache_D, dirty_in_cache_D, which_in_cache_D;

//==== Assignment =========================================
    //assign tag data1 data2 data3 data4               
    assign index_I          = L2_addr_I[7:2];
    assign tag_I            = L2_addr_I[29:8];
    assign tag_in_cache_I   = cache_r[index_I][149:128];
    assign valid_in_cache_I = cache_r[index_I][150];
    assign dirty_in_cache_I = cache_r[index_I][151];
    assign which_in_cache_I = cache_r[index_I][152];

    assign index_D          = L2_addr[7:2];           
    assign tag_D            = L2_addr[29:8];
    assign tag_in_cache_D   = cache_r[index_D][149:128];
    assign valid_in_cache_D = cache_r[index_D][150];
    assign dirty_in_cache_D = cache_r[index_D][151];
    assign which_in_cache_D = cache_r[index_D][152];

    //output
    assign L2_ready_I   = L2_ready_I_w;
    assign L2_ready     = L2_ready_w;
    assign mem_read_I   = mem_read_I_r;
    assign mem_read_D   = mem_read_D_r;
    assign mem_write_D  = mem_write_D_r;
    assign mem_addr_I   = mem_addr_I_r;
    assign mem_addr_D   = mem_addr_D_r;
    assign mem_wdata_D  = mem_wdata_D_r;

//==== combinational circuit ==============================
    integer idx; //for cache update
    always@(*) begin
        //I_cache 
        I_state_w   = I_state_r;
        L2_ready_I_w= L2_ready_I_r;
        mem_read_I_w= mem_read_I_r;
        mem_addr_I_w= mem_addr_I_r;
        L2_rdata_I  = 32'd0;  
        //D cache
        D_state_w       = D_state_r;
        L2_ready_w      = L2_ready_r;
        mem_read_D_w    = mem_read_D_r;
        mem_addr_D_w    = mem_addr_D_r;
        mem_write_D_w   = mem_write_D_r;
        mem_wdata_D_w   = mem_wdata_D_r;
        L2_rdata        = 32'd0;

        for(idx = 0; idx <= 63; idx = idx+1) begin
             cache_w[idx] = cache_r[idx];
        end
        //I_cache
        case(I_state_r)
            IDLE_I:
            begin
                if(which_in_cache_I == 1'd0 && tag_I == tag_in_cache_I) begin 
                    if(valid_in_cache_I) begin //valid = read_hit
                        L2_ready_I_w = 1'd1;
                        case(L2_addr_I[1:0])
                            2'd3: L2_rdata_I = cache_r[index_I][127:96];
                            2'd2: L2_rdata_I = cache_r[index_I][95:64];
                            2'd1: L2_rdata_I = cache_r[index_I][63:32];
                            2'd0: L2_rdata_I = cache_r[index_I][31:0];
                            default: L2_rdata_I = 32'd0;
                        endcase
                    end
                    else begin
                        L2_ready_I_w = 1'd0;
                        if(index_D != index_I || L2_addr_I == 30'd0) begin //D_cache need write data
                            I_state_w    = READ_STALL_I;
                            mem_read_I_w = 1'd1;
                            mem_addr_I_w = L2_addr_I[29:2];
                            //update valid bit
                            cache_w[index_I][150] = 1'd1;
                        end
                    end
                end
                else begin
                    L2_ready_I_w = 1'd0;
                    if(dirty_in_cache_I) begin
                        if(D_state_r == IDLE) begin
                            I_state_w = READ_STALL_I;
                            mem_read_I_w = 1'd1;
                            mem_addr_I_w = L2_addr_I[29:2];
                            //update valid bit
                            cache_w[index_I][150] = 1'd1;
                        end
                    end
                    else if(index_D != index_I) begin
                        I_state_w = READ_STALL_I;
                        mem_read_I_w = 1'd1;
                        mem_addr_I_w = L2_addr_I[29:2];
                        //update valid bit
                        cache_w[index_I][150] = 1'd1;
                    end           
                end
            end
            READ_STALL_I:
            begin
                if(mem_ready_I) begin
                    I_state_w   = IDLE_I;
                    L2_ready_I_w= 1'd0;
                    mem_read_I_w= 1'd0;
                    mem_addr_I_w= 28'd0;
                    cache_w[index_I][149:128] = tag_I;
                    cache_w[index_I][127:0]   = mem_rdata_I;
                    cache_w[index_I][150]     = 1'd1;  //valid bit
                    cache_w[index_I][151]     = 1'd0;  //dirty bit
                    cache_w[index_I][152]     = 1'd0;  //which bit
                    // case(L2_addr_I[1:0])
                    //     2'd3: L2_rdata_I = mem_rdata_I[127:96];
                    //     2'd2: L2_rdata_I = mem_rdata_I[95:64];
                    //     2'd1: L2_rdata_I = mem_rdata_I[63:32];
                    //     2'd0: L2_rdata_I = mem_rdata_I[31:0];
                    //     default: L2_rdata_I = 32'd0;
                    // endcase 
                end
            end
        endcase
        //D_cache
        case(D_state_r) 
            IDLE:
            begin
                if(which_in_cache_D == 1'd1 && tag_D == tag_in_cache_D && valid_in_cache_D && L2_read) begin
                    L2_ready_w = 1'd1;                    
                    case(L2_addr[1:0])
                        2'd3: L2_rdata = cache_r[index_D][127:96];
                        2'd2: L2_rdata = cache_r[index_D][95:64];
                        2'd1: L2_rdata = cache_r[index_D][63:32];
                        2'd0: L2_rdata = cache_r[index_D][31:0];
                        default: L2_rdata = 32'd0;
                    endcase
                end
                if(I_state_r == IDLE_I && !((which_in_cache_I == 1'd0) && (tag_I == tag_in_cache_I)) && dirty_in_cache_I) begin
                    D_state_w       = WRITE_STALL_WRITE;
                    mem_addr_D_w    = {tag_in_cache_I, index_I};
                    mem_write_D_w   = 1'd1;
                    mem_wdata_D_w   = cache_r[index_I][127:0];
                end
                else if(which_in_cache_D == 1'd1 && tag_D == tag_in_cache_D) begin
                    if(valid_in_cache_D) begin
                        if(L2_write) begin
                            if(dirty_in_cache_D) begin
                                D_state_w       = WRITE_STALL_WRITE;
                                L2_ready_w      = 1'd0;
                                mem_write_D_w   = 1'd1;
                                mem_addr_D_w    = L2_addr[29:2]; 
                            end
                            else begin
                                L2_ready_w  = 1'd1;
                            end

                            case(L2_addr[1:0])
                                2'd3: cache_w[index_D][127:96]  = L2_wdata;
                                2'd2: cache_w[index_D][95:64]   = L2_wdata;
                                2'd1: cache_w[index_D][63:32]   = L2_wdata;
                                2'd0: cache_w[index_D][31:0]    = L2_wdata;
                                default:  cache_w[index_D] = 0;
                            endcase
                            mem_wdata_D_w =  cache_w[index_D][127:0];
                            cache_w[index_D][151] = 1'd1; 
                        end
                    end
                    else begin
                        if(L2_write || L2_read) begin
                            D_state_w   = READ_STALL;
                            L2_ready_w  = 1'd0;
                            mem_read_D_w= 1'd1;
                            mem_addr_D_w= L2_addr[29:2];
                            cache_w[index_D][150] = 1'd1; 
                        end
                    end
                end
                else begin
                    if(L2_read || L2_write) begin
                        if(dirty_in_cache_D) begin
                            D_state_w       = WRITE_STALL_WRITE;
                            mem_wdata_D_w   = cache_r[index_D][127:0];
                            mem_write_D_w   = 1'd1;
                            mem_addr_D_w    = {tag_in_cache_D, index_D};
                        end
                        else begin
                            D_state_w               = READ_STALL;
                            mem_read_D_w            = 1'd1;
                            mem_addr_D_w            = L2_addr[29:2];
                            cache_w[index_D][150]   = 1'd1;
                        end
                        L2_ready_w      = 1'd0; 
                    end
                end
            end
            READ_STALL:
            begin
                if(mem_ready_D) begin
                    D_state_w       = IDLE;
                    L2_ready_w      = 1'd0;
                    mem_read_D_w    = 1'd0;
                    mem_addr_D_w    = 28'd0;

                    cache_w[index_D][149:128]   = tag_D;
                    cache_w[index_D][127:0]     = mem_rdata_D;
                    cache_w[index_D][151]       = 1'd0;
                    cache_w[index_D][152]       = 1'd1;
                end
            end
            WRITE_STALL_WRITE:
            begin
                L2_ready_w = 1'd0;
                if(mem_ready_D) begin
                    D_state_w = IDLE;
                    mem_write_D_w         = 1'd0;
                    mem_addr_D_w          = 28'd0;
                    cache_w[index_D][151] = 1'd0;
                end
            end
        endcase
    end
//==== sequential circuit =================================
integer i;
always@( posedge clk ) begin
    if( proc_reset ) begin
        for(i = 0; i<=63; i = i+1) begin
            cache_r[i]  <= 153'd0;
        end
        I_state_r       <= 2'd0;
        D_state_r       <= 2'd0;
        L2_ready_I_r    <= 1'd0;
        L2_ready_r      <= 1'd0;
        mem_read_I_r    <= 1'd0;
        mem_read_D_r    <= 1'd0;
        mem_write_D_r   <= 1'd0;
        mem_addr_I_r    <= 28'd0;
        mem_addr_D_r    <= 28'd0;
        mem_wdata_D_r   <= 128'd0;

    end
    else begin
        for(i = 0; i<=63; i = i+1) begin
            cache_r[i]  <= cache_w[i];
        end
        I_state_r       <= I_state_w;
        D_state_r       <= D_state_w;
        L2_ready_I_r    <= L2_ready_I_w;
        L2_ready_r      <= L2_ready_w;
        mem_read_I_r    <= mem_read_I_w;
        mem_read_D_r    <= mem_read_D_w;
        mem_write_D_r   <= mem_write_D_w;
        mem_addr_I_r    <= mem_addr_I_w;
        mem_addr_D_r    <= mem_addr_D_w;
        mem_wdata_D_r   <= mem_wdata_D_w;
    end
end
endmodule