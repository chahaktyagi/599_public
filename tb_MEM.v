module tb_MEM();

    reg clk;
    reg rst_n;
    reg en;
    reg stage_EX_MEM__MEM_regwrite;
    reg stage_EX_MEM__MEM_memtoreg;
    reg stage_EX_MEM__MEM_memread;
    reg stage_EX_MEM__MEM_memwrite;
    reg [31:0] stage_EX_MEM__MEM_alures;  
    reg [31:0] stage_EX_MEM__MEM_store_data;
    reg [4:0]  stage_EX_MEM__MEM_rd_id;
    wire          MEM__HDUbr_memread;
    wire [31:0]   MEM__EX_for_help;
    wire [4:0]    MEM__FUbr_rd_id;
    wire          MEM__FU_FUbr_regwrite;
    wire      stage_MEM_WB__WB_memtoreg;
    wire      stage_MEM_WB__WB_regwrite;
    wire [`DATA_WIDTH-1:0] stage_MEM_WB__WB_memdata;
    wire [31:0] stage_MEM_WB__WB_regdata;
    wire [4:0]  stage_MEM_WB__WB_rd_id; 


  MEM DUT_MEM(.*);
  
    initial begin
        clk = 0;
        forever begin
            #1 clk = ~clk;
        end
    end

    initial begin
      $dumpfile("test.vcd");
      $dumpvars;
    rst_n = 0;
    #9
    rst_n = 1;
        for (int i =0 ; i < 10 ; i++) begin
          	en = $random;
            stage_EX_MEM__MEM_regwrite = $random;
            stage_EX_MEM__MEM_memtoreg = $random;
            stage_EX_MEM__MEM_memread = $random;
            stage_EX_MEM__MEM_memwrite = $random;
            stage_EX_MEM__MEM_alures = $random%10;
            stage_EX_MEM__MEM_store_data = $random%10;
            stage_EX_MEM__MEM_rd_id = $random;
            #2;
        end
      #2
      $finish;
    end

endmodule