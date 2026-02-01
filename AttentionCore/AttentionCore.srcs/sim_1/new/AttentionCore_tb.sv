`timescale 1ns / 1ps

module AttentionCore_tb();

    // Parameters
    parameter DATA_WIDTH = 32;
    parameter MAX_H = 4; 
    parameter zero = $shortrealtobits(0.0);

    // Inputs
    logic clk;
    logic val;
    logic we,en;
    logic [DATA_WIDTH-1:0] Qin;
    logic [DATA_WIDTH-1:0] Kin; 
    logic [$clog2(MAX_H):0] H;
    logic [$clog2(MAX_H)-1:0] addr; // Dedicated write address signal
    logic [DATA_WIDTH-1:0] scale;

    // Outputs
    logic [DATA_WIDTH-1:0] s;
    logic sDone;

    // Instantiate UUT
    AttentionCore #(
        .DATA_WIDTH(DATA_WIDTH),
        .MAX_H(MAX_H),
        .zero(zero)
    ) uut (
        .clk(clk),
        .val(val),
        .en(en),
        .we(we),
        .addr(addr), // Updated port connection
        .Qin(Qin),
        .Kin(Kin), 
        .H(H),
        .scale(scale),
        .s(s),
        .sDone(sDone)
    );

    // Clock Generation
    always #5 clk = ~clk;

    initial begin
        // Initialize Signals
        clk = 0;
        val = 0;
        we = 0;
        en=1;
        addr = 0;
        H = MAX_H;
        scale = $shortrealtobits(-3.0); // Scale factor 1.0 for simplicity

        #100;

        // --- PHASE 1: WRITE DATA TO INTERNAL BRAMS ---
        // In this phase, we use 'addr' to specify where to store Q and K values
        @(posedge clk);
        we <= 1;
        
        for (int i = 0; i < MAX_H; i++) begin
            addr <= i;                      // Explicitly setting the write address
            Qin  <= $shortrealtobits(1.0 + i); 
            Kin  <= $shortrealtobits(0.5 * i); 
            @(posedge clk);
        end
        
        we <= 0;
        addr <= 0; // Reset address for the computation phase

//        #50;

        // --- PHASE 2: TRIGGER CALCULATION ---
        // During this phase, uut.cnt should take over the internal address bus
        @(posedge clk);
        val <= 1;
        
        @(posedge clk);
        val <= 0;
        // Wait for the pipeline to finish
        wait(sDone);
        
        #200;
        $finish;
    end

endmodule