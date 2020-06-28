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
    localparam IDLE = 3'd0;
    localparam READ_STALL_CLEAN_L1 = 3'd1;
    localparam READ_STALL_CLEAN_L2 = 3'd5;
    localparam READ_STALL_DIRTY = 3'd2;
    localparam WRITE_STALL_READ_DIRTY = 3'd3;
    localparam WRITE_STALL_READ_CLEAN_L1 = 3'd4;
    localparam WRITE_STALL_READ_CLEAN_L2 = 3'd6;
//==== wire/reg definition ================================
    //state reg
    reg mem_ready_r;
    reg [2:0] state_r, state_w;
    //cache reg 8 x (25+ 32x4) = 8 x 153
    reg [153:0] cache_r[7:0] ,cache_w[7:0]; //format: v/tag/word3/word2/word1/word0
    reg [7:0] dirty_L1_r , dirty_L1_w;//write back
    //L2 cache                                     //        1/24/128
    reg [151:0] L2_cache_r[31:0], L2_cache_w[31:0];//format: v/tag/word3/word2/word1/word0

    reg [31:0] dirty_L2_r , dirty_L2_w;//write back

    wire [4:0] index_L2;
    wire [22:0] tag_in_L2_cache;
    wire [22:0] tag_for_L2;
    wire valid_in_L2;
    assign index_L2 = proc_addr[6:2];                       //4 bits 
    assign tag_in_L2_cache = L2_cache_r[index_L2][150:128]; //24 bits
    assign tag_for_L2 = proc_addr[29:7];                    //24 bits
    assign valid_in_L2 = L2_cache_r[index_L2][151];

    //output reg
    reg proc_stall_r, proc_stall_w;
    reg [31:0] proc_rdata; 

    reg mem_read_r, mem_read_w;
    reg mem_write_r, mem_write_w;
    reg [27:0] mem_addr_r, mem_addr_w;
    reg [127:0] mem_wdata_r, mem_wdata_w;
    //index tag wire
    wire [2:0] index;
    wire [24:0] tag, tag_in_cache;
    wire valid_in_cache;
    wire dirty_in_cache_L1;
    wire dirty_in_cache_L2;
//==== Assignment =========================================
    
    //assign tag data1 data2 data3 data4
    assign index            = proc_addr[4:2];
    assign tag              = proc_addr[29:5];
    assign tag_in_cache     = cache_r[index][152:128];
    assign valid_in_cache   = cache_r[index][153];
    //assign dirty bit
    assign dirty_in_cache_L1 = dirty_L1_r[index];
    assign dirty_in_cache_L2 = dirty_L2_r[index_L2];

    //output
    assign proc_stall   = proc_stall_w;
    assign mem_read     = mem_read_r;
    assign mem_write    = mem_write_r;
    assign mem_addr     = mem_addr_r;
    assign mem_wdata    = mem_wdata_r;

