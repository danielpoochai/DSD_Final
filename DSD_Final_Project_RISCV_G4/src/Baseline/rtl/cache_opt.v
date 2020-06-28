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
    output   reg   mem_read;
    output   reg   mem_write;
    output   reg  [27:0] mem_addr;
    output   reg  [127:0] mem_wdata;
//====parameters   ========================================
    localparam IDLE             = 2'd0;
    localparam READ_STALL       = 2'd1;
    localparam WRITE_STALL_WRITE = 2'd2;
//==== wire/reg definition ================================
    //state reg
    reg [1:0] state_r, state_w;
    //cache reg 8 x (25+ 32x4) = 8 x 153 
    reg [154:0] cache_r[0:7] ,cache_w[0:7]; //format: dirty/v/tag/word3/word2/word1/word0
    //output reg
    reg proc_stall_r, proc_stall_w;
    reg [31:0] proc_rdata; 

    //index reg
    reg [2:0] index_r, index_w;
    //index tag wire                                     //can be spare for area 
    wire [2:0] index;
    wire [24:0] tag, tag_in_cache;
    wire valid_in_cache, dirty_in_cache;

//==== Assignment =========================================
    //assign tag data1 data2 data3 data4                //can be spare for area
    assign index            = proc_addr[4:2];           
    assign tag              = proc_addr[29:5];
    assign tag_in_cache     = cache_r[index][152:128];
    assign valid_in_cache   = cache_r[index][153];
    assign dirty_in_cache   = cache_r[index][154];
    //output
    assign proc_stall   = proc_stall_w;

