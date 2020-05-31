// Top module of your design, you cannot modify this module!!
`include "Decoder.v"
`include "ALUCtrl.v"
`include "ALU.v"
`include "Register.v"
`include "Imm_Gen.v"
`include "cache.v"
`include "Branch_Prediction.v"
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

	wire flush;
	reg [31:0] instrction, instruction_n;

	//PC
	wire stall_pc;
	wire [31:0] pc, pc_in, pc_out, pc_in_tmp, pc_mux, pc_add_4, pc_add_imm;
	//Decoder
	wire [6:0] opcode;
	wire jalr, jal, branch, memread, memtoreg, memwrite, alusrc, regwrite, flush;
	wire [1:0] aluop;
	//Register file
	wire [4:0] rs1, rs2, rd;
	wire [31:0] rd_data;
	wire [31:0] rs1_data, rs2_data;
	//immediate
	wire [31:0] instruction_wire;
	wire [31:0] immediate
	//branch
	wire equal_or_not;
	wire rs1_data_equal_rs2_data;
	wire branch_or_not;
	//hazard process
	wire [4:0] ID/EX_rt, IF/ID_rs1, IF/ID_rs2, EX/MEM_rt;
	wire EX/MEM_memread, ID/EX_memread, branch_flag, hazard_stall, hazard_flush, stall_lwbranch;
	//instruction
	wire [2:0] funct3;
	wire funct7;

	//ALU
	wire [31:0] src1, src2;
	wire [3:0] 	aluctrl;
	wire [31:0] result;

	//branch
	assign rs1_data_equal_rs2_data = (rs1_data == rs2_data);
	assign equal_or_not = ((branch & funct3[0] & ~(rs1_data_equal_rs2_data))|(branch & ~(funct3[0]) & rs1_data_equal_rs2_data));

	//assignment
	assign instruction_wire = instruction;
	assign pc_add_4		= pc_out + 32'd4;
	assign pc_mux 		= jalr? rs1_data: pc;
	assign pc_add_imm 	= pc_mux + immediate;
	//w/o branch_prediction
	assign pc_in_tmp 	= ((jal|jalr)|branch) ? pc_add_imm: pc_add_4;
	assign pc_in 		= (ICACHE_stall | DCACHE_stall) ? pc_out: pc_in_tmp;
	//w branch_prediction
	// assign pc_in 		= ((jal|jalr)|branch_or_not) ? pc_add_imm: pc_add_4;

	//assign instruction
	assign opcode 	= instruction[6:0];
    assign rs1 		= instruction[19:15];
    assign rs2 		= instruction[24:20];
    assign rd 		= instruction[11:7];
    assign funct3 	= instruction[14:12];
    assign funct7 	= instruction[30];

	//IF/ID 
	always@(*) begin
		if(flush) instruction_n = 32'd0;
		else begin
			if(ICACHE_stall | DCACHE_stall) instruction_n = instruction;
			else instruction_n = {{mem_rdata_I[7:0]},{mem_rdata_I[15:8]},{mem_rdata_I[23:16]},{mem_rdata_I[31:24]}};
		end
	end

	always@(posedge clk)begin
		if(~rst_n) begin
			instruction <= 32'd0;
		end
		else begin
			instruction <= instruction_n;
		end
	end

	//ID/EX register
	reg jalr_ex, jal_ex, branch_ex, memread_ex, memtoreg_ex, memwrite_ex, alusrc_ex, regwrite_ex, flush_ex, aluctrl_ex;
	reg jalr_ex_n, jal_ex_n, branch_ex_n, memread_ex_n, memtoreg_ex_n, memwrite_ex_n, alusrc_ex_n, regwrite_ex_n, flush_ex_n, aluctrl_ex_n;
	reg [1:0] aluop_ex, aluop_ex_n;
	reg [31:0]rs1_data_ex, rs2_data_ex, immediate_ex;
	reg [4:0] rs1_ex, rs2_ex;
	reg [31:0]rs1_data_ex_n, rs2_data_ex_n, immediate_ex_n;; 
	reg [4:0] rs1_ex_n, rs2_ex_n; 

	always@(*) begin
		if(ICACHE_stall | DCACHE_stall) begin
			jalr_ex_n 		<= jalr_ex;
			jal_ex_n 		<= jal_ex;
			branch_ex_n 	<= branch_ex; 
			memread_ex_n 	<= memread_ex;
			memtoreg_ex_n 	<= memtoreg_ex;
			memwrite_ex_n 	<= memwrite_ex;
			alusrc_ex_n 	<= alusrc_ex;
			aluctrl_ex_n  	<= aluctrl_ex;
			regwrite_ex_n 	<= regwrite_ex;
			flush_ex_n 		<= flush_ex;
			rs1_data_ex_n 	<= rs1_data_ex;
			rs2_data_ex_n 	<= rs2_data_ex;
			rs1_ex_n 		<= rs1_ex;
			rs2_ex_n 		<= rs2_ex;
			immediate_ex_n	<= immediate_ex;
		end
		else begin
			jalr_ex_n 		<= jalr;
			jal_ex_n 		<= jal;
			branch_ex_n 	<= branch; 
			memread_ex_n 	<= memread;
			memtoreg_ex_n 	<= memtoreg;
			memwrite_ex_n 	<= memwrite;
			alusrc_ex_n 	<= alusrc;
			aluctrl_ex_n 	<= aluctrl; 
			regwrite_ex_n 	<= regwrite;
			flush_ex_n 		<= flush;
			rs1_data_ex_n 	<= rs1_data;
			rs2_data_ex_n 	<= rs2_data;
			rs1_ex_n 		<= rs1;
			rs2_ex_n 		<= rs2;
			immediate_ex_n	<= immediate;
		end
	end

	always@(posedge clk) begin
		if(~rst_n) begin
			jalr_ex 	<= 0;
			jal_ex 		<= 0;
			branch_ex 	<= 0; 
			memread_ex 	<= 0;
			memtoreg_ex <= 0;
			memwrite_ex <= 0;
			alusrc_ex 	<= 0;
			aluctrl_ex  <= 0;
			regwrite_ex <= 0;
			flush_ex 	<= 0;
			rs1_data_ex <= 0;
			rs2_data_ex <= 0;
			rs1_ex 		<= 0;
			rs2_ex 		<= 0;
			immediate_ex<= 0;

		end
		else begin
			jalr_ex 	<= jalr_ex_n;
			jal_ex 		<= jal_ex_n;
			branch_ex 	<= branch_ex_n; 
			memread_ex 	<= memread_ex_n;
			memtoreg_ex <= memtoreg_ex_n;
			memwrite_ex <= memwrite_ex_n;
			alusrc_ex 	<= alusrc_ex_n;
			aluctrl_ex 	<= aluctrl_ex_n; 
			regwrite_ex <= regwrite_ex_n;
			flush_ex 	<= flush_ex_n;
			rs1_data_ex <= rs1_data_ex_n;
			rs2_data_ex <= rs2_data_ex_n;
			rs1_ex 		<= rs1_ex_n;
			rs2_ex 		<= rs2_ex_n;
			immediate_ex<= immediate_ex_n;
		end
	end 

	//EX 
	wire [31:0] src2_tmp;
	wire [1:0] ForwardA, ForwardB;
	assign src2_tmp = alusrc_ex? immediate_ex: rs2_data_ex;
	always@(*) begin
		case(ForwardA)
			2'b00:	src1 = rs1_data_ex;
			2'b01:	src1 = rd_data_wb;
			2'b10:	src1 = result_mem;
			default: src1 = 0;
		endcase

		case(ForwardB)
			2'b00:	src2 = src2_tmp;
			2'b01:	src2 = rd_data_wb;
			2'b10:	src2 = result_mem;
			default: src2 = 0;
		endcase
	end

	//EX/MEM register
	reg memtoreg_mem_n, regwrite_mem_n, memread_mem_n, memwrite_mem_n, jal_mem_n, jalr_mem_n; 
	reg memtoreg_mem, regwrite_mem, memread_mem, memwrite_mem, jal_mem, jalr_mem;
	reg [31:0] result_mem, result_mem_n;
	reg [31:0] src2_mem, src2_mem_n;
	reg [4:0] rd_mem, rd_mem_n;
	always@(*) begin
		if(ICACHE_stall | DCACHE_stall) begin
			memtoreg_mem_n 	<= memtoreg_mem;
			regwrite_mem_n 	<= regwrite_mem;
			memread_mem_n	<= memread_mem;
			memwrite_mem_n 	<= memwrite_mem;
			jal_mem_n      	<= jal_mem;
			jalr_mem_n     	<= jalr_mem;
			result_mem_n   	<= result_mem;
			src2_mem_n     	<= src2_mem;
			rd_mem_n       	<= rd_mem;

		end
		else begin
			memtoreg_mem_n <= memtoreg_ex;
			regwrite_mem_n <= regwrite_ex;
			memread_mem_n  <= memread_ex;
			memwrite_mem_n <= memwrite_ex;
			jal_mem_n      <= jal_ex;
			jalr_mem_n     <= jalr_ex;
			result_mem_n   <= result;
			src2_mem_n     <= src2;
			rd_mem_n       <= rd_ex;
		end
	end

	always@(posedge clk) begin
		if(~rst_n) begin
			memtoreg_mem <= 0;
			regwrite_mem <= 0;
			memread_mem	 <= 0;
			memwrite_mem <= 0;
			jal_mem      <= 0;
			jalr_mem     <= 0;
			result_mem   <= 0;
			src2_mem     <= 0;
			rd_mem       <= 0;
		end
		else begin
			memtoreg_mem <= memtoreg_mem_n;
			regwrite_mem <= regwrite_mem_n;
			memread_mem	 <= memread_mem_n;
			memwrite_mem <= memwrite_mem_n;
			jal_mem      <= jal_mem_n;
			jalr_mem     <= jalr_mem_n;
			result_mem   <= result_mem_n;
			src2_mem     <= src2_mem_n;
			rd_mem       <= rd_mem_n;
		end
	end
	//MEM
	assign DCACHE_ren 	= memread_mem;
	assign DCACHE_wen 	= memwrite_mem;
	assign DCACHE_addr 	= result_mem[29:0];
	assign DCACHE_wdata = scr2_mem;

	//MEM/WB register
	reg memread_wb, regwrite_wb, memtoreg_wb, jal_wb, jalr_wb; 
	reg [31:0] result_wb;


	//submodule
	PC PC(.clk(clk), .rst_n(rst_n), .pc_in(pc_in), .pc_out(pc_out), .stall_pc(stall_pc));
	Decoder Decoder(.hazard_flush(hazard_flush), .opcode(opcode), .jalr(jalr), .jal(jal), .branch(branch), .memread(memread), .memtoreg(memtoreg), .memwrite(memwrite), .alusrc(alusrc), .regwrite(regwrite), .flush(flush), .aluop(aluop));
	Registers Registers(.clk(clk), .rst_n(rst_n), .regwrite(regwrite), .rs1(rs1), .rs2(rs2), .rd(rd), .rd_data(rd_data), .rs1_data(rs1_data), .rs2_data(rs2_data));
	Imm_Gen Imm_Gen(.instr(instruction_wire), .immediate(immediate));
	Branch_Prediction Branch_Prediction(.clk(clk), .rst_n(rst_n), .equal_or_not(equal_or_not), .branch(branch), .branch_or_not(branch_or_not));
	hazard_process hazard_process(.ID/EX_rt(ID/EX_rt), .IF/ID_rs1(IF/ID_rs1), .IF/ID_rs2(IF/ID_rs2), .EX/MEM_memread(EX/MEM_memread), .ID/EX_memread(ID/EX_memread), .branch_flag(branch_flag), .hazard_stall(hazard_stall), .hazard_flush(hazard_flush), .stall_lwbranch(stall_lwbranch));
	ALU ALU(.src1(src1), .src2(src2), .aluctrl(aluctrl), .result(result));
	ALUCtrl ALUCtrl(.aluop(aluop), .funct3(funct3), .funct7(funct7), .aluctrl(aluctrl));
endmodule 
