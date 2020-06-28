// Top module of your design, you cannot modify this module!!
`include "Decoder.v"
`include "ALUCtrl.v"
`include "ALU.v"
`include "Register.v"
`include "Imm_Gen.v"
`include "cache_dm.v"
`include "forwarding_unit.v"
`include "hazard_process.v"
`include "PC.v"
`include "Alignment.v"
module CHIP (	clk,
				rst_n,
//----------for slow_memD------------
				mem_read_D,
				mem_write_D,
				mem_addr_D,
				mem_wdata_D,
				mem_rdata_D,
				mem_ready_D,
//----------for slow_memI------------
				mem_read_I,
				mem_write_I,
				mem_addr_I,
				mem_wdata_I,
				mem_rdata_I,
				mem_ready_I,
//----------for TestBed--------------				
				DCACHE_addr, 
				DCACHE_wdata,
				DCACHE_wen
			);
input			clk, rst_n;
//--------------------------
output			mem_read_D;
output			mem_write_D;
output	[31:4]	mem_addr_D;
output	[127:0]	mem_wdata_D;
input	[127:0]	mem_rdata_D;
input			mem_ready_D;
//--------------------------
output			mem_read_I;
output			mem_write_I;
output	[31:4]	mem_addr_I;
output	[127:0]	mem_wdata_I;
input	[127:0]	mem_rdata_I;
input			mem_ready_I;
//----------for TestBed--------------
output	[29:0]	DCACHE_addr;
output	[31:0]	DCACHE_wdata;
output			DCACHE_wen;
//--------------------------

// wire declaration
wire        ICACHE_ren;
wire        ICACHE_wen;
wire [29:0] ICACHE_addr;
wire [31:0] ICACHE_wdata;
wire        ICACHE_stall;
wire [31:0] ICACHE_rdata;

wire        DCACHE_ren;
wire        DCACHE_wen;
wire [29:0] DCACHE_addr;
wire [31:0] DCACHE_wdata;
wire        DCACHE_stall;
wire [31:0] DCACHE_rdata;

//=========================================
	// Note that the overall design of your RISCV includes:
	// 1. pipelined RISCV processor
	// 2. data cache
	// 3. instruction cache


	RISCV_Pipeline i_RISCV(
		// control interface
		.clk            (clk)           , 
		.rst_n          (rst_n)         ,
//----------I cache interface-------		
		.ICACHE_ren     (ICACHE_ren)    ,
		.ICACHE_wen     (ICACHE_wen)    ,
		.ICACHE_addr    (ICACHE_addr)   ,
		.ICACHE_wdata   (ICACHE_wdata)  ,
		.ICACHE_stall   (ICACHE_stall)  ,
		.ICACHE_rdata   (ICACHE_rdata)  ,
//----------D cache interface-------
		.DCACHE_ren     (DCACHE_ren)    ,
		.DCACHE_wen     (DCACHE_wen)    ,
		.DCACHE_addr    (DCACHE_addr)   ,
		.DCACHE_wdata   (DCACHE_wdata)  ,
		.DCACHE_stall   (DCACHE_stall)  ,
		.DCACHE_rdata   (DCACHE_rdata)
	);
	

	cache D_cache(
        .clk        (clk)         ,
        .proc_reset (~rst_n)      ,
        .proc_read  (DCACHE_ren)  ,
        .proc_write (DCACHE_wen)  ,
        .proc_addr  (DCACHE_addr) ,
        .proc_rdata (DCACHE_rdata),
        .proc_wdata (DCACHE_wdata),
        .proc_stall (DCACHE_stall),
        .mem_read   (mem_read_D)  ,
        .mem_write  (mem_write_D) ,
        .mem_addr   (mem_addr_D)  ,
        .mem_wdata  (mem_wdata_D) ,
        .mem_rdata  (mem_rdata_D) ,
        .mem_ready  (mem_ready_D)
	);

	cache I_cache(
        .clk        (clk)         ,
        .proc_reset (~rst_n)      ,
        .proc_read  (ICACHE_ren)  ,
        .proc_write (ICACHE_wen)  ,
        .proc_addr  (ICACHE_addr) ,
        .proc_rdata (ICACHE_rdata),
        .proc_wdata (ICACHE_wdata),
        .proc_stall (ICACHE_stall),
        .mem_read   (mem_read_I)  ,
        .mem_write  (mem_write_I) ,
        .mem_addr   (mem_addr_I)  ,
        .mem_wdata  (mem_wdata_I) ,
        .mem_rdata  (mem_rdata_I) ,
        .mem_ready  (mem_ready_I)
	);
