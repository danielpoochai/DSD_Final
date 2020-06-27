module cache_read(
    clk,
    proc_reset,
    // proc_read,
    proc_addr,
    proc_rdata,
    proc_stall,
    //L2_interface
    // L2_read_I,
    L2_addr_I,
    L2_rdata_I,
    L2_ready_I,
    mem_rdata_I
);
    
//==== input/output definition ============================
    input          clk;
    // processor interface
    input          proc_reset;
    // input          proc_read;
    input   [29:0] proc_addr;
    output         proc_stall;
    output  [31:0] proc_rdata;
    // L2 interface
    input  [31:0]  L2_rdata_I;
    input          L2_ready_I;
    // output         L2_read; 
    output  [29:0] L2_addr_I;

    input [127:0]  mem_rdata_I;
//====parameters   ========================================
    localparam IDLE             = 1'd0;
    localparam READ_STALL       = 1'd1;
    // localparam WRITE_STALL_WRITE= 2'd2;
//==== wire/reg definition ================================
    //state reg
    reg state_r, state_w;
    //cache reg 8 x (25+ 32x4) = 8 x 153 
    reg [153:0] cache_r[0:7] ,cache_w[0:7]; //format: dirty/v/tag/word3/word2/word1/word0
    //output reg
    reg proc_stall_r, proc_stall_w;
    reg [31:0] proc_rdata; 

    //index tag wire                                     //can be spare for area 
    wire [2:0] index;
    wire [24:0] tag, tag_in_cache;
    wire valid_in_cache;

//==== Assignment =========================================
    //assign tag data1 data2 data3 data4                //can be spare for area
    assign index            = proc_addr[4:2];           
    assign tag              = proc_addr[29:5];
    assign tag_in_cache     = cache_r[index][152:128];
    assign valid_in_cache   = cache_r[index][153];
    //output
    assign proc_stall   = proc_stall_w;
    // assign L2_read_I    = proc_read;
    assign L2_addr_I    = proc_addr;

//==== combinational circuit ==============================
    integer idx; //for cache update
    always@(*) begin 
        state_w         = state_r;
        proc_stall_w    = proc_stall_r;
        proc_rdata      = 32'd0;
        for(idx = 0; idx <= 7; idx = idx+1) begin
             cache_w[idx] = cache_r[idx];
        end

        case(state_r) 
            IDLE:
            begin
                if(tag == tag_in_cache) begin //25 bits 
                    if(valid_in_cache) begin

                        proc_stall_w    = 1'd0;
            
                        case(proc_addr[1:0]) 
                            2'd3: proc_rdata = cache_r[index][127:96]; //word0
                            2'd2: proc_rdata = cache_r[index][95:64];  //word1 
                            2'd1: proc_rdata = cache_r[index][63:32];  //word2
                            2'd0: proc_rdata = cache_r[index][31:0];   //word3
                            default: proc_rdata = 32'd0;
                        endcase
                    end
                    else begin         //not valid   
                        if(L2_ready_I) begin
                            proc_stall_w = 1'd0;
                            proc_rdata   = L2_rdata_I;
                        end
                        else begin
                            proc_stall_w    = 1'd1;
                            state_w         = READ_STALL;
                            //update valid bit
                            cache_w[index][153] = 1'd1;
                        end    
                    end
                end
                else begin
                        if(L2_ready_I) begin
                            proc_stall_w = 1'd0;
                            proc_rdata   = L2_rdata_I;
                        end
                        else begin
                            proc_stall_w    = 1'd1;
                            state_w         = READ_STALL;
                            //update valid bit
                            cache_w[index][153] = 1'd1;
                        end
                end                
            end
            READ_STALL:
            begin
                if(L2_ready_I) begin
                    state_w                 = IDLE;
                    proc_stall_w            = 1'd1;
                    cache_w[index][152:128] = tag;      //update tag
                    cache_w[index][127:0]   = mem_rdata_I;//update data
                end
            end
            default:
            begin
                state_w         = state_r;
                proc_stall_w    = proc_stall_r;
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
            cache_r[i]  <= 153'd0;
        end
        state_r         <= 1'd0;
        proc_stall_r    <= 1'd0;
    end
    else begin
        for(i = 0; i<=7; i = i+1) begin
            cache_r[i]  <= cache_w[i];
        end
        state_r         <= state_w;
        proc_stall_r    <= proc_stall_w;
    end
end
endmodule