//==== combinational circuit ==============================
    integer idx; //for cache update
    always@(*) begin 
        state_w         = state_r;
        proc_stall_w    = proc_stall_r;
        mem_read        = 0;
        mem_write       = 0;
        mem_addr        = 0;
        mem_wdata       = 0;
        index_w         = index_r;
        proc_rdata      = 32'd0;
        for(idx = 0; idx <= 7; idx = idx+1) begin
             cache_w[idx] = cache_r[idx];
        end

        case(state_r) 
            IDLE:
            begin
                index_w = index;
                if(tag == tag_in_cache && valid_in_cache) begin //25 bits 
                    if(proc_read) begin  // read hit
                        proc_stall_w = 1'd0;
                        case(index_w) //index
                            3'd0:
                            begin
                                case(proc_addr[1:0]) 
                                    2'd3: proc_rdata = cache_r[0][127:96]; //word0
                                    2'd2: proc_rdata = cache_r[0][95:64];  //word1 
                                    2'd1: proc_rdata = cache_r[0][63:32];  //word2
                                    2'd0: proc_rdata = cache_r[0][31:0];   //word3
                                    default: proc_rdata = 32'd0;
                                endcase
                            end
                            3'd1:
                            begin
                                case(proc_addr[1:0]) 
                                    2'd3: proc_rdata = cache_r[1][127:96]; //word0
                                    2'd2: proc_rdata = cache_r[1][95:64];  //word1 
                                    2'd1: proc_rdata = cache_r[1][63:32];  //word2
                                    2'd0: proc_rdata = cache_r[1][31:0];   //word3
                                    default: proc_rdata = 32'd0;
                                endcase
                            end
                            3'd2:
                            begin
                                case(proc_addr[1:0]) 
                                    2'd3: proc_rdata = cache_r[2][127:96]; //word0
                                    2'd2: proc_rdata = cache_r[2][95:64];  //word1 
                                    2'd1: proc_rdata = cache_r[2][63:32];  //word2
                                    2'd0: proc_rdata = cache_r[2][31:0];   //word3
                                    default: proc_rdata = 32'd0;
                                endcase
                            end
                            3'd3:
                            begin
                                case(proc_addr[1:0]) 
                                    2'd3: proc_rdata = cache_r[3][127:96]; //word0
                                    2'd2: proc_rdata = cache_r[3][95:64];  //word1 
                                    2'd1: proc_rdata = cache_r[3][63:32];  //word2
                                    2'd0: proc_rdata = cache_r[3][31:0];   //word3
                                    default: proc_rdata = 32'd0;
                                endcase
                            end
                            3'd4:
                            begin
                                case(proc_addr[1:0]) 
                                    2'd3: proc_rdata = cache_r[4][127:96]; //word0
                                    2'd2: proc_rdata = cache_r[4][95:64];  //word1 
                                    2'd1: proc_rdata = cache_r[4][63:32];  //word2
                                    2'd0: proc_rdata = cache_r[4][31:0];   //word3
                                    default: proc_rdata = 32'd0;
                                endcase
                            end
                            3'd5:
                            begin
                                case(proc_addr[1:0]) 
                                    2'd3: proc_rdata = cache_r[5][127:96]; //word0
                                    2'd2: proc_rdata = cache_r[5][95:64];  //word1 
                                    2'd1: proc_rdata = cache_r[5][63:32];  //word2
                                    2'd0: proc_rdata = cache_r[5][31:0];   //word3
                                    default: proc_rdata = 32'd0;
                                endcase
                            end
                            3'd6:
                            begin
                                case(proc_addr[1:0]) 
                                    2'd3: proc_rdata = cache_r[6][127:96]; //word0
                                    2'd2: proc_rdata = cache_r[6][95:64];  //word1 
                                    2'd1: proc_rdata = cache_r[6][63:32];  //word2
                                    2'd0: proc_rdata = cache_r[6][31:0];   //word3
                                    default: proc_rdata = 32'd0;
                                endcase
                            end
                            3'd7:
                            begin
                                case(proc_addr[1:0]) 
                                    2'd3: proc_rdata = cache_r[7][127:96]; //word0
                                    2'd2: proc_rdata = cache_r[7][95:64];  //word1 
                                    2'd1: proc_rdata = cache_r[7][63:32];  //word2
                                    2'd0: proc_rdata = cache_r[7][31:0];   //word3
                                    default: proc_rdata = 32'd0;
                                endcase
                            end
                            default:
                            begin
                                proc_rdata = 32'd0;
                            end //3 bits mux
                        endcase
                    end
                    else if(proc_write) begin //write hit
                        if(dirty_in_cache) begin
                            state_w     = WRITE_STALL_WRITE;
                            proc_stall_w= 1'd1;
                            mem_write   = 1'd1;
                            mem_addr    = proc_addr[29:2];
                        end      
                        else begin
                            proc_stall_w= 1'd0;
                        end
                        //update data in cache
                        case(index_w) //index
                            3'd0:
                            begin
                                case(proc_addr[1:0])
                                    2'd3: cache_w[0][127:96]= proc_wdata;
                                    2'd2: cache_w[0][95:64] = proc_wdata; 
                                    2'd1: cache_w[0][63:32] = proc_wdata;
                                    2'd0: cache_w[0][31:0]  = proc_wdata;
                                    default: cache_w[0]     = cache_r[0];
                                endcase
                                mem_wdata     = cache_w[0][127:0];
                                cache_w[0][154] = 1'd1;
                            end
                            3'd1:
                            begin
                                case(proc_addr[1:0])
                                    2'd3: cache_w[1][127:96]= proc_wdata;
                                    2'd2: cache_w[1][95:64] = proc_wdata; 
                                    2'd1: cache_w[1][63:32] = proc_wdata;
                                    2'd0: cache_w[1][31:0]  = proc_wdata;
                                    default: cache_w[1]     = cache_r[1];
                                endcase
                                mem_wdata    = cache_w[1][127:0];
                                cache_w[1][154] = 1'd1;
                            end
                            3'd2:
                            begin
                                case(proc_addr[1:0])
                                    2'd3: cache_w[2][127:96]= proc_wdata;
                                    2'd2: cache_w[2][95:64] = proc_wdata; 
                                    2'd1: cache_w[2][63:32] = proc_wdata;
                                    2'd0: cache_w[2][31:0]  = proc_wdata;
                                    default: cache_w[2]     = cache_r[2];
                                endcase
                                mem_wdata     = cache_w[2][127:0];
                                cache_w[2][154] = 1'd1;
                            end
                            3'd3:
                            begin
                                case(proc_addr[1:0])
                                    2'd3: cache_w[3][127:96]= proc_wdata;
                                    2'd2: cache_w[3][95:64] = proc_wdata; 
                                    2'd1: cache_w[3][63:32] = proc_wdata;
                                    2'd0: cache_w[3][31:0]  = proc_wdata;
                                    default: cache_w[3]     = cache_r[3];
                                endcase
                                mem_wdata     = cache_w[3][127:0];
                                cache_w[3][154] = 1'd1;
                            end
                            3'd4:
                            begin
                                case(proc_addr[1:0])
                                    2'd3: cache_w[4][127:96]= proc_wdata;
                                    2'd2: cache_w[4][95:64] = proc_wdata; 
                                    2'd1: cache_w[4][63:32] = proc_wdata;
                                    2'd0: cache_w[4][31:0]  = proc_wdata;
                                    default: cache_w[4]     = cache_r[4];
                                endcase
                                mem_wdata     = cache_w[4][127:0];
                                cache_w[4][154] = 1'd1;
                            end
                            3'd5:
                            begin
                                case(proc_addr[1:0])
                                    2'd3: cache_w[5][127:96]= proc_wdata;
                                    2'd2: cache_w[5][95:64] = proc_wdata; 
                                    2'd1: cache_w[5][63:32] = proc_wdata;
                                    2'd0: cache_w[5][31:0]  = proc_wdata;
                                    default: cache_w[5]     = cache_r[5];
                                endcase
                                mem_wdata     = cache_w[5][127:0];
                                cache_w[5][154] = 1'd1;
                            end
                            3'd6:
                            begin
                                case(proc_addr[1:0])
                                    2'd3: cache_w[6][127:96]= proc_wdata;
                                    2'd2: cache_w[6][95:64] = proc_wdata; 
                                    2'd1: cache_w[6][63:32] = proc_wdata;
                                    2'd0: cache_w[6][31:0]  = proc_wdata;
                                    default: cache_w[6]     = cache_r[6];
                                endcase
                                mem_wdata     = cache_w[6][127:0];
                                cache_w[6][154] = 1'd1;
                            end
                            3'd7:
                            begin
                                case(proc_addr[1:0])
                                    2'd3: cache_w[7][127:96]= proc_wdata;
                                    2'd2: cache_w[7][95:64] = proc_wdata; 
                                    2'd1: cache_w[7][63:32] = proc_wdata;
                                    2'd0: cache_w[7][31:0]  = proc_wdata;
                                    default: cache_w[7]     = cache_r[7];
                                endcase
                                mem_wdata    = cache_w[7][127:0];
                                cache_w[7][154] = 1'd1;
                            end
                            default:
                            begin
                                cache_w[0] = cache_r[0];
                            end //3 bits mux
                        endcase 
                    end
                end
                else begin
                    if(proc_read||proc_write) begin
                        state_w         = READ_STALL;
                        proc_stall_w    = 1'd1;
                        mem_read      = 1'd1;
                        mem_addr      = proc_addr[29:2];
                    end
                end                
            end
            READ_STALL:
            begin
                mem_read = 1'd1;
                mem_addr = proc_addr[29:2];
                proc_stall_w = 1'd1;
                if(mem_ready) begin
                    state_w                 = IDLE;
                    mem_read                = 1'd0;
                    mem_addr                = 28'd0;
                    case(index_r)
                        3'd0:
                        begin
                            cache_w[0][152:128] = tag;      //update tag
                            cache_w[0][127:0]   = mem_rdata;//update data
                            cache_w[0][153]     = 1'd1;
                        end
                        3'd1:
                        begin
                            cache_w[1][152:128] = tag;      //update tag
                            cache_w[1][127:0]   = mem_rdata;//update data
                            cache_w[1][153] = 1'd1;
                        end
                        3'd2:
                        begin
                            cache_w[2][152:128] = tag;      //update tag
                            cache_w[2][127:0]   = mem_rdata;//update data
                            cache_w[2][153] = 1'd1;
                        end
                        3'd3:
                        begin
                            cache_w[3][152:128] = tag;      //update tag
                            cache_w[3][127:0]   = mem_rdata;//update data
                            cache_w[3][153] = 1'd1;
                        end
                        3'd4:
                        begin
                            cache_w[4][152:128] = tag;      //update tag
                            cache_w[4][127:0]   = mem_rdata;//update data
                            cache_w[4][153] = 1'd1;
                        end
                        3'd5:
                        begin
                            cache_w[5][152:128] = tag;      //update tag
                            cache_w[5][127:0]   = mem_rdata;//update data
                            cache_w[5][153] = 1'd1;
                        end
                        3'd6:
                        begin
                            cache_w[6][152:128] = tag;      //update tag
                            cache_w[6][127:0]   = mem_rdata;//update data
                            cache_w[6][153] = 1'd1;
                        end
                        3'd7:
                        begin
                            cache_w[7][152:128] = tag;      //update tag
                            cache_w[7][127:0]   = mem_rdata;//update data
                            cache_w[7][153] = 1'd1;
                        end
                        default:
                        begin
                            cache_w[0][152:128] = tag;      //update tag
                            cache_w[0][127:0]   = mem_rdata;//update data
                            cache_w[0][153]     = 1'd0;
                        end
                    endcase
                    if(proc_write) begin //write hit
                        if(dirty_in_cache) begin
                            state_w     = WRITE_STALL_WRITE;
                            proc_stall_w= 1'd1;
                            mem_write   = 1'd1;
                            mem_addr    = proc_addr[29:2];
                        end      
                        else begin
                            proc_stall_w= 1'd0;
                        end
                        //update data in cache
                        case(index_w) //index
                            3'd0:
                            begin
                                case(proc_addr[1:0])
                                    2'd3: cache_w[0][127:96]= proc_wdata;
                                    2'd2: cache_w[0][95:64] = proc_wdata; 
                                    2'd1: cache_w[0][63:32] = proc_wdata;
                                    2'd0: cache_w[0][31:0]  = proc_wdata;
                                    default: cache_w[0]     = cache_r[0];
                                endcase
                                mem_wdata     = cache_w[0][127:0];
                                cache_w[0][154] = 1'd1;
                            end
                            3'd1:
                            begin
                                case(proc_addr[1:0])
                                    2'd3: cache_w[1][127:96]= proc_wdata;
                                    2'd2: cache_w[1][95:64] = proc_wdata; 
                                    2'd1: cache_w[1][63:32] = proc_wdata;
                                    2'd0: cache_w[1][31:0]  = proc_wdata;
                                    default: cache_w[1]     = cache_r[1];
                                endcase
                                mem_wdata    = cache_w[1][127:0];
                                cache_w[1][154] = 1'd1;
                            end
                            3'd2:
                            begin
                                case(proc_addr[1:0])
                                    2'd3: cache_w[2][127:96]= proc_wdata;
                                    2'd2: cache_w[2][95:64] = proc_wdata; 
                                    2'd1: cache_w[2][63:32] = proc_wdata;
                                    2'd0: cache_w[2][31:0]  = proc_wdata;
                                    default: cache_w[2]     = cache_r[2];
                                endcase
                                mem_wdata     = cache_w[2][127:0];
                                cache_w[2][154] = 1'd1;
                            end
                            3'd3:
                            begin
                                case(proc_addr[1:0])
                                    2'd3: cache_w[3][127:96]= proc_wdata;
                                    2'd2: cache_w[3][95:64] = proc_wdata; 
                                    2'd1: cache_w[3][63:32] = proc_wdata;
                                    2'd0: cache_w[3][31:0]  = proc_wdata;
                                    default: cache_w[3]     = cache_r[3];
                                endcase
                                mem_wdata     = cache_w[3][127:0];
                                cache_w[3][154] = 1'd1;
                            end
                            3'd4:
                            begin
                                case(proc_addr[1:0])
                                    2'd3: cache_w[4][127:96]= proc_wdata;
                                    2'd2: cache_w[4][95:64] = proc_wdata; 
                                    2'd1: cache_w[4][63:32] = proc_wdata;
                                    2'd0: cache_w[4][31:0]  = proc_wdata;
                                    default: cache_w[4]     = cache_r[4];
                                endcase
                                mem_wdata     = cache_w[4][127:0];
                                cache_w[4][154] = 1'd1;
                            end
                            3'd5:
                            begin
                                case(proc_addr[1:0])
                                    2'd3: cache_w[5][127:96]= proc_wdata;
                                    2'd2: cache_w[5][95:64] = proc_wdata; 
                                    2'd1: cache_w[5][63:32] = proc_wdata;
                                    2'd0: cache_w[5][31:0]  = proc_wdata;
                                    default: cache_w[5]     = cache_r[5];
                                endcase
                                mem_wdata     = cache_w[5][127:0];
                                cache_w[5][154] = 1'd1;
                            end
                            3'd6:
                            begin
                                case(proc_addr[1:0])
                                    2'd3: cache_w[6][127:96]= proc_wdata;
                                    2'd2: cache_w[6][95:64] = proc_wdata; 
                                    2'd1: cache_w[6][63:32] = proc_wdata;
                                    2'd0: cache_w[6][31:0]  = proc_wdata;
                                    default: cache_w[6]     = cache_r[6];
                                endcase
                                mem_wdata     = cache_w[6][127:0];
                                cache_w[6][154] = 1'd1;
                            end
                            3'd7:
                            begin
                                case(proc_addr[1:0])
                                    2'd3: cache_w[7][127:96]= proc_wdata;
                                    2'd2: cache_w[7][95:64] = proc_wdata; 
                                    2'd1: cache_w[7][63:32] = proc_wdata;
                                    2'd0: cache_w[7][31:0]  = proc_wdata;
                                    default: cache_w[7]     = cache_r[7];
                                endcase
                                mem_wdata    = cache_w[7][127:0];
                                cache_w[7][154] = 1'd1;
                            end
                            default:
                            begin
                                cache_w[0] = cache_r[0];
                            end //3 bits mux
                        endcase 
                    end
                end
            end
            WRITE_STALL_WRITE:
            begin
                mem_write   = 1'd1;
                mem_addr    = dirty_in_cache? {tag_in_cache, index_r}:proc_addr[29:2];
                mem_wdata   = cache_r[index_r][127:0];
                if(mem_ready) begin
                    state_w = IDLE;
                    if(dirty_in_cache) begin //just update memory
                        cache_w[index_r][154] = 1'd0;
                        mem_write             = 1'd0;
                        mem_addr              = 28'd0;
                    end
                    else begin
                        proc_stall_w    = 1'd0;
                        mem_write       = 1'd0;
                        mem_addr        = 28'd0;
                    end
                end  
            end
            default:
            begin
                state_w         = state_r;
                proc_stall_w    = proc_stall_r;
                mem_read     = 0;
                mem_write    = 0;
                mem_addr     = 0;
                mem_wdata    = 0;
                index_w         = index_r;
                for(idx = 0; idx <= 7; idx = idx+1) begin
                     cache_w[idx] = cache_r[idx];
                end
            end
        endcase
    end
//==== sequential circuit =================================
integer i;
always@( posedge clk ) begin
    if( proc_reset ) begin
        for(i = 0; i<=7; i = i+1) begin
            cache_r[i]  <= 154'd0;
        end
        state_r         <= 2'd0;
        proc_stall_r    <= 1'd0;
        index_r         <= 3'd0;
    end
    else begin
        for(i = 0; i<=7; i = i+1) begin
            cache_r[i]  <= cache_w[i];
        end
        state_r         <= state_w;
        proc_stall_r    <= proc_stall_w;
        index_r         <= index_w;
    end
end
endmodule