endmodule



module RISCV_Pipeline(
	clk, rst_n,
	ICACHE_ren, ICACHE_wen, ICACHE_addr, ICACHE_wdata, ICACHE_stall, ICACHE_rdata,
	DCACHE_ren, DCACHE_wen, DCACHE_addr, DCACHE_wdata, DCACHE_stall, DCACHE_rdata
	);
	input clk;
	input rst_n;
	//I_cache
	output ICACHE_ren;
	output ICACHE_wen; 
	output [29:0] ICACHE_addr; 
	output [31:0] ICACHE_wdata;
	input ICACHE_stall;
	input [31:0] ICACHE_rdata;
	//D_cache
	output DCACHE_ren;
	output DCACHE_wen; 
	output [29:0] DCACHE_addr; 
	output [31:0] DCACHE_wdata;
	input DCACHE_stall;
	input [31:0] DCACHE_rdata;

	reg [31:0] instruction, instruction_n;

	//PC
	wire signed [31:0] pc_in, pc_out, pc_in_tmp, pc_add_2, pc_add_4, pc_add_imm;
	reg signed [31:0] pc, pc_n, pc_mux, pc_add_4_id, pc_add_4_id_n, pc_add_imm_ex, pc_add_imm_ex_n;
	//Decoder
	wire [6:0] opcode;
	wire jalr, jal, branch, memread, memtoreg, memwrite, alusrc, regwrite;
	wire [1:0] aluop;
	//Register file
	wire [4:0] rs1, rs2, rd;
	wire [31:0] rs1_data, rs2_data;
	//immediate
	wire [31:0] instruction_wire;
	wire signed [31:0] immediate;
	//branch
	wire jump_or_not;
	wire branch_or_not;
	//hazard process
	wire hazard_stall, hazard_flush, hazard_mux;
	//instruction
	wire [2:0] funct3;
	wire funct7;

	//ALU
	reg [31:0] src1;
	wire [31:0] src2;
	wire [3:0] 	aluctrl;
	wire [31:0] result;
	wire zero;

	//WB
	wire [31:0] rd_data_wb_tmp, rd_data_wb;
	//ID/EX register
	reg jalr_ex, jal_ex, branch_ex, memread_ex, memtoreg_ex, memwrite_ex, alusrc_ex, regwrite_ex, funct3_ex;
	reg [3:0] aluctrl_ex, aluctrl_ex_n;
	reg jalr_ex_n, jal_ex_n, branch_ex_n, memread_ex_n, memtoreg_ex_n, memwrite_ex_n, alusrc_ex_n, regwrite_ex_n, funct3_ex_n;
	reg [31:0]rs1_data_ex, rs2_data_ex, immediate_ex;
	reg [4:0] rs1_ex, rs2_ex, rd_ex;
	reg [31:0]rs1_data_ex_n, rs2_data_ex_n, immediate_ex_n;
	reg [4:0] rs1_ex_n, rs2_ex_n, rd_ex_n; 
	reg [31:0] pc_add_4_ex, pc_add_4_ex_n;
	//EX 
	reg [31:0] src2_tmp;
	wire [1:0] ForwardA, ForwardB;
	wire rs1_select ; 
	wire is_mem, is_ex ;
	//EX/MEM register
	reg memtoreg_mem_n, regwrite_mem_n, memread_mem_n, memwrite_mem_n, jal_mem_n, jalr_mem_n; 
	reg memtoreg_mem, regwrite_mem, memread_mem, memwrite_mem, jal_mem, jalr_mem;
	reg [31:0] alu_result_mem, alu_result_mem_n;
	reg [31:0] src2_mem, src2_mem_n;
	reg [4:0] rd_mem, rd_mem_n;
	reg [31:0] rs2_data_mem, rs2_data_mem_n ;
	reg [31:0] pc_add_4_mem, pc_add_4_mem_n;
	//MEM/WB register
	reg memread_wb, regwrite_wb, memtoreg_wb, jal_wb, jalr_wb; 
	reg [31:0] alu_result_wb, mem_result_wb;
	reg [4:0]  rd_wb;
	reg memread_wb_n, regwrite_wb_n, memtoreg_wb_n, jal_wb_n, jalr_wb_n; 
	reg [31:0] alu_result_wb_n, mem_result_wb_n;
	reg [4:0]  rd_wb_n;
	reg [31:0] pc_add_4_wb, pc_add_4_wb_n;

	//compress instruction
	wire is_compress;
	wire [31:0] instruction_align;
	wire stall;
	assign stall = ICACHE_stall || DCACHE_stall;

	// assign ICACHE_ren 	= (jal || jalr || branch_or_not)? 1'd0: 1'd1;
	assign ICACHE_ren 	= 1'd1;
	assign ICACHE_wen 	= 0; 
	assign ICACHE_addr 	= pc_out[31:2]; 
	assign ICACHE_wdata = 0;
	// DCACHE_assignment
	assign DCACHE_ren 	= memread_mem;
	assign DCACHE_wen 	= memwrite_mem;
	assign DCACHE_addr 	= alu_result_mem[31:2];
	assign DCACHE_wdata = {{rs2_data_mem[7:0]},{rs2_data_mem[15:8]},{rs2_data_mem[23:16]},{rs2_data_mem[31:24]}}; 
	
	assign branch_or_not= (branch_ex & funct3_ex & ~zero)|(branch_ex & ~(funct3_ex) & zero);
	//assignment
	assign instruction_wire = instruction;

	assign pc_add_4		= pc_out + 32'd4;
	assign pc_add_2 	= pc_out + 32'd2;
	// assign pc_mux 		= jalr?(rs1_select?(is_ex?result:(is_mem?((jalr_mem|jal_mem)?pc_add_4_mem:alu_result_mem):((jalr_wb| jal_wb)?pc_add_4_wb:alu_result_wb))):rs1_data):pc;
	assign pc_add_imm 	= $signed(pc_mux) + $signed(immediate);

	//w/o branch_prediction
	assign pc_in_tmp 	= branch_or_not? pc_add_imm_ex: ((jal|jalr)? pc_add_imm: (is_compress? pc_add_2: pc_add_4));
	assign pc_in 		= ((ICACHE_stall | DCACHE_stall)) ? pc_out: pc_in_tmp;


	//assign instruction
	assign opcode 	= instruction[6:0];
    assign rs1 		= instruction[19:15];
    assign rs2 		= instruction[24:20];
    assign rd 		= instruction[11:7];
    assign funct3 	= instruction[14:12];
    assign funct7 	= instruction[30];

    //pc_mux 
    always@(*) begin
    	if(jalr) begin
    		if(rs1_select) begin
    			if(is_ex) 					pc_mux = result;
    			else if(is_mem) begin
    				if(jalr_mem || jal_mem) pc_mux = pc_add_4_mem;
    				else 	 				pc_mux = alu_result_mem;
    			end
    			else begin
    				if(jalr_wb || jal_wb) 	pc_mux = pc_add_4_wb;
    				else 					pc_mux = alu_result_wb;
    			end
    		end
    		else begin
    			pc_mux = rs1_data;
    		end
    	end
    	else pc_mux = pc;
    end
    
	always@(*) begin
		if((ICACHE_stall | DCACHE_stall)) begin
				pc_add_4_id_n 	= pc_add_4_id;
				pc_n 			= pc;
				instruction_n 	= instruction;
		end
		else if(hazard_flush) begin
			pc_add_4_id_n 	= 32'd0;
			pc_n 			= 32'd0;
			instruction_n 	= 32'd0;
		end
		else begin
			//instruction_n 	= {{ICACHE_rdata[7:0]},{ICACHE_rdata[15:8]},{ICACHE_rdata[23:16]},{ICACHE_rdata[31:24]}};
			instruction_n 	= instruction_align;
			pc_n 			= pc_out;
			pc_add_4_id_n	= is_compress? pc_add_2: pc_add_4;
		end
	end

	always@(posedge clk)
	begin
		if(~rst_n) begin
			pc 			<= 0;
			instruction <= 32'd0;
			pc_add_4_id <= 32'd0;
		end
		else begin
			pc 			<= pc_n;
			instruction <= instruction_n;
			pc_add_4_id <= pc_add_4_id_n;
		end
	end

	
	//ID/EX register
	always@(*) begin
		if((ICACHE_stall | DCACHE_stall )) begin //hazard_flush
			jalr_ex_n 		= jalr_ex;
			jal_ex_n 		= jal_ex;
			branch_ex_n 	= branch_ex; 
			memread_ex_n 	= memread_ex;
			memtoreg_ex_n 	= memtoreg_ex;
			memwrite_ex_n 	= memwrite_ex;
			alusrc_ex_n 	= alusrc_ex;
			aluctrl_ex_n  	= aluctrl_ex;
			regwrite_ex_n 	= regwrite_ex;
			rs1_data_ex_n 	= rs1_data_ex;
			rs2_data_ex_n 	= rs2_data_ex;
			rs1_ex_n 		= rs1_ex;
			rs2_ex_n 		= rs2_ex;
			rd_ex_n  		= rd_ex;
			immediate_ex_n	= immediate_ex;
			pc_add_4_ex_n   = pc_add_4_ex;
			funct3_ex_n 	= funct3_ex;
			pc_add_imm_ex_n = pc_add_imm_ex;
 		end
		else begin
			jalr_ex_n 		= hazard_mux ? 0 : jalr;
			jal_ex_n 		= hazard_mux ? 0 : jal;
			branch_ex_n 	= hazard_mux ? 0 : branch; 
			memread_ex_n 	= hazard_mux ? 0 : memread;
			memtoreg_ex_n 	= hazard_mux ? 0 : memtoreg;
			memwrite_ex_n 	= hazard_mux ? 0 : memwrite;
			alusrc_ex_n 	= hazard_mux ? 0 : alusrc;
			aluctrl_ex_n 	= hazard_mux ? 0 : aluctrl; 
			regwrite_ex_n 	= hazard_mux ? 0 : regwrite;
			rs1_data_ex_n 	= rs1_data;
			rs2_data_ex_n 	= rs2_data;
			rs1_ex_n 		= rs1;
			rs2_ex_n 		= rs2;
			rd_ex_n         = rd;
			immediate_ex_n	= immediate;
			pc_add_4_ex_n   = pc_add_4_id;
			funct3_ex_n 	= funct3[0]; //for BEQ == 0 ;BNE == 1 
			pc_add_imm_ex_n = pc_add_imm;
		end
	end

	always@(posedge clk) begin
		if(~rst_n) begin
			jalr_ex 		<= 0;
			jal_ex 			<= 0;
			branch_ex 		<= 0; 
			memread_ex 		<= 0;
			memtoreg_ex 	<= 0;
			memwrite_ex 	<= 0;
			alusrc_ex 		<= 0;
			aluctrl_ex  	<= 0;
			regwrite_ex 	<= 0;
			rs1_data_ex 	<= 0;
			rs2_data_ex 	<= 0;
			rs1_ex 			<= 0;
			rs2_ex 			<= 0;
			rd_ex       	<= 0;
			immediate_ex 	<= 0;
			pc_add_4_ex 	<= 0;
			funct3_ex 		<= 0;
			pc_add_imm_ex 	<= 0;

		end
		else begin
			jalr_ex 		<= jalr_ex_n;
			jal_ex 			<= jal_ex_n;
			branch_ex 		<= branch_ex_n; 
			memread_ex 		<= memread_ex_n;
			memtoreg_ex 	<= memtoreg_ex_n;
			memwrite_ex 	<= memwrite_ex_n;
			alusrc_ex 		<= alusrc_ex_n;
			aluctrl_ex 		<= aluctrl_ex_n; 
			regwrite_ex 	<= regwrite_ex_n;
			rs1_data_ex 	<= rs1_data_ex_n;
			rs2_data_ex 	<= rs2_data_ex_n;
			rs1_ex 			<= rs1_ex_n;
			rs2_ex 			<= rs2_ex_n;
			rd_ex 			<= rd_ex_n;
			immediate_ex 	<= immediate_ex_n;
			pc_add_4_ex 	<= pc_add_4_ex_n;
			funct3_ex 		<= funct3_ex_n;
			pc_add_imm_ex 	<= pc_add_imm_ex_n;
 		end
	end 

	//EX
	assign src2 = alusrc_ex? immediate_ex: src2_tmp;
	always@(*) begin
		case(ForwardA)
			2'b00:	src1 = rs1_data_ex;
			2'b01:	src1 = rd_data_wb;
			2'b10:	src1 = alu_result_mem;
			default: src1 = 0;
		endcase

		case(ForwardB)
            2'b00:  src2_tmp = rs2_data_ex;
            2'b01:  src2_tmp = rd_data_wb;
            2'b10:  src2_tmp = alu_result_mem;
            2'b11:  src2_tmp = rs2_data_ex;
            default: src2_tmp = 0;
        endcase
	end

	 
	//EX/MEM register
	always@(*) begin
		if((ICACHE_stall | DCACHE_stall )) begin //hazard_flush
			memtoreg_mem_n 	= memtoreg_mem;
			regwrite_mem_n 	= regwrite_mem;
			memread_mem_n	= memread_mem;
			memwrite_mem_n 	= memwrite_mem;
			jal_mem_n      	= jal_mem;
			jalr_mem_n     	= jalr_mem;
			alu_result_mem_n= alu_result_mem;
			src2_mem_n     	= src2_mem;
			rd_mem_n       	= rd_mem;
			pc_add_4_mem_n 	= pc_add_4_mem; 
			rs2_data_mem_n 	= rs2_data_mem; 
		end
		else begin
			memtoreg_mem_n = memtoreg_ex;
			regwrite_mem_n = regwrite_ex;
			memread_mem_n  = memread_ex;
			memwrite_mem_n = memwrite_ex;
			jal_mem_n      = jal_ex;
			jalr_mem_n     = jalr_ex;
			alu_result_mem_n = result;
			src2_mem_n     = src2;
			rd_mem_n       = rd_ex;
			pc_add_4_mem_n = pc_add_4_ex;
			rs2_data_mem_n = src2_tmp;
		end
	end

	always@(posedge clk) begin
		if(~rst_n) begin
			memtoreg_mem 	<= 0;
			regwrite_mem 	<= 0;
			memread_mem	 	<= 0;
			memwrite_mem 	<= 0;
			jal_mem      	<= 0;
			jalr_mem     	<= 0;
			alu_result_mem  <= 0;
			src2_mem     	<= 0;
			rd_mem       	<= 0;
			pc_add_4_mem 	<= 0;
			rs2_data_mem 	<= 0;
		end
		else begin
			memtoreg_mem 	<= memtoreg_mem_n;
			regwrite_mem 	<= regwrite_mem_n;
			memread_mem	 	<= memread_mem_n;
			memwrite_mem 	<= memwrite_mem_n;
			jal_mem      	<= jal_mem_n;
			jalr_mem     	<= jalr_mem_n;
			alu_result_mem  <= alu_result_mem_n;
			src2_mem     	<= src2_mem_n;
			rd_mem       	<= rd_mem_n;
			pc_add_4_mem 	<= pc_add_4_mem_n;
			rs2_data_mem 	<= rs2_data_mem_n;
		end
	end
	
	//MEM/WB register
	always@(*) begin
		if((ICACHE_stall | DCACHE_stall )) begin //hazard_flush
			memread_wb_n 	= memread_wb;
			regwrite_wb_n	= regwrite_wb;
			memtoreg_wb_n	= memtoreg_wb;
			jal_wb_n     	= jal_wb;
			jalr_wb_n    	= jalr_wb;
			alu_result_wb_n = alu_result_wb;
			mem_result_wb_n	= mem_result_wb;
			pc_add_4_wb_n   = pc_add_4_wb;
			rd_wb_n     	= rd_wb ;
		end
		else begin
			memread_wb_n 	= memread_mem;
			regwrite_wb_n	= regwrite_mem;
			memtoreg_wb_n	= memtoreg_mem;
			jal_wb_n     	= jal_mem;
			jalr_wb_n    	= jalr_mem;
			alu_result_wb_n = alu_result_mem;
			mem_result_wb_n	= {{DCACHE_rdata[7:0]},{DCACHE_rdata[15:8]},{DCACHE_rdata[23:16]},{DCACHE_rdata[31:24]}};
			pc_add_4_wb_n   = pc_add_4_mem;
			rd_wb_n			= rd_mem;
		end
	end

	always@(posedge clk) begin
		if(~rst_n) begin
			memread_wb 		<= 0;
			regwrite_wb		<= 0;
			memtoreg_wb		<= 0;
			jal_wb     		<= 0;
			jalr_wb    		<= 0;
			alu_result_wb 	<= 0;
			mem_result_wb	<= 0;
			pc_add_4_wb     <= 0;  
			rd_wb 			<= 0;
		end
		else begin
			memread_wb 		<= memread_wb_n;
			regwrite_wb		<= regwrite_wb_n;
			memtoreg_wb		<= memtoreg_wb_n;
			jal_wb     		<= jal_wb_n;
			jalr_wb    		<= jalr_wb_n;
			alu_result_wb 	<= alu_result_wb_n;
			mem_result_wb	<= mem_result_wb_n;
			pc_add_4_wb     <= pc_add_4_wb_n; 
			rd_wb 			<= rd_wb_n;
		end
	end
	
	assign rd_data_wb_tmp 	= memtoreg_wb? mem_result_wb: alu_result_wb;
	assign rd_data_wb 		= (jal_wb | jalr_wb)? pc_add_4_wb: rd_data_wb_tmp;

	//assign wire for submodule
	wire [4:0] rd_mem_wire, rd_wb_wire, rs1_ex_wire, rs2_ex_wire, rd_ex_wire;
	wire memread_mem_wire, memread_ex_wire, memread_wb_wire, regwrite_ex_wire, regwrite_mem_wire, regwrite_wb_wire;
	wire branch_flag, jump_flag;
	wire [3:0] aluctrl_ex_wire;

	assign rd_mem_wire 		= rd_mem;
	assign rd_wb_wire		= rd_wb;
	assign rd_ex_wire 		= rd_ex;
	assign memread_mem_wire = memread_mem;
	assign memread_ex_wire 	= memread_ex;
	assign memread_wb_wire	= memread_wb;
	assign jump_flag 		= jal || jalr;
	assign branch_flag		= branch_or_not;
	assign rs1_ex_wire 		= rs1_ex;
	assign rs2_ex_wire 		= rs2_ex;
	assign regwrite_ex_wire = regwrite_ex;
	assign regwrite_mem_wire= regwrite_mem;
	assign regwrite_wb_wire = regwrite_wb;
	assign aluctrl_ex_wire 	= aluctrl_ex;


	//submodule
	PC PC(.clk(clk), .rst_n(rst_n), .pc_in(pc_in), .pc_out(pc_out), .hazard_stall(hazard_stall));
	Decoder Decoder(.opcode(opcode), .jalr(jalr), .jal(jal), .branch(branch), .memread(memread), .memtoreg(memtoreg), .memwrite(memwrite), .alusrc(alusrc), .regwrite(regwrite), .aluop(aluop));	Registers Registers(.clk(clk), .rst_n(rst_n), .regwrite(regwrite_wb), .rs1(rs1), .rs2(rs2), .rd(rd_wb_wire), .rd_data(rd_data_wb), .rs1_data(rs1_data), .rs2_data(rs2_data));
	Imm_Gen Imm_Gen(.instr(instruction_wire), .immediate(immediate));
	hazard_process hazard_process(.jal(jal), .jalr(jalr), .ID_EX_rt(rd_ex), .IF_ID_rs1(rs1), .IF_ID_rs2(rs2), .EX_MEM_rt(rd_mem_wire),.MEM_WB_rt(rd_wb_wire),.EX_MEM_memread(memread_mem_wire), .ID_EX_memread(memread_ex_wire), .MEM_WB_memread(memread_wb_wire),.IF_ID_op(opcode), .hazard_mux(hazard_mux), .branch_flag(branch_flag), .jump_flag(jump_flag), .hazard_stall(hazard_stall), .hazard_flush(hazard_flush));
	forwarding_unit forwarding_unit(.is_ex(is_ex), .rs1(rs1), .rs2(rs2), .ID_EX_rs1(rs1_ex_wire), .ID_EX_rs2(rs2_ex_wire), .ID_EX_rd(rd_ex_wire), .EX_MEM_rd(rd_mem_wire), .MEM_WB_rd(rd_wb_wire), .jalr(jalr),.ID_EX_regwrite(regwrite_ex_wire), .EX_MEM_regwrite(regwrite_mem_wire), .MEM_WB_regwrite(regwrite_wb_wire), .rs1_select(rs1_select), .EX_MEM_rs1_control(ForwardA), .EX_MEM_rs2_control(ForwardB), .is_mem(is_mem));	
	ALU ALU(.src1(src1), .src2(src2), .aluctrl(aluctrl_ex_wire), .result(result), .zero(zero));
	ALUCtrl ALUCtrl(.aluop(aluop), .funct3(funct3), .funct7(funct7), .aluctrl(aluctrl));
	Alignment Alignment(.clk(clk), .rst_n(rst_n), .jump(jal||jalr||branch_or_not), .stall(stall),.hazard_flush(hazard_flush), .cache_input(ICACHE_rdata), .instruction_o(instruction_align), .is_compress_o(is_compress));
endmodule 