//==== combinational circuit ==============================
    integer idx, _index; //for cache update
    always@(*) begin 
        

        state_w         = state_r;
        proc_stall_w    = proc_stall_r;
        mem_read_w      = mem_read_r;
        mem_write_w     = mem_write_r;
        mem_addr_w      = mem_addr_r;
        mem_wdata_w     = mem_wdata_r;
        proc_rdata      = 32'd0;
        for(idx = 0; idx <= 7; idx = idx+1) begin
             cache_w[idx] = cache_r[idx];
        end
        for(_index=0; _index<=31; _index = _index+1) begin
            L2_cache_w[_index] = L2_cache_r[_index];
        end
        dirty_L1_w      = dirty_L1_r;//write back
        dirty_L2_w      = dirty_L2_r;//write back
        case(state_r)
        IDLE:
        begin
            if(proc_read) begin //read
                if(valid_in_cache) begin //valid
                    if(tag != tag_in_cache) begin //read L2
                        if(valid_in_L2) begin
                            if(tag_for_L2 != tag_in_L2_cache) begin //read miss//write back
                                if(dirty_in_cache_L2) begin
                                    if(L2_cache_r[index_L2][127:0] !=  cache_r[index][127:0]) $display("DIRTYL2READTAGWRONG");
                                    state_w         = READ_STALL_DIRTY;
                                    proc_stall_w    = 1'd1;
                                    mem_write_w     = 1'd1;
                                    mem_addr_w      = {L2_cache_r[index_L2][150:128],index_L2};
                                    mem_wdata_w     = L2_cache_r[index_L2][127:0];
                                end
                                else begin //not dirty in L2
                                    
                                    state_w         = READ_STALL_CLEAN_L1;
                                    proc_stall_w    = 1'd1;
                                    mem_read_w     = 1'd1;
                                    mem_addr_w      = proc_addr[29:2];
                                end
                            end
                            else begin //read hit//write back
                                case(proc_addr[1:0])
                                    2'd3: proc_rdata = L2_cache_r[index_L2][127:96]; //word0
                                    2'd2: proc_rdata = L2_cache_r[index_L2][95:64];  //word1 
                                    2'd1: proc_rdata = L2_cache_r[index_L2][63:32];  //word2
                                    2'd0: proc_rdata = L2_cache_r[index_L2][31:0];   //word3
                                    default: proc_rdata = 32'd0;
                                endcase
                            end
                        end
                        else begin //read miss //L2 cold cache
                            
                            state_w         = READ_STALL_CLEAN_L2;
                            proc_stall_w    = 1'd1;
                            mem_read_w      = 1'd1;
                            mem_addr_w      = proc_addr[29:2];
                            // L2 valid
                            L2_cache_w[index_L2][151] = 1'd1;
                        end                
                    end
                    else begin //read hit by L1

                        state_w = IDLE;
                        case(proc_addr[1:0])
                            2'd3: proc_rdata = cache_r[index][127:96]; //word0
                            2'd2: proc_rdata = cache_r[index][95:64];  //word1 
                            2'd1: proc_rdata = cache_r[index][63:32];  //word2
                            2'd0: proc_rdata = cache_r[index][31:0];   //word3
                            default: proc_rdata = 32'd0;
                        endcase
                    end 
                    
                end
                else begin //not valid -> read miss
                    
                    state_w         = READ_STALL_CLEAN_L1;
                    proc_stall_w    = 1'd1;
                    mem_read_w      = 1'd1;
                    mem_addr_w      = proc_addr[29:2];
                    //update valid bit
                    cache_w[index][153] = 1'd1;
                    L2_cache_w[index_L2][151] = 1'd1;    
                end           
            end
            if(proc_write) begin //write
                if(valid_in_cache) begin
                    if(tag != tag_in_cache) begin 
                        if(valid_in_L2) begin
                            if(tag_for_L2 != tag_in_L2_cache) begin  //write miss
                                if(dirty_in_cache_L2) begin
                                    
                                    state_w         = WRITE_STALL_READ_DIRTY;
                                    proc_stall_w    = 1'd1;
                                    mem_write_w     = 1'd1;
                                    mem_addr_w      = {L2_cache_r[index_L2][150:128],index_L2};
                                    mem_wdata_w     = L2_cache_r[index_L2][127:0];
                                end
                                else begin//not dirty in L2
                                    
                                    state_w         = WRITE_STALL_READ_CLEAN_L1;
                                    proc_stall_w    = 1'd1;
                                    mem_read_w      = 1'd1;
                                    mem_addr_w      = proc_addr[29:2];
                                end
                            end
                            else begin //write L2 cache hit
                                state_w = IDLE;
                                //update data in L2 cache
                                case(proc_addr[1:0])
                                    2'd3: L2_cache_w[index_L2][127:96]= proc_wdata;
                                    2'd2: L2_cache_w[index_L2][95:64] = proc_wdata; 
                                    2'd1: L2_cache_w[index_L2][63:32] = proc_wdata;
                                    2'd0: L2_cache_w[index_L2][31:0]  = proc_wdata;
                                    default: L2_cache_w[index_L2]     = L2_cache_r[index_L2];
                                endcase
                                //signal to change
                                
                                dirty_L2_w[index_L2] = 1'b1;
                                if({tag_in_L2_cache,proc_addr[6],proc_addr[5]} == tag_in_cache) begin
                                    dirty_L1_w[index] = 1'b1;
                                    case(proc_addr[1:0])
                                        2'd3: cache_w[index][127:96]= proc_wdata;
                                        2'd2: cache_w[index][95:64] = proc_wdata; 
                                        2'd1: cache_w[index][63:32] = proc_wdata;
                                        2'd0: cache_w[index][31:0]  = proc_wdata;
                                        default: cache_w[index]     = cache_r[index];
                                    endcase
                                end
                            end      
                        end
                        else begin
                            state_w = WRITE_STALL_READ_CLEAN_L2;
                            proc_stall_w    = 1'd1;
                            mem_read_w      = 1'd1;
                            mem_addr_w      = proc_addr[29:2];  
                            //L2 cache
                            L2_cache_w[index_L2][151] = 1'd1;
                        end
                    end
                    else begin //write hit for 

                        
                        state_w = IDLE;
                        //update data in cache
                        dirty_L1_w[index] = 1'b1;
                        case(proc_addr[1:0])
                            2'd3: cache_w[index][127:96]= proc_wdata;
                            2'd2: cache_w[index][95:64] = proc_wdata; 
                            2'd1: cache_w[index][63:32] = proc_wdata;
                            2'd0: cache_w[index][31:0]  = proc_wdata;
                            default: cache_w[index]     = cache_r[index];
                        endcase
                        //update data in L2-cache
                        dirty_L2_w[index_L2] = 1'b1;
                        case(proc_addr[1:0])
                            2'd3: L2_cache_w[index_L2][127:96]= proc_wdata;
                            2'd2: L2_cache_w[index_L2][95:64] = proc_wdata; 
                            2'd1: L2_cache_w[index_L2][63:32] = proc_wdata;
                            2'd0: L2_cache_w[index_L2][31:0]  = proc_wdata;
                            default: L2_cache_w[index_L2]     = L2_cache_r[index_L2];
                        endcase
                        //signal to change
                        
                    
                    end
                end
                else begin //not valid -> write miss
                    state_w = WRITE_STALL_READ_CLEAN_L1;
                    proc_stall_w    = 1'd1;
                    mem_read_w      = 1'd1;
                    mem_addr_w      = proc_addr[29:2];
                    //update valid bit
                    cache_w[index][153] = 1'd1;
                    L2_cache_w[index_L2][151] = 1'd1;
                end  
            end
            
            
        end
        READ_STALL_DIRTY:
        begin
            if(mem_ready) begin
                state_w                 = READ_STALL_CLEAN_L1;
                
                mem_write_w             = 1'b0;
                mem_read_w              = 1'd1;
                mem_addr_w              = proc_addr[29:2];
                dirty_L1_w[index]       = 1'b0;//write back
                dirty_L2_w[index_L2]    = 1'b0;//write back
                
                //read data output
            end
        end
        READ_STALL_CLEAN_L1:
        begin
            if(mem_ready) begin
                state_w                 = IDLE;
                proc_stall_w            = 1'd0;
                mem_read_w              = 1'd0;
                mem_addr_w              = 28'd0;

                cache_w[index][152:128] = tag;      //update tag
                cache_w[index][127:0]   = mem_rdata;//update data
                
                //for L2
                L2_cache_w[index_L2][150:128]   = tag_for_L2;
                L2_cache_w[index_L2][127:0]     = mem_rdata;
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
        READ_STALL_CLEAN_L2:
        begin
            if(mem_ready) begin
                state_w                 = IDLE;
                proc_stall_w            = 1'd0;
                mem_read_w              = 1'd0;
                mem_addr_w              = 28'd0;
                
                //for L2
                L2_cache_w[index_L2][150:128]   = tag_for_L2;
                L2_cache_w[index_L2][127:0]     = mem_rdata;
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
        WRITE_STALL_READ_DIRTY:
        begin
            if(mem_ready) begin
                state_w                 = WRITE_STALL_READ_CLEAN_L1;
                mem_read_w              = 1'b1;
                
                mem_write_w             = 1'b0;
                mem_addr_w              = proc_addr[29:2];
                dirty_L2_w[index_L2]    = 1'b0;
                dirty_L1_w[index]       = 1'b0;
            end
        end
        WRITE_STALL_READ_CLEAN_L1:
        begin
            if(mem_ready) begin
                state_w = IDLE;
                //updata data in cache
                cache_w[index][152:128] = tag;      //update tag
                cache_w[index][127:0]   = mem_rdata;  //updata data
                //for L2
                L2_cache_w[index_L2][150:128] = tag_for_L2;
                L2_cache_w[index_L2][127:0] = mem_rdata; 

                //write hit
                dirty_L1_w[index]               = 1'b1;
                case(proc_addr[1:0])
                    2'd3: cache_w[index][127:96]= proc_wdata;
                    2'd2: cache_w[index][95:64] = proc_wdata; 
                    2'd1: cache_w[index][63:32] = proc_wdata;
                    2'd0: cache_w[index][31:0]  = proc_wdata;
                    default: cache_w[index]     = cache_r[index];
                endcase
                //write hit L2
                dirty_L2_w[index_L2]               = 1'b1;
                case(proc_addr[1:0])
                    2'd3: L2_cache_w[index_L2][127:96]= proc_wdata;
                    2'd2: L2_cache_w[index_L2][95:64] = proc_wdata; 
                    2'd1: L2_cache_w[index_L2][63:32] = proc_wdata;
                    2'd0: L2_cache_w[index_L2][31:0]  = proc_wdata;
                    default: L2_cache_w[index_L2]     = L2_cache_r[index_L2];
                endcase

                //signal to change
                proc_stall_w = 1'd0;
                mem_read_w = 1'd0;
                mem_write_w = 1'd0;


            end
        end
        WRITE_STALL_READ_CLEAN_L2:
        begin
            if(mem_ready) begin
                state_w = IDLE;
                //updata data in cache
                // cache_w[index][152:128] = tag;      //update tag
                // cache_w[index][127:0]   = mem_rdata;  //updata data
                //for L2
                L2_cache_w[index_L2][150:128] = tag_for_L2;
                L2_cache_w[index_L2][127:0] = mem_rdata; 

                //write hit
                // dirty_L1_w[index]               = 1'b1;
                // case(proc_addr[1:0])
                //     2'd3: cache_w[index][127:96]= proc_wdata;
                //     2'd2: cache_w[index][95:64] = proc_wdata; 
                //     2'd1: cache_w[index][63:32] = proc_wdata;
                //     2'd0: cache_w[index][31:0]  = proc_wdata;
                //     default: cache_w[index]     = cache_r[index];
                // endcase
                //write hit L2
                dirty_L2_w[index_L2]               = 1'b1;
                case(proc_addr[1:0])
                    2'd3: L2_cache_w[index_L2][127:96]= proc_wdata;
                    2'd2: L2_cache_w[index_L2][95:64] = proc_wdata; 
                    2'd1: L2_cache_w[index_L2][63:32] = proc_wdata;
                    2'd0: L2_cache_w[index_L2][31:0]  = proc_wdata;
                    default: L2_cache_w[index_L2]     = L2_cache_r[index_L2];
                endcase

                //signal to change
                proc_stall_w = 1'd0;
                mem_read_w = 1'd0;
                mem_write_w = 1'd0;


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
            dirty_L1_w      = dirty_L1_r;//write back
            dirty_L2_w      = dirty_L2_r;//write back
            for(idx = 0; idx <= 7; idx = idx+1) begin
                 cache_w[idx] = cache_r[idx];
            end
            for(_index = 0; _index <= 31; _index = _index+1) begin
                L2_cache_w[_index] = L2_cache_r[_index];
            end
        end
        endcase
    end
