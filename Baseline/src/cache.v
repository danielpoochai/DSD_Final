module cache(
    clk,
    proc_reset,
    proc_read,
    proc_write,
    proc_addr,
    proc_rdata,
    proc_wdata,
    proc_stall,
    mem_read,
    mem_write,
    mem_addr,
    mem_rdata,
    mem_wdata,
    mem_ready
);
    
//==== input/output definition ============================
    input          clk;
    // processor interface
    input          proc_reset;
    input          proc_read, proc_write;
    input   [29:0] proc_addr;
    input   [31:0] proc_wdata;
    output         proc_stall;
    output  [31:0] proc_rdata;
    // memory interface
    input  [127:0] mem_rdata;
    input          mem_ready;
    output         mem_read, mem_write;
    output  [27:0] mem_addr;
    output [127:0] mem_wdata;
//====parameters   ========================================
    localparam IDLE = 2'd0;
    localparam READ_STALL = 2'd1;
    localparam WRITE_STALL_READ = 2'd2;
    localparam WRITE_STALL_WRITE = 2'd3;
//==== wire/reg definition ================================
    //state reg
    reg [1:0] state_r, state_w;
    //cache reg (1+1+26+32x4) x2
    reg [311:0] cache_r[0:3] ,cache_w[0:3]; //format: v/LRU/tag/word3/word2/word1/word0 v/LRU/tag/word3/word2/word1/word0 
    //output reg
    reg proc_stall_r, proc_stall_w;
    reg [31:0] proc_rdata; 

    reg mem_read_r, mem_read_w;
    reg mem_write_r, mem_write_w;
    reg [27:0] mem_addr_r, mem_addr_w;
    reg [127:0] mem_wdata_r, mem_wdata_w;
    //index tag wire
    wire [1:0] index; //0 1 2 3
    wire [25:0] tag, tag_in_cache_1, tag_in_cache_2; //26bits
    wire valid_in_cache_1, valid_in_cache_2;
    wire LRU_1, LRU_2; //Least Recently Used check
    wire hit_1, hit_2; //check which block in the set is hit

//==== Assignment =========================================
    //assign tag data1 data2 data3 data4
    assign index            = proc_addr[3:2];
    assign tag              = proc_addr[29:4];
    assign tag_in_cache_1   = cache_r[index][309:284];
    assign tag_in_cache_2   = cache_r[index][153:128];
    assign valid_in_cache_1 = cache_r[index][311];
    assign valid_in_cache_2 = cache_r[index][155];
    assign LRU_1            = cache_r[index][310];
    assign LRU_2            = cache_r[index][154];
    assign hit_1            = (tag == tag_in_cache_1) && valid_in_cache_1;
    assign hit_2            = (tag == tag_in_cache_2) && valid_in_cache_2;
    //output
    assign proc_stall   = proc_stall_w;
    assign mem_read     = mem_read_r;
    assign mem_write    = mem_write_r;
    assign mem_addr     = mem_addr_r;
    assign mem_wdata    = mem_wdata_r;

