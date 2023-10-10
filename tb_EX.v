module tb_EX();

reg clk;
    reg rst_n;
    reg en;
    reg stage_ID_EX__EX_regwrite;
    reg stage_ID_EX__EX_memtoreg;
    reg stage_ID_EX__EX_memread;
    reg stage_ID_EX__EX_memwrite;
    reg stage_ID_EX__EX_alusrc;
    reg [1:0] stage_ID_EX__EX_aluop;
    reg stage_ID_EX__EX_regdst;
    reg stage_ID_EX__EX_sys_en;
    reg [31:0]stage_ID_EX__EX_rs_data;
    reg [31:0]stage_ID_EX__EX_rt_data;
    reg [4:0]stage_ID_EX__EX_rs_id;
    reg [4:0]stage_ID_EX__EX_rt_id;
    reg [4:0]stage_ID_EX__EX_rd_id;
    reg [31:0]stage_ID_EX__EX_sign_ext;
    reg [2:0]stage_ID_EX__EX_funct3;
    reg sys__EX_done;
    wire stage_EX_MEM__MEM_regwrite;
    wire stage_EX_MEM__MEM_memtoreg;
    wire stage_EX_MEM__MEM_memread;
    wire stage_EX_MEM__MEM_memwrite;
    wire [31:0] stage_EX_MEM__MEM_alures;
    wire [31:0] stage_EX_MEM__MEM_store_data;
    wire [4:0]  stage_EX_MEM__MEM_rd_id;
    
    wire EX__HDUbr_regwrite;
    wire EX__HDU_memread;
    wire [4:0] EX__HDU_HDUbr_rd_id;
    wire  EX_stall_for_sys;

    reg  FU__EX_rs_wb;
    reg  FU__EX_rs_mem;
    reg  FU__EX_rt_wb;
    reg  FU__EX_rt_mem;
    reg [31:0]  WB__EX_for_help;
    reg [31:0]  MEM__EX_for_help;


    initial begin
        clk = 0;
        forever begin
            #1 clk = ~clk;
        end
    end

    initial begin
    rst_n = 0;
    #10
    rst_n = 1;
        for (int i =0 ; i < 10 ; i++) begin
            stage_ID_EX__EX_regwrite = $random;
            stage_ID_EX__EX_memtoreg = $random;
            stage_ID_EX__EX_memread = $random;
            stage_ID_EX__EX_memwrite = $random;
            stage_ID_EX__EX_alusrc = $random;
            stage_ID_EX__EX_aluop = $random;
            stage_ID_EX__EX_regdst = $random;
            stage_ID_EX__EX_sys_en =  = 0;
            stage_ID_EX__EX_rs_data = $random % 100;
            stage_ID_EX__EX_rt_data = $random % 100;
            stage_ID_EX__EX_rs_id = $random;
            stage_ID_EX__EX_rt_id = $random;
            stage_ID_EX__EX_rd_id = $random;
            stage_ID_EX__EX_sign_ext = $random % 100;
            stage_ID_EX__EX_funct3 = $random;
            sys__EX_done =  = 0;
            FU__EX_rs_wb = $random;
            FU__EX_rs_mem = $random;
            FU__EX_rt_wb = $random;
            FU__EX_rt_mem = $random;
            WB__EX_for_help = $random%100;
            MEM__EX_for_help = $random%100;
            #2;
        end
    end

endmodule