//==== sequential circuit =================================
integer i, j ;
always@( posedge clk ) begin
    if( proc_reset ) begin
        for(i = 0; i<=7; i = i+1) begin
            cache_r[i]  <= 154'd0;
        end
        for(j= 0; j <= 31; j = j+1) begin
            L2_cache_r[j] = 152'd0;
        end
        state_r         <= 3'd0;
        proc_stall_r    <= 1'd0;
        mem_read_r      <= 1'd0;
        mem_write_r     <= 1'd0;
        mem_addr_r      <= 28'd0;
        mem_wdata_r     <= 128'd0;
        dirty_L1_r      <= 8'd0;
        dirty_L2_r      <= 32'd0;
        //mem_ready_r     <= 1'b0;
    end
    else begin
        for(i = 0; i<=7; i = i+1) begin
            cache_r[i]  <= cache_w[i];
        end
        for(j= 0; j <= 31; j = j+1) begin
            L2_cache_r[j] = L2_cache_w[j];
        end
        state_r         <= state_w;
        proc_stall_r    <= proc_stall_w;
        mem_read_r      <= mem_read_w;
        mem_write_r     <= mem_write_w;
        mem_addr_r      <= mem_addr_w;
        mem_wdata_r     <= mem_wdata_w;
        dirty_L1_r      <= dirty_L1_w;
        dirty_L2_r      <= dirty_L2_w;
        //mem_ready_r     <= mem_ready;
    end
end
endmodule