//==== combinational circuit ==============================
    integer idx; //for cache update
    always@(*) begin 
        state_w         = state_r;
        proc_stall_w    = proc_stall_r;
        mem_read_w      = mem_read_r;
        mem_write_w     = mem_write_r;
        mem_addr_w      = mem_addr_r;
        mem_wdata_w     = mem_wdata_r;
        proc_rdata      = 32'd0;
        for(idx = 0; idx <= 3; idx = idx+1) begin
             cache_w[idx] = cache_r[idx];
        end

        case(state_r)
        IDLE:
        begin
            if(proc_read) begin //read
                if(hit_1) begin //read hit 1
                    case(proc_addr[1:0])
                        2'd3: proc_rdata = cache_r[index][283:252]; //word0
                        2'd2: proc_rdata = cache_r[index][251:220];  //word1 
                        2'd1: proc_rdata = cache_r[index][219:188];  //word2
                        2'd0: proc_rdata = cache_r[index][187:156];   //word3
                        default: proc_rdata = 32'd0;
                    endcase
                end
                else if(hit_2) begin //read hit 2
                    case(proc_addr[1:0])
                        2'd3: proc_rdata = cache_r[index][127:96]; //word0
                        2'd2: proc_rdata = cache_r[index][95:64];  //word1 
                        2'd1: proc_rdata = cache_r[index][63:32];  //word2
                        2'd0: proc_rdata = cache_r[index][31:0];   //word3
                        default: proc_rdata = 32'd0;
                    endcase
                end
                else begin //read miss
                    state_w         = READ_STALL;
                    proc_stall_w    = 1'd1;
                    mem_read_w      = 1'd1;
                    mem_addr_w      = proc_addr[29:2];
                end
            end

            if(proc_write) begin //write "write through"
                if(hit_1) begin //write hit 1 
                    state_w = WRITE_STALL_WRITE;
                    //update block 1 data in cache
                    case(proc_addr[1:0])
                        2'd3: cache_w[index][283:252]= proc_wdata;
                        2'd2: cache_w[index][251:220] = proc_wdata; 
                        2'd1: cache_w[index][219:188] = proc_wdata;
                        2'd0: cache_w[index][187:156]  = proc_wdata;
                        default: cache_w[index]     = cache_r[index];
                    endcase
                    //signal to change
                    proc_stall_w        = 1'd1;
                    mem_write_w         = 1'd1;
                    mem_addr_w          = proc_addr[29:2];
                    mem_wdata_w         = cache_w[index][283:156];
                    //update LRU bit
                    cache_w[index][310] = 1'd1;
                    cache_w[index][154] = 1'd0;
                end
                else if (hit_2) begin //write hit 2
                    state_w = WRITE_STALL_WRITE;
                    //update data in cache
                    case(proc_addr[1:0])
                        2'd3: cache_w[index][127:96]= proc_wdata;
                        2'd2: cache_w[index][95:64] = proc_wdata; 
                        2'd1: cache_w[index][63:32] = proc_wdata;
                        2'd0: cache_w[index][31:0]  = proc_wdata;
                        default: cache_w[index]     = cache_r[index];
                    endcase
                    //signal to change
                    proc_stall_w    = 1'd1;
                    mem_write_w     = 1'd1;
                    mem_addr_w      = proc_addr[29:2];
                    mem_wdata_w     = cache_w[index][127:0];
                    //update LRU bit
                    cache_w[index][310] = 1'd0;
                    cache_w[index][154] = 1'd1;
                end
                else begin //write miss
                    state_w = WRITE_STALL_READ;
                    proc_stall_w    = 1'd1;
                    mem_read_w      = 1'd1;
                    mem_addr_w      = proc_addr[29:2];
                end 
            end
        end
        READ_STALL:
        begin
            if(mem_ready) begin
                state_w                 = IDLE;
                proc_stall_w            = 1'd0;
                mem_read_w              = 1'd0;
                mem_addr_w              = 28'd0;
                //update valid and LRU bit
                if(valid_in_cache_1) begin 
                    if(~(valid_in_cache_2)) begin               //block 2 is empty
                        cache_w[index][155]     = 1'd1;         //update valid bit
                        cache_w[index][153:128] = tag;          //update tag
                        cache_w[index][127:0]   = mem_rdata;    //update data
                        cache_w[index][154]     = 1'd1;         //trigger up LRU_2 bit
                        cache_w[index][310]     = 1'd0;         //trigger down LRU_1 bit
                    end
                    else begin //both block are valid
                        if(cache_r[index][310]) begin //block_1 is recently used -> so update block_2
                            cache_w[index][153:128] = tag;
                            cache_w[index][127:0]   = mem_rdata;
                            cache_w[index][154]     = 1'd1;
                            cache_w[index][310]     = 1'd0;
                        end
                        else begin //block_2 is recently used -> update block_1
                            cache_w[index][309:284] = tag;
                            cache_w[index][283:156] = mem_rdata;
                            cache_w[index][310]     = 1'd1;
                            cache_w[index][154]     = 1'd0;
                        end
                    end
                end
                else begin //block 1 is empty -> update block 1
                    cache_w[index][311]     = 1'd1;     //update valid bit
                    cache_w[index][309:284] = tag;
                    cache_w[index][283:156] = mem_rdata;
                    cache_w[index][310]     = 1'd1;     //update LRU_1
                    cache_w[index][154]     = 1'd0;     //update LRU_2 
                end

                //read data output
                case(proc_addr[1:0])
                    2'd3: proc_rdata = mem_rdata[127:96]; //word0
                    2'd2: proc_rdata = mem_rdata[95:64];  //word1 
                    2'd1: proc_rdata = mem_rdata[63:32];  //word2
                    2'd0: proc_rdata = mem_rdata[31:0];   //word3
                    default: proc_rdata = 32'd0;
                endcase
            end
        end
        WRITE_STALL_READ: //when write miss
        begin
            if(mem_ready) begin
                state_w = WRITE_STALL_WRITE;
                //updata data in cache
                if(valid_in_cache_1) begin
                    if(~(valid_in_cache_2)) begin //block 2 is empty -> update block2
                        cache_w[index][155]     = 1'd1;
                        cache_w[index][153:128] = tag;
                        cache_w[index][127:0]   = mem_rdata;
                        cache_w[index][154]     = 1'd1;
                        cache_w[index][310]     = 1'd0;
                    end
                    else begin //both blocks are valid
                        if(cache_r[index][310]) begin //block 1 is recently used -> update block 2
                            cache_w[index][153:128] = tag;
                            cache_w[index][127:0]   = mem_rdata;
                            cache_w[index][154]     = 1'd1;
                            cache_w[index][310]     = 1'd0;
                        end
                        else begin //update block 1
                            cache_w[index][309:284] = tag;
                            cache_w[index][283:156] = mem_rdata;
                            cache_w[index][154]     = 1'd0;
                            cache_w[index][310]     = 1'd1;
                        end 
                    end
                end
                else begin //block 1 is empty -> update block 1
                    cache_w[index][311]     = 1'd1;
                    cache_w[index][309:284] = tag;
                    cache_w[index][283:156] = mem_rdata;
                    cache_w[index][154]     = 1'd0;
                    cache_w[index][310]     = 1'd1;
                end
                //write hit
                case(proc_addr[1:0])
                    2'd3: 
                    begin
                        if(valid_in_cache_1) begin
                            if(~(valid_in_cache_2)) begin //update block 2
                                cache_w[index][127:96]= proc_wdata;
                                mem_wdata_w = cache_w[index][127:0];     
                            end
                            else begin //update block 2
                                if(cache_r[index][310]) begin
                                    cache_w[index][127:96] = proc_wdata;
                                    mem_wdata_w = cache_w[index][127:0];
                                end
                                else begin //update block 1
                                    cache_w[index][283:252] = proc_wdata;
                                    mem_wdata_w = cache_w[index][283:156];
                                end               
                            end
                        end 
                        else begin  //update block 1
                            cache_w[index][283:252] = proc_wdata; 
                            mem_wdata_w = cache_w[index][283:156];  
                        end                      
                    end
                    2'd2: 
                    begin
                        if(valid_in_cache_1) begin
                            if(~(valid_in_cache_2)) begin //update block 2
                                cache_w[index][95:64]= proc_wdata;
                                mem_wdata_w = cache_w[index][127:0];          
                            end
                            else begin
                                if(cache_r[index][310]) begin //update block 2
                                    cache_w[index][95:64] = proc_wdata;
                                    mem_wdata_w = cache_w[index][127:0];     
                                end
                                else begin //update block 1
                                    cache_w[index][251:220] = proc_wdata; 
                                    mem_wdata_w = cache_w[index][283:156];                 
                                end
                            end
                        end 
                        else begin  //update block 1
                            cache_w[index][251:220] = proc_wdata;
                            mem_wdata_w = cache_w[index][283:156];    
                        end                     
                    end 
                    2'd1: 
                    begin
                        if(valid_in_cache_1) begin //update block 2
                            if(~(valid_in_cache_2)) begin 
                                cache_w[index][63:32]= proc_wdata;
                                mem_wdata_w = cache_w[index][127:0];     
                            end
                            else begin
                                if(cache_r[index][310]) begin //update block 2
                                    cache_w[index][63:32] = proc_wdata;
                                    mem_wdata_w = cache_w[index][127:0];
                                end
                                else begin //update block 1
                                    cache_w[index][219:188] = proc_wdata;
                                    mem_wdata_w = cache_w[index][283:156];                 
                                end
                            end
                        end
                        else begin //update block 1
                            cache_w[index][219:188] = proc_wdata;
                            mem_wdata_w = cache_w[index][283:156];
                        end                         
                    end
                    2'd0:
                    begin
                        if(valid_in_cache_1) begin
                            if(~(valid_in_cache_2)) begin //update block 2
                                cache_w[index][31:0]= proc_wdata; 
                                mem_wdata_w = cache_w[index][127:0];    
                            end
                            else begin
                                if(cache_r[index][310]) begin //update block 2
                                    cache_w[index][31:0] = proc_wdata;
                                    mem_wdata_w = cache_w[index][127:0];
                                end
                                else begin //update block 1
                                    cache_w[index][187:156] = proc_wdata; 
                                    mem_wdata_w = cache_w[index][283:156];                 
                                end
                            end
                        end
                        else begin //update block 1 
                            cache_w[index][187:156] = proc_wdata;
                            mem_wdata_w = cache_w[index][283:156]; 
                        end                         
                    end
                    default: cache_w[index] = cache_r[index];
                endcase
                //signal to change
                proc_stall_w = 1'd1;
                mem_read_w = 1'd0;
                mem_write_w = 1'd1;
                mem_addr_w = proc_addr[29:2];
            end
        end
        WRITE_STALL_WRITE: 
        begin
            if(mem_ready) begin
                state_w         = IDLE;
                proc_stall_w    = 1'd0;
                mem_write_w     = 1'd0;
                mem_addr_w      = 28'd0;
            end
        end
        default:
        begin
            state_w         = state_r;
            proc_stall_w    = proc_stall_r;
            mem_read_w      = mem_read_r;
            mem_write_w     = mem_write_r;
            mem_addr_w      = mem_addr_r;
            mem_wdata_w     = mem_wdata_r;
            for(idx = 0; idx <= 3; idx = idx+1) begin
                 cache_w[idx] = cache_r[idx];
            end
        end
        endcase
    end
//==== sequential circuit =================================
integer i;
always@( posedge clk ) begin
    if( proc_reset ) begin
        for(i = 0; i<=3; i = i+1) begin
            cache_r[i]  <= 312'd0;
        end
        state_r         <= 2'd0;
        proc_stall_r    <= 1'd0;
        mem_read_r      <= 1'd0;
        mem_write_r     <= 1'd0;
        mem_addr_r      <= 28'd0;
        mem_wdata_r     <= 128'd0;
    end
    else begin
        for(i = 0; i<=3; i = i+1) begin
            cache_r[i]  <= cache_w[i];
        end
        state_r         <= state_w;
        proc_stall_r    <= proc_stall_w;
        mem_read_r      <= mem_read_w;
        mem_write_r     <= mem_write_w;
        mem_addr_r      <= mem_addr_w;
        mem_wdata_r     <= mem_wdata_w;
    end
end
endmodule