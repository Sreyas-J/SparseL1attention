`timescale 1ns / 1ps

module tb_zRed;

    // -------------------------------------------------------------------------
    // Parameters
    // -------------------------------------------------------------------------
    // Reduced dimensions for easier simulation visualization
    parameter DATA_WIDTH = 32;
    parameter MAX_W_TB   = 4;  // Reduced from 256
    parameter MAX_H_TB   = 4;  // Reduced from 64
    parameter GRPS_TB    = (MAX_W_TB * 2) / MAX_H_TB;
    
    // -------------------------------------------------------------------------
    // Signals
    // -------------------------------------------------------------------------
    logic clk;
    logic val;
    logic [$clog2(MAX_H_TB):0] H;
    
    // DUT Interconnects
    // Note: Z is an unpacked array in the DUT
    logic [DATA_WIDTH-1:0] Z_in [0:MAX_W_TB*2-1]; 
    logic [$clog2(MAX_H_TB)-1:0] Zaddr_out [0:MAX_W_TB*2-1],addra[0:MAX_W_TB*2-1];
    logic [DATA_WIDTH-1:0] res [0:MAX_H_TB-1];
    logic done;

    // BRAM Control Signals (Testbench side)
//    logic tb_mode; // 1 = TB writing to BRAM, 0 = DUT reading BRAM
//    logic [DATA_WIDTH-1:0] tb_dina;
    logic [$clog2(MAX_H_TB)-1:0] tb_addra;
    logic tb_wea [0:MAX_W_TB*2-1];

    // -------------------------------------------------------------------------
    // Clock Generation
    // -------------------------------------------------------------------------
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100MHz
    end

    // -------------------------------------------------------------------------
    // BRAM Generation & Instantiation
    // -------------------------------------------------------------------------
    genvar i;
    generate
        for (i = 0; i < MAX_W_TB * 2; i++) begin : brams
            // BRAM Instance (Template provided)
            Q bram_inst (
                .clka(clk),
                .ena(1'b1),        // Always enabled
                .wea(1'b0),     // Write enable
                .addra(Zaddr_out[i]), // Address
                .dina(0),    // Data In (from TB)
                .douta(Z_in[i])  // Data Out (to DUT)
            );
        end
    endgenerate

    // -------------------------------------------------------------------------
    // DUT Instantiation
    // -------------------------------------------------------------------------
    zRed #(
        .DATA_WIDTH(DATA_WIDTH),
        .MAX_W(MAX_W_TB),
        .MAX_H(MAX_H_TB),
        .zero(32'h00000000)
    ) dut (
        .clk(clk),
        .val(val),
        .Z(Z_in),
        .H(H),
        .Zaddr(Zaddr_out),
        .res(res),
        .done(done)
    );

    // -------------------------------------------------------------------------
    // Main Test Process
    // -------------------------------------------------------------------------
    initial begin
        // 1. Initialization
//        tb_mode = 1; // TB controls BRAMs
        val = 0;
        H = MAX_H_TB;
//        tb_dina = 0;
//        tb_addra = 0;
//        for(int k=0; k<MAX_W_TB*2; k++) tb_wea[k] = 0;

        @(posedge clk);

        // 2. Load BRAMs with Data
        // We will fill BRAMs with values. 
        // For simplicity, we fill BRAM[i] Address[j] with (i+j).
//        for (int b = 0; b < MAX_W_TB * 2; b++) begin
//            for (int r = 0; r < MAX_H_TB; r++) begin
                
//                tb_addra = r;
//                tb_dina  = (b * 10) + r; // Unique data pattern
//                tb_wea[b] = 1;
                
//                @(posedge clk);
                
//                tb_wea[b] = 0; // Turn off WE for this BRAM
//            end
//        end

        // 3. Switch Control to DUT
//        tb_mode = 0;

        val <= 1;
        @(posedge clk);
        val <= 0;

        // 5. Wait for Completion
        wait(done);
        #50

        $finish;
    end

endmodule

