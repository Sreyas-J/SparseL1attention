`timescale 1ns / 1ps

module Accumulator_tb();

    // Parameters
    parameter DATA_WIDTH = 32;
    parameter H = 64;
    parameter ZERO_VAL = $shortrealtobits(0.0);

    // Signals
    logic clk;
    logic val;
    logic [DATA_WIDTH-1:0] dataIn;
    logic [$clog2(H):0] count;
    logic [DATA_WIDTH-1:0] acc;
    logic done;

    // Instantiate the Unit Under Test (UUT)
    Accumulator #(
        .DATA_WIDTH(DATA_WIDTH),
        .MAX_H(H),
        .zero(ZERO_VAL)
    ) uut (.*); // Using .* to auto-connect signals with matching names

    // Clock Generation
    initial clk = 0;
    always #5 clk = ~clk;

    // Main Test Procedure
    initial begin
        // 1. Initialize
        val      <= 0;
        dataIn   <= ZERO_VAL;
        count    <= 0;
        
        repeat(5) @(posedge clk);

        // --- Test Case 1: Accumulate 4 values (1.0, 2.0, 3.0, 4.0) ---
        @(posedge clk);
        count <= 3; // Target count for 4 elements (0 to 3)
        val   <= 1;
        
        for (int i = 0; i <= 3; i++) begin
            dataIn <= $shortrealtobits(1.0 + shortreal'(i));
            @(posedge clk);
        end
        
        val    <= 0;
        dataIn <= ZERO_VAL;

        // Wait for hardware to finish
        wait(done);
        @(posedge clk);

        // --- Test Case 2: Accumulate 10 values (0.5, 1.5, ... 9.5) ---
        repeat(5) @(posedge clk);
        
        @(posedge clk);
        count <= 9;
        val   <= 1;
        
        for (int j = 0; j <= 9; j++) begin
            dataIn <= $shortrealtobits(0.5 + shortreal'(j));
            @(posedge clk);
        end
        
        val    <= 0;
        dataIn <= ZERO_VAL;

        wait(done);
        repeat(10) @(posedge clk);
        $finish;
    end